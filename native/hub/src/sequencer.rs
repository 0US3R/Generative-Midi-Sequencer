use async_trait::async_trait;
use messages::prelude::{Actor, Address, Context, Handler, Notifiable};
use rinf::{DartSignal, RustSignal, SignalPiece, debug_print};
use serde::{Deserialize, Serialize};
use tokio::{spawn, task::JoinSet};

/// All commands in a single enum
#[derive(Clone, Debug, Deserialize, Serialize, DartSignal)]
pub enum SequencerCommand {
    // Sequencer commands
    ToggleStep {
        step_index: u8,
        pattern_index: u8,
    },
    SetStepNote {
        note: u8,
        step_index: u8,
        pattern_index: u8,
    },
    SetStepVelocity {
        velocity: u8,
        step_index: u8,
        pattern_index: u8,
    },
    ToggleStepSustain {
        step_index: u8,
        pattern_index: u8,
    },
}

#[derive(Deserialize, DartSignal)]
pub struct CreateActors;

/// Single unified actor

pub struct SequencerActor {
    _owned_tasks: JoinSet<()>,

    state: SequencerState, // Sequencer state
}

impl Actor for SequencerActor {}

pub async fn create_actor() {
    let start_receiver = CreateActors::get_dart_signal_receiver();
    start_receiver.recv().await;

    // Create actor contexts.
    let context = Context::new();
    let addr = context.address();

    // Spawn the actors.
    let actor = SequencerActor::new(addr.clone());
    actor.state.send_signal_to_dart();
    spawn(context.run(actor));
}

impl SequencerActor {
    pub fn new(self_addr: Address<Self>) -> Self {
        let mut _owned_tasks = JoinSet::new();
        _owned_tasks.spawn(Self::listen_to_dart_commands(self_addr.clone()));

        let actor = SequencerActor {
            _owned_tasks,
            state: SequencerState::new(),
        };
        return actor;
    }

    /// Single command handler with match statement
    async fn handle_command(&mut self, command: SequencerCommand) {
        match command {
            SequencerCommand::ToggleStep {
                step_index,
                pattern_index,
            } => {
                if let Some(pattern) = self.state.patterns.get_mut(pattern_index as usize) {
                    if let Some(step) = pattern.steps.get_mut(step_index as usize) {
                        step.active = !step.active;
                        debug_print!("Step {} toggled to: {}", step_index, step.active);
                        self.state.send_signal_to_dart();
                    }
                }
            }

            SequencerCommand::SetStepNote {
                note,
                step_index,
                pattern_index,
            } => {
                if let Some(pattern) = self.state.patterns.get_mut(pattern_index as usize) {
                    if let Some(step) = pattern.steps.get_mut(step_index as usize) {
                        step.note = note;
                        debug_print!("Step {} note set to: {}", step_index, note);
                    }
                }
            }

            SequencerCommand::SetStepVelocity {
                velocity,
                step_index,
                pattern_index,
            } => {
                if let Some(pattern) = self.state.patterns.get_mut(pattern_index as usize) {
                    if let Some(step) = pattern.steps.get_mut(step_index as usize) {
                        step.velocity = velocity;
                        debug_print!("Step {} velocity set to: {}", step_index, velocity);
                    }
                }
            }

            SequencerCommand::ToggleStepSustain {
                step_index,
                pattern_index,
            } => {
                if let Some(pattern) = self.state.patterns.get_mut(pattern_index as usize) {
                    if let Some(step) = pattern.steps.get_mut(step_index as usize) {
                        step.sustain = !step.sustain;
                        debug_print!("Step {} sustain toggled to: {}", step_index, step.sustain);
                    }
                }
            }
        }
    }

    async fn listen_to_dart_commands(mut self_addr: Address<Self>) {
        let receiver = SequencerCommand::get_dart_signal_receiver();
        while let Some(signal_pack) = receiver.recv().await {
            let _ = self_addr.notify(signal_pack.message).await;
        }
    }
}

#[async_trait]
impl Notifiable<SequencerCommand> for SequencerActor {
    async fn notify(&mut self, command: SequencerCommand, _: &Context<Self>) {
        self.handle_command(command).await;
    }
}

// Implementing the `Handler` trait
// allows an actor's loop to respond to a specific message type.
#[async_trait]
impl Handler<SequencerState> for SequencerActor {
    type Result = bool;
    async fn handle(&mut self, msg: SequencerState, _: &Context<Self>) -> bool {
        msg.send_signal_to_dart();
        false
    }
}

// Your existing data structures
#[derive(Debug, Clone, Serialize, RustSignal)]
pub struct SequencerState {
    patterns: Vec<SequencerPattern>,
}
impl SequencerState {
    fn new() -> Self {
        return Self {
            patterns: vec![SequencerPattern::new(); 4],
        };
    }
}

// Your existing data structures
#[derive(Debug, Clone, Serialize, SignalPiece)]
pub struct SequencerPattern {
    pub step_length: f32,
    pub steps_per_beat: i32,
    pub current_step: i32,
    pub num_steps: i32,
    pub steps: Vec<SequencerStep>,
}

impl SequencerPattern {
    pub fn new() -> Self {
        Self {
            step_length: 0.25,
            num_steps: 16,
            current_step: 0,
            steps: vec![SequencerStep::new(); 16],
            steps_per_beat: 4,
        }
    }
}

#[derive(Debug, Clone, Serialize, SignalPiece)]
pub struct SequencerStep {
    pub active: bool,
    pub sustain: bool,
    pub velocity: u8,
    pub note: u8,
}

impl SequencerStep {
    pub fn new() -> Self {
        SequencerStep {
            note: 60,
            velocity: 100,
            active: false,
            sustain: false,
        }
    }
}

use std::{usize};

use flutter_rust_bridge::frb;
use crate::{frb_generated::BaseRustState, sequencer::SequencerPattern, PlaybackEngine, SequencerEngine};


#[frb(ui_state)]
pub struct RustState {
    sequencer: SequencerEngine,
    playback: PlaybackEngine,
    // UI-specific state
    selected_screen: usize,
    selected_pattern_for_editing: usize,
    is_pattern_editor_open: bool,
    pattern: SequencerPattern,
}

impl RustState {
    pub fn new() -> Self {
        Self {
            sequencer: SequencerEngine::new(),
            playback: PlaybackEngine::new(),
            selected_screen: 0,
            selected_pattern_for_editing: 0,
            is_pattern_editor_open: false,
            base_state: BaseRustState::default(),
            pattern: SequencerPattern::new()
        }
    }

    #[frb(ui_mutation)]
    fn update_pattern(&mut self, pattern: SequencerPattern) {
        self.pattern = pattern;
    }

    // Command methods that Flutter can call
    #[frb(sync)]
    pub fn execute_command(&mut self, command: AppCommand) {
        match command {
            AppCommand::Play => {
                self.playback.start();
            }
            AppCommand::Stop => {
                self.playback.stop();
            }
            AppCommand::ToggleStep(step) => {
                self.sequencer.toggle_step(step, self.selected_pattern_for_editing);
            }
            AppCommand::SelectPattern(index) => {
                self.selected_pattern_for_editing = index;
            }
            AppCommand::SetTempo(tempo) => {
                self.playback.set_tempo(tempo);
            }
            AppCommand::SelectScreen(screen) => {
                self.selected_screen = screen;
            }
            AppCommand::ToggleStepSustain(step_index) => {
                self.sequencer.toggle_step_sustain(step_index, self.selected_pattern_for_editing);
            }
            AppCommand::SetStepNote(note,step_index) => {
                self.sequencer.set_step_note(note, step_index, self.selected_pattern_for_editing);
            }
            AppCommand::SetStepVelocity(velocity,step_index ) => {
                self.sequencer.set_step_velocity(velocity, step_index, self.selected_pattern_for_editing);
            }

        }
    }
}

pub enum AppCommand {
    Play,
    Stop,
    ToggleStep(usize),
    ToggleStepSustain(usize),
    SetStepNote(i32, usize),
    SetStepVelocity(i32, usize),
    SelectPattern(usize),
    SetTempo(f32),
    SelectScreen(usize),
}

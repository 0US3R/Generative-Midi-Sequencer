
use flutter_rust_bridge::frb;

#[derive(Debug)]
#[frb(ui_state)]
pub struct RustState {
    pub patterns: Vec<SequencerPattern>,
    pub is_playing: bool,
    pub bpm: i32,
    pub current_step: i32

}

impl RustState {
    #[frb(sync)]
    pub fn new() -> Self {
        RustState {
            patterns: vec![SequencerPattern::new(); 1],
            is_playing: false, 
            bpm: 120,
            current_step: 0, 
            base_state: Default::default()
        }
    }

   #[frb(ui_mutation)]
    pub fn increment_bpm(&mut self) {
        self.bpm += 1;
    }

    #[frb(ui_mutation)]
    pub fn decrement_bpm(&mut self) {
        self.bpm -= 1;
    }

   #[frb(ui_mutation)]
    pub fn start(&mut self) {    
         self.is_playing = true;
    }

    #[frb(ui_mutation)]
    pub fn stop(&mut self) {
        self.is_playing = false;
    }

}

#[derive(Debug, Clone)]
#[frb(ui_state)]
pub struct SequencerPattern{
    pub step_length: f32, // 1:8 or 1:4 or ...
    pub steps_per_beat: i32,
    pub current_step: i32,
    pub num_steps: i32,
    pub steps: Vec<SequencerStep>,
}

impl SequencerPattern {
    #[frb(sync)]
    pub fn new() -> Self {
        Self {
            step_length: 0.25,
            num_steps: 8,
            current_step: 0,
            steps: vec![SequencerStep::new()],
            steps_per_beat: 4
            base_state: Default::default()
           
        }
    }
}


#[derive(Debug, Clone)]
#[frb(ui_state)]
pub struct SequencerStep {
    pub active: bool,
    pub velocity: i32,
    pub note: i32
}

impl SequencerStep {
    #[frb(sync)]
        pub fn new() -> Self {
        SequencerStep {
            note: 0,
            velocity: 127,
            active: false,
            base_state: Default::default()
        }
    }
}



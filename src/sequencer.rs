
// Your core engine (not exposed to Flutter directly)
pub struct SequencerEngine {

    pub patterns: Vec<SequencerPattern>,
}

impl SequencerEngine {
    pub fn new() -> Self {
        Self { patterns: vec![SequencerPattern::new(); 1]}
    }

pub fn toggle_step(&mut self, step_index: usize, pattern_index: usize) {
        if let Some(pattern) = self.patterns.get_mut(pattern_index) {
            if let Some(step) = pattern.steps.get_mut(step_index) {
                step.active = !step.active;
            }
        }
    }

    pub fn set_step_velocity(&mut self, velocity: i32, step_index: usize, pattern_index: usize) {
        if let Some(pattern) = self.patterns.get_mut(pattern_index) {
            if let Some(step) = pattern.steps.get_mut(step_index) {
                step.velocity = velocity;
            }
        }
    }

    pub fn toggle_step_sustain(&mut self, step_index: usize, pattern_index: usize) {
        if let Some(pattern) = self.patterns.get_mut(pattern_index) {
            if let Some(step) = pattern.steps.get_mut(step_index) {
                step.sustain = !step.sustain;
            }
        }
    }

    pub fn set_step_note(&mut self, note: i32, step_index: usize, pattern_index: usize) {
        if let Some(pattern) = self.patterns.get_mut(pattern_index) {
            if let Some(step) = pattern.steps.get_mut(step_index) {
                step.note = note;
            }
        }
    }

}

#[derive(Debug, Clone)]
pub struct SequencerPattern {
    pub step_length: f32, // 1:8 or 1:4 or ...
    pub steps_per_beat: i32,
    pub current_step: i32,
    pub num_steps: i32,
    pub steps: Vec<SequencerStep>,
}

impl SequencerPattern {

    pub fn new() -> Self {
        Self {
            step_length: 0.25,
            num_steps: 8,
            current_step: 0,
            steps: vec![SequencerStep::new(); 8],
            steps_per_beat: 4,
        }
    }
}

#[derive(Debug, Clone)]
pub struct SequencerStep {
    pub active: bool,
    pub sustain: bool,
    pub velocity: i32,
    pub note: i32,
}

impl SequencerStep {

    pub fn new() -> Self {
        SequencerStep {
            note: 0,
            velocity: 0,
            active: true,
            sustain: false,
        }
    }
}

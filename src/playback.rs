use std::time::Instant;

// Handles real-time playback and timing
pub struct PlaybackEngine {
    is_playing: bool,
    current_step: usize,
    tempo: f32,
    swing: f32,
    last_step_time: Instant,
  
}

impl PlaybackEngine {
    pub fn new() -> Self {
        return PlaybackEngine { is_playing: false, current_step: 0, tempo: 120.0, swing: 0.0, last_step_time: Instant::now() }
    }

    pub fn start(&mut self) {
        self.is_playing = true;
        self.last_step_time = Instant::now();
    }
    
    pub fn stop(&mut self) {
        self.is_playing = false;
        self.current_step = 0;
    }
    
    
    pub fn set_tempo(&mut self, bpm: f32) { self.tempo = bpm}
    pub fn current_step(&self) -> usize { self.current_step }
    pub fn is_playing(&self) -> bool { self.is_playing }
}

use flutter_rust_bridge::*;
use std::sync::{Arc, Mutex};
use std::time::{Duration, Instant};
use tokio::sync::mpsc;
use tokio::time;

// Define the MIDI struct that will be sent to Flutter
#[frb(dart_metadata=("freezed"))]
#[derive(Clone, Debug)]
pub struct MidiMessage {
    pub timestamp: i64,
    pub channel: u8,
    pub note: u8,
    pub velocity: u8,
}

// Define the application state
#[frb(dart_metadata=("freezed"))]
#[derive(Clone, Debug)]
pub struct AppState {
    pub is_processing: bool,
    pub processing_interval_ms: u64,
    pub midi_buffer_size: usize,
    pub last_processed_timestamp: i64,
}

impl Default for AppState {
    fn default() -> Self {
        Self {
            is_processing: false,
            processing_interval_ms: 100, // Default 100ms interval
            midi_buffer_size: 64,        // Default buffer size
            last_processed_timestamp: 0,
        }
    }
}

// Create a shared state that will be synchronized between Rust and Flutter
pub struct AppStateContainer {
    state: Mutex<AppState>,
}

impl AppStateContainer {
    fn new() -> Self {
        Self {
            state: Mutex::new(AppState::default()),
        }
    }

    fn get_state(&self) -> AppState {
        self.state.lock().unwrap().clone()
    }

    fn update_state(&self, updater: impl FnOnce(&mut AppState)) -> AppState {
        let mut state = self.state.lock().unwrap();
        updater(&mut state);
        state.clone()
    }
}

// Define the processor that handles MIDI data generation
pub struct MidiProcessor {
    tx: mpsc::Sender<MidiMessage>,
}

impl MidiProcessor {
    fn new(tx: mpsc::Sender<MidiMessage>) -> Self {
        Self { tx }
    }

    // Process data and generate MIDI messages
    // This is where your MIDI generation logic would go
    async fn process_data(&self, timestamp: i64) {
        // Simulate some processing work
        // In a real application, this would be your actual MIDI generation logic
        let midi_message = MidiMessage {
            timestamp,
            channel: 1,
            note: 60 + (timestamp % 24) as u8, // Generate different notes based on time
            velocity: 100,
        };

        // Send the MIDI message
        if let Err(e) = self.tx.send(midi_message).await {
            eprintln!("Failed to send MIDI message: {}", e);
        }
    }
}

// Singleton for our app state
lazy_static::lazy_static! {
    static ref APP_STATE: Arc<AppStateContainer> = Arc::new(AppStateContainer::new());
}

// Initialize the application
#[frb(sync)]
pub fn initialize_app() -> AppState {
    APP_STATE.get_state()
}

// Set the processing interval
#[frb(sync)]
pub fn set_processing_interval(interval_ms: u64) -> AppState {
    APP_STATE.update_state(|state| {
        state.processing_interval_ms = interval_ms;
    })
}

// Set the MIDI buffer size
#[frb(sync)]
pub fn set_midi_buffer_size(buffer_size: usize) -> AppState {
    APP_STATE.update_state(|state| {
        state.midi_buffer_size = buffer_size;
    })
}

// Start the processing loop
#[frb(sync)]
pub fn start_processing() -> AppState {
    APP_STATE.update_state(|state| {
        state.is_processing = true;
    })
}

// Stop the processing loop
#[frb(sync)]
pub fn stop_processing() -> AppState {
    APP_STATE.update_state(|state| {
        state.is_processing = false;
    })
}

// Get the current application state
#[frb(sync)]
pub fn get_app_state() -> AppState {
    APP_STATE.get_state()
}

// The main stream setup function that returns a stream of MIDI messages
#[frb(sync)]
pub fn setup_midi_stream() -> MessageStream<MidiMessage> {
    // Create a channel for sending MIDI messages
    let (tx, rx) = mpsc::channel::<MidiMessage>(APP_STATE.get_state().midi_buffer_size);
    
    // Create a MIDI processor
    let processor = MidiProcessor::new(tx);
    
    // Spawn a task to run the processing loop
    tokio::spawn(async move {
        let mut interval = time::interval(Duration::from_millis(
            APP_STATE.get_state().processing_interval_ms
        ));
        
        // Variables for timing precision
        let mut next_execution_time = Instant::now();
        let mut last_timestamp = 0;
        
        loop {
            // Sleep until the next execution time
            let now = Instant::now();
            if now < next_execution_time {
                time::sleep(next_execution_time - now).await;
            }
            
            // Check if processing is enabled
            if !APP_STATE.get_state().is_processing {
                // If processing is disabled, wait for the next interval tick
                interval.tick().await;
                next_execution_time = Instant::now() + Duration::from_millis(
                    APP_STATE.get_state().processing_interval_ms
                );
                continue;
            }
            
            // Get the current timestamp
            let timestamp = chrono::Utc::now().timestamp_millis();
            
            // Calculate how long the processing took
            let processing_start = Instant::now();
            
            // Process data and generate MIDI messages
            processor.process_data(timestamp).await;
            
            // Update the last processed timestamp
            APP_STATE.update_state(|state| {
                state.last_processed_timestamp = timestamp;
            });
            
            // Calculate the processing time and adjust next execution time
            let processing_time = processing_start.elapsed();
            
            // Schedule the next execution
            interval.tick().await;
            next_execution_time = next_execution_time + Duration::from_millis(
                APP_STATE.get_state().processing_interval_ms
            );
            
            // If processing took longer than the interval, adjust the next execution time
            if processing_time > Duration::from_millis(APP_STATE.get_state().processing_interval_ms) {
                // We're falling behind, reset the next execution time
                next_execution_time = Instant::now() + Duration::from_millis(
                    APP_STATE.get_state().processing_interval_ms
                );
                eprintln!("Processing took too long: {:?}", processing_time);
            }
            
            // Update last timestamp
            last_timestamp = timestamp;
        }
    });
    
    // Convert the mpsc receiver to a MessageStream
    MessageStream::new(StreamSink::new(move |sink| {
        tokio::spawn(async move {
            while let Some(message) = rx.recv().await {
                sink.add(message);
            }
        });
    }))
}

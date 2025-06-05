use std::collections::HashMap;

use async_trait::async_trait;
use messages::prelude::{Actor, Context, Handler};
use rinf::{RustSignal, SignalPiece};
use serde::Serialize;
pub struct LoggingActor {}

impl Actor for LoggingActor {}

impl LoggingActor {
    pub fn new() -> Self {
        return LoggingActor {};
    }
}

// Implementing the `Handler` trait
// allows an actor's loop to respond to a specific message type.
#[async_trait]
impl Handler<LogEntry> for LoggingActor {
    type Result = bool;
    async fn handle(&mut self, msg: LogEntry, _: &Context<Self>) -> bool {
        msg.send_signal_to_dart();
        false
    }
}

#[derive(Debug, Clone, Serialize, SignalPiece)]
pub enum LogSeverity {
    ERROR,
    INFO,
    DEBUG,
}

#[derive(Debug, Clone, Serialize, RustSignal)]
pub struct LogEntry {
    pub severity: LogSeverity,
    pub timestamp: i64,
    pub tags: HashMap<String, String>,
}

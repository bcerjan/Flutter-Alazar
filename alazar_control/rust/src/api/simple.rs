use anyhow::Result;
// use flutter_rust_bridge::StreamSink;

use std::{thread::sleep, time::Duration}; // for testing

// #[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
// pub fn greet(name: String) -> String {
//     format!("Hi, {name}!")
// }

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}

pub struct RustAlazarResponse {
  pub msg: String,
  pub running: bool,
  // pub imageData: Option<Vec<i32>>,
}

// #[flutter_rust_bridge::frb(sync)]
// pub fn create_alazar_stream(sink: StreamSink<RustAlazarResponse>) -> Result<()> {
//   let init = RustAlazarResponse{msg: "Started Running!", running: true,};
//   sleep(Duration::from_secs(1));
//   sink.add(init);
// }

pub fn create_alazar_stream() -> i32 {
  1
}

pub enum RustCardType {
  c9350,
  c9440,
  c9462,
}

pub struct RustChannel {
  pub index: i32,
}

pub struct RustBoard {
  pub index: i32,
  pub cardType: RustCardType,
  pub channels: Vec<RustChannel>
}

#[flutter_rust_bridge::frb(dart_async)]
pub async fn detect_boards_rust() -> Vec<RustBoard> {
  [RustBoard(index: 1, channels: [RustChannel(index: 1), RustChannel(index: 2)],
    cardType: RustCardType.c9440)]
}
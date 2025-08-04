use crate::api::configure_board::RustAlazarSettings;
use crate::frb_generated::{RustAutoOpaque, StreamSink};
use crate::{
    AlazarBoardsInSystemBySystemID, AlazarGetBoardBySystemID, AlazarGetBoardKind,
    AlazarGetChannelInfo, AlazarGetParameter, AlazarGetParameterUL, BoardTypes, BoardTypes_ATS9350,
    BoardTypes_ATS9440, ALAZAR_COUPLINGS, ALAZAR_COUPLINGS_AC_COUPLING, ALAZAR_IMPEDANCES,
    ALAZAR_IMPEDANCES_IMPEDANCE_50_OHM, ALAZAR_INPUT_RANGES,
    ALAZAR_INPUT_RANGES_INPUT_RANGE_PM_200_MV, ALAZAR_PARAMETERS_GET_CHANNELS_PER_BOARD,
};
use anyhow::Result;
use flutter_rust_bridge::frb;
// use core::num;
// use std::sync::mpsc::channel;
use std::{ptr, thread::sleep, time::Duration};

use super::acquire_data::acquire_data;
use super::configure_board::configure_board;
use super::control_ramp_box::{control_ramp_box, RustRampBox};
use super::free_alazar_buffers::free_alazar_buffers; // for testing

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
    pub imageData: Vec<i32>,
}

// #[flutter_rust_bridge::frb(sync)]
pub fn create_alazar_stream(sink: StreamSink<RustAlazarResponse>) -> Result<()> {
    let init = RustAlazarResponse {
        msg: "Started Running!".to_string(),
        running: true,
        imageData: vec![0, 0],
    };
    sleep(Duration::from_secs(1));
    let _ = sink.add(init);
    Ok(())
}

#[derive(Clone)]
pub enum RustCardType {
    c9350,
    c9440,
    c9462,
}

#[derive(Clone)]
#[frb(non_opaque)]
pub struct RustChannel {
    pub index: i32,
    pub enabled: bool,
    // pub coupling: RustAutoOpaque<ALAZAR_COUPLINGS>,
    // pub termination: ALAZAR_IMPEDANCES,
    // pub range: ALAZAR_INPUT_RANGES,
    pub coupling: i32,
    pub termination: i32,
    pub range: i32,
}

#[frb(non_opaque)]
pub struct RustBoard {
    pub index: i32,
    pub cardType: RustCardType,
    pub channels: Vec<RustChannel>,
    pub bytesPerSample: u32,
}

pub struct RustMatlabFuncNames {
    pub liveFn: String,
    pub endFn: String,
}

pub async fn panic_test() -> String {
    panic!("Panic testing!")
}

#[frb(dart_async)]
pub async fn detect_boards_rust() -> Vec<RustBoard> {
    let mut vec = Vec::new();
    // channelVec.push(RustChannel { index: 1 });
    // channelVec.push(RustChannel { index: 2 });
    // let board = RustBoard {
    //     index: 1,
    //     channels: channelVec,
    //     cardType: RustCardType::c9440,
    // };
    // vec.push(board);
    unsafe {
        let systemID = 1;
        let numBoards = AlazarBoardsInSystemBySystemID(systemID); // assume 1 system
        for boardID in 0..numBoards {
            let h = AlazarGetBoardBySystemID(systemID, boardID);
            let kind: BoardTypes = AlazarGetBoardKind(h);
            let numChannels: *mut std::os::raw::c_ulong = std::ptr::null_mut();
            let cardType;
            let mut channelVec = Vec::new();
            match kind {
                BoardTypes_ATS9440 => cardType = RustCardType::c9440,
                BoardTypes_ATS9350 => cardType = RustCardType::c9350,
                _ => return vec, // don't know what board type we have
            }
            AlazarGetParameterUL(
                h,
                0,
                ALAZAR_PARAMETERS_GET_CHANNELS_PER_BOARD.try_into().unwrap(),
                numChannels,
            );

            for j in 0..*numChannels {
                channelVec.push(RustChannel {
                    index: j.try_into().unwrap(),
                    enabled: false,
                    coupling: ALAZAR_COUPLINGS_AC_COUPLING,
                    termination: ALAZAR_IMPEDANCES_IMPEDANCE_50_OHM,
                    range: ALAZAR_INPUT_RANGES_INPUT_RANGE_PM_200_MV,
                });
            }
            let memorySize: *mut u32 = ptr::null_mut();
            let bitsPerSample: *mut u8 = ptr::null_mut();
            AlazarGetChannelInfo(h, memorySize, bitsPerSample);

            let bits = *bitsPerSample;
            let bytesPerSample = ((bits + 7) as f64 / 8f64).floor() as u32;
            let board = RustBoard {
                index: boardID as i32,
                channels: channelVec,
                cardType,
                bytesPerSample: bytesPerSample,
            };

            vec.push(board);
        }
    }
    return vec;
}

pub fn startAcquisition(
    settings: RustAlazarSettings,
    rampBoxSettings: RustRampBox,
    boards: Vec<RustBoard>,
    sink: StreamSink<RustAlazarResponse>,
) -> Result<()> {
    let mut buffers = Vec::new();
    for boardID in 1..=boards.len() {
        buffers.push(configure_board(&settings, boardID as u32));
    }
    sink.add(RustAlazarResponse {
        msg: "Boards Configured!".to_string(),
        running: true,
        imageData: vec![0, 0],
    });

    if settings.rampBoxAttached {
        control_ramp_box(rampBoxSettings);
        sink.add(RustAlazarResponse {
            msg: "ControlBox Controlled!".to_string(),
            running: true,
            imageData: vec![0, 0],
        });
    }

    acquire_data(settings, boards, &buffers, &sink);

    // match out {
    //     Ok(v) => sink.add(RustAlazarResponse {
    //         msg: "Acquisition Complete".to_string(),
    //         running: true,
    //         imageData: vec![0, 0],
    //     }),
    //     Err(e) => sink.add(RustAlazarResponse {
    //         msg: "Likely Timeout Error".to_string(),
    //         running: true,
    //         imageData: vec![0, 0],
    //     }),
    // }

    free_alazar_buffers(buffers);

    // sink.add(RustAlazarResponse {
    //     msg: "Buffers Freed".to_string(),
    //     running: true,
    //     imageData: vec![0, 0],
    // });

    Ok(())
}

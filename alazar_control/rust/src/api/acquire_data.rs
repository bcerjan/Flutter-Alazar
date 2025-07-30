use crate::frb_generated::StreamSink;
use flutter_rust_bridge::frb;

use crate::{api::simple::RustAlazarResponse, AlazarStartCapture};
use crate::{
    AlazarConfigureAuxIO, AlazarGetBoardBySystemID, AlazarPostAsyncBuffer,
    AlazarWaitAsyncBufferComplete, RETURN_CODE_ApiSuccess, ALAZAR_AUX_IO_MODES_AUX_OUT_SERIAL_DATA,
};

use super::{
    configure_board::RustAlazarSettings,
    simple::{RustBoard, RustMatlabFuncNames},
};
use nalgebra::DMatrix;
use std::ffi::c_void;
use std::{slice, thread, time::Duration};
#[frb(ignore)]
pub fn acquire_data(
    settings: RustAlazarSettings,
    // funcs: RustMatlabFuncNames,
    boards: Vec<RustBoard>,
    buffers: &Vec<Vec<*mut c_void>>,
    sink: &StreamSink<RustAlazarResponse>,
) -> anyhow::Result<DMatrix<i32>, &'static str> {
    let boardCount = boards.len();

    // Currently only works for end-processing the data (not live ... yet)
    // Not Cancellable yet either
    let channelData: DMatrix<i32> = Default::default();
    let numBoards = boards.len();
    let numSamples = (settings.numBuffers * settings.samplesPerRecord) as usize;
    let mut out = channelData.resize(numBoards, numSamples, 0);

    sink.add(RustAlazarResponse {
        msg: "Arming Board and sending trigger...".to_string(),
        running: true,
        imageData: vec![0, 0],
    });

    // Arm Board and send pulse:
    unsafe {
        let handle = AlazarGetBoardBySystemID(1, 1);
        AlazarStartCapture(handle);
        AlazarConfigureAuxIO(
            handle,
            ALAZAR_AUX_IO_MODES_AUX_OUT_SERIAL_DATA.try_into().unwrap(),
            1,
        );
        thread::sleep(Duration::from_micros(10));
        AlazarConfigureAuxIO(
            handle,
            ALAZAR_AUX_IO_MODES_AUX_OUT_SERIAL_DATA.try_into().unwrap(),
            0,
        );
    }

    sink.add(RustAlazarResponse {
        msg: "Beginning Acquisition...".to_string(),
        running: true,
        imageData: vec![0, 0],
    });

    for i in 0..settings.numBuffers {
        for boardID in 1..=boardCount {
            unsafe {
                let boardHandle = AlazarGetBoardBySystemID(1, boardID.try_into().unwrap());
                let pbuffer = buffers[boardID][i as usize];

                let ret = AlazarWaitAsyncBufferComplete(boardHandle, pbuffer, 5000);
                if ret != RETURN_CODE_ApiSuccess {
                    sink.add(RustAlazarResponse {
                        msg: "Error in AlazarWaitAsyncBufferComplete... (probably timeout)".to_string(),
                        running: true,
                        imageData: vec![0, 0],
                    });
                    // panic!("Error in AlazarWaitAsyncBufferComplete (probably timeout)");
                    return Err("Error in AlazarWaitAsyncBufferComplete (probably timeout)");
                }

                let offset = (i as usize * numSamples) as usize;
                let s = slice::from_raw_parts(
                    pbuffer as *const i32,
                    settings.samplesPerRecord as usize,
                )
                .to_vec();
                for j in 1..=numSamples {
                    out[((offset + j) as usize, boardID as usize)] = s[j];
                }

                // Re-post buffer:
                AlazarPostAsyncBuffer(boardHandle, pbuffer, settings.bytesPerBuffer);
            }
        }
    }

    return Ok(out);
}

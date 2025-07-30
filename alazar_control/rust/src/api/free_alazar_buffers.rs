use std::ffi::c_void;
use flutter_rust_bridge::frb;

use crate::{AlazarFreeBufferU16Ex, AlazarGetBoardBySystemID};

#[frb(ignore)]
pub fn free_alazar_buffers(buffers: Vec<Vec<*mut c_void>>) {
    for boardID in 1..=buffers.len() {
        unsafe {
            let handle = AlazarGetBoardBySystemID(1, boardID.try_into().unwrap());
            for id in 1..buffers[boardID].len() {
                AlazarFreeBufferU16Ex(handle, buffers[boardID][id] as *mut u16);
            }
        }
    }
}

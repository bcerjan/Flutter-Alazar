use std::ffi::c_void;
use flutter_rust_bridge::frb;

use super::simple::RustChannel;
use crate::{
    AlazarAllocBufferU16Ex, AlazarBeforeAsyncRead, AlazarConfigureAuxIO, AlazarGetBoardBySystemID,
    AlazarInputControl, AlazarPostAsyncBuffer, AlazarSetCaptureClock, AlazarSetExternalTrigger,
    AlazarSetRecordSize, AlazarSetTriggerDelay, AlazarSetTriggerOperation, AlazarSetTriggerTimeOut,
    ALAZAR_ADMA_FLAGS, ALAZAR_AUX_IO_MODES_AUX_OUT_SERIAL_DATA,
    ALAZAR_CLOCK_EDGES_CLOCK_EDGE_RISING, ALAZAR_CLOCK_SOURCES_EXTERNAL_CLOCK,
    ALAZAR_CLOCK_SOURCES_EXTERNAL_CLOCK_10MHZ_REF, ALAZAR_COUPLINGS_DC_COUPLING,
    ALAZAR_EXTERNAL_TRIGGER_RANGES_ETR_5V, ALAZAR_TRIGGER_ENGINES_TRIG_ENGINE_J,
    ALAZAR_TRIGGER_ENGINES_TRIG_ENGINE_K, ALAZAR_TRIGGER_OPERATIONS_TRIG_ENGINE_OP_J,
    ALAZAR_TRIGGER_SLOPES_TRIGGER_SLOPE_POSITIVE, ALAZAR_TRIGGER_SOURCES_TRIG_DISABLE,
    ALAZAR_TRIGGER_SOURCES_TRIG_EXTERNAL,
};

pub enum RustTriggerType {
    PLL,
    Ext,
}

#[frb(non_opaque)]
pub struct RustAlazarSettings {
    pub laserRepRateMHz: u32,
    pub numBuffers: u32,
    pub preTriggerSamples: i32,
    pub postTriggerSamples: i32,
    pub samplesPerRecord: u32,
    pub bytesPerBuffer: u32,
    pub recordsPerAcquisition: i32,
    pub recordsPerBuffer: i32,
    pub live: bool,
    pub rampBoxAttached: bool,
    pub trigger: RustTriggerType,
    pub triggerLevel: u32,
    pub triggerDelaySec: f64,
    pub triggerTimeoutSec: f64,
    pub sampleRate: u32,
    pub decimantionFactor: u32,
    pub channels: Vec<Vec<RustChannel>>,
    // pub admaFlags: ALAZAR_ADMA_FLAGS, // these don't get translated correctly to Dart :(
    pub admaFlags: i32,
}

#[frb(ignore)]
pub fn configure_board(settings: &RustAlazarSettings, boardID: u32) -> Vec<*mut c_void> {
    unsafe {
        let handle = AlazarGetBoardBySystemID(1, boardID);

        if boardID == 1 {
            match settings.trigger {
                RustTriggerType::PLL => AlazarSetCaptureClock(
                    handle,
                    ALAZAR_CLOCK_SOURCES_EXTERNAL_CLOCK_10MHZ_REF
                        .try_into()
                        .unwrap(),
                    settings.sampleRate,
                    ALAZAR_CLOCK_EDGES_CLOCK_EDGE_RISING.try_into().unwrap(),
                    settings.decimantionFactor,
                ),
                RustTriggerType::Ext => AlazarSetCaptureClock(
                    handle,
                    ALAZAR_CLOCK_SOURCES_EXTERNAL_CLOCK.try_into().unwrap(),
                    settings.sampleRate,
                    ALAZAR_CLOCK_EDGES_CLOCK_EDGE_RISING.try_into().unwrap(),
                    settings.decimantionFactor,
                ),
            };
        }

        let mut buffers = Vec::new();

        // Allocate Buffers:
        for _ in 1..settings.numBuffers {
            let pbuffer =
                AlazarAllocBufferU16Ex(handle, settings.bytesPerBuffer.try_into().unwrap())
                    as *mut c_void;
            if pbuffer == std::ptr::null_mut() {
                // Error!
                return Vec::new();
            }
            buffers.push(pbuffer);
        }

        // Set Record Size:
        AlazarSetRecordSize(
            handle,
            settings.preTriggerSamples.try_into().unwrap(),
            settings.postTriggerSamples.try_into().unwrap(),
        );

        // Configure Channels:
        let mut channelMask = 0;
        let numChannels = settings.channels.len();

        for chan in 1..numChannels {
            let temp = &settings.channels[boardID as usize][chan];
            if temp.enabled {
                let thisChan: u8 = 2_u8.pow((chan - 1).try_into().unwrap());
                channelMask = channelMask + thisChan;

                AlazarInputControl(
                    handle,
                    thisChan,
                    temp.coupling.try_into().unwrap(),
                    temp.range.try_into().unwrap(),
                    temp.termination.try_into().unwrap(),
                );
            }
        }

        // Trigger Setup:
        if boardID == 1 {
            AlazarSetTriggerOperation(
                handle,
                ALAZAR_TRIGGER_OPERATIONS_TRIG_ENGINE_OP_J
                    .try_into()
                    .unwrap(),
                ALAZAR_TRIGGER_ENGINES_TRIG_ENGINE_J.try_into().unwrap(),
                ALAZAR_TRIGGER_SOURCES_TRIG_EXTERNAL.try_into().unwrap(),
                ALAZAR_TRIGGER_SLOPES_TRIGGER_SLOPE_POSITIVE
                    .try_into()
                    .unwrap(),
                settings.triggerLevel,
                ALAZAR_TRIGGER_ENGINES_TRIG_ENGINE_K.try_into().unwrap(),
                ALAZAR_TRIGGER_SOURCES_TRIG_DISABLE.try_into().unwrap(),
                ALAZAR_TRIGGER_SLOPES_TRIGGER_SLOPE_POSITIVE
                    .try_into()
                    .unwrap(),
                128,
            );

            AlazarSetExternalTrigger(
                handle,
                ALAZAR_COUPLINGS_DC_COUPLING.try_into().unwrap(),
                ALAZAR_EXTERNAL_TRIGGER_RANGES_ETR_5V.try_into().unwrap(),
            );
        }

        // Trigger Delay:
        let samplesPerSec: f64 = (settings.laserRepRateMHz * 1000000).into();
        let triggerDelaySamples = (settings.triggerDelaySec * samplesPerSec + 0.5).floor() as u32;
        AlazarSetTriggerDelay(handle, triggerDelaySamples);

        // Timeout:
        let triggerTimeoutClocks = (settings.triggerTimeoutSec * 100000_f64 + 0.5).floor() as u32; // ticks are 10 us
        AlazarSetTriggerTimeOut(handle, triggerTimeoutClocks);

        // Aux I/O Disable:
        if boardID == 1 {
            AlazarConfigureAuxIO(
                handle,
                ALAZAR_AUX_IO_MODES_AUX_OUT_SERIAL_DATA.try_into().unwrap(),
                0,
            );
        }

        // Configure the AutoDMA acquisition:
        AlazarBeforeAsyncRead(
            handle,
            channelMask.try_into().unwrap(),
            -settings.preTriggerSamples,
            settings.samplesPerRecord.try_into().unwrap(),
            settings.recordsPerBuffer.try_into().unwrap(),
            settings.recordsPerAcquisition.try_into().unwrap(),
            settings.admaFlags.try_into().unwrap(),
        );

        // Post Buffers to the board:
        for idx in 0..buffers.len() {
            let buf = buffers[idx];
            AlazarPostAsyncBuffer(handle, buf, settings.bytesPerBuffer);
        }

        return buffers;
    }
}

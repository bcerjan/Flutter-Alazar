extern crate serial;

use std::time::Duration;
use flutter_rust_bridge::frb;

use serial::prelude::*;
use std::io::prelude::*;

pub enum RustRampBoxType {
    v1,
    v2,
}
pub struct RustRampBox {
    pub comPort: String,
    pub enableMode: u8,
    pub enablePolarity: u8,
    pub fastDacMode: u8,
    pub fastDacSteps: u8,
    pub fastDacPhase: u8,
    pub fastDacScans: u8,
    pub slowDacMode: u8,
    pub slowDacSteps: u8,
    pub slowDacScans: u8,
    pub boxType: RustRampBoxType,
}
#[frb(ignore)]
pub fn control_ramp_box(settings: RustRampBox) {
    let header = 3; // header for configuration
    let center = 0; // we do not center the laser when acquiring
    let check = 0;
    let mut buf: Vec<u8>;
    match settings.boxType {
        RustRampBoxType::v1 => {
            let waveAOn = 1;
            let waveAOff = 1;
            let waveBPerF = 1;
            let waveSReq = settings.slowDacScans;
            let vPerBit = 10f64 / 4095f64;
            let waveFMaxVoltage: u8 = (10.0 / vPerBit).round() as u8;
            let waveFMinVoltage: u8 = (2.0 / vPerBit).round() as u8;
            let waveSMaxVoltage: u8 = (10.0 / vPerBit).round() as u8;
            let waveSMinVoltage: u8 = (2.0 / vPerBit).round() as u8;
            buf = vec![
                header,
                settings.enablePolarity,
                settings.fastDacMode,
                waveAOn,
                waveAOff,
                waveBPerF,
                waveSReq,
                settings.fastDacSteps,
                waveFMaxVoltage,
                waveFMinVoltage,
                settings.slowDacSteps,
                waveSMaxVoltage,
                waveSMinVoltage,
                settings.fastDacScans,
                check, // not in docs -- needed?
            ];
        }
        RustRampBoxType::v2 => {
            buf = vec![
                header,
                settings.enableMode,
                settings.enablePolarity,
                settings.fastDacMode,
                settings.fastDacSteps,
                center,
                settings.fastDacScans,
                settings.slowDacMode,
                settings.slowDacSteps,
                settings.slowDacScans,
                check,
            ]
        }
    }

    let checkSum = calc_checksum(&buf);
    let end = buf.len() - 1;
    buf[end] = checkSum;

    // Open Serial Port:
    let mut port = serial::open(&settings.comPort).unwrap();
    (port.reconfigure(&|settings| {
        (settings.set_baud_rate(serial::Baud9600))?;
        settings.set_char_size(serial::Bits8);
        settings.set_parity(serial::ParityNone);
        settings.set_stop_bits(serial::Stop1);
        settings.set_flow_control(serial::FlowNone);
        Ok(())
    }));

    port.set_timeout(Duration::from_millis(1000));
    port.write(&buf[..]);
    port.read(&mut buf[..]);

    if !verify_checksum(&buf) {
        panic!("Bad response from the control box")
    }
}

fn calc_checksum(bytes: &Vec<u8>) -> u8 {
    bytes.iter().sum()
}

fn verify_checksum(bytes: &Vec<u8>) -> bool {
    if bytes.len() != 8 {
        return false;
    }

    let sum: u8 = bytes[7..8].iter().sum();
    if sum != calc_checksum(&bytes[..6].to_vec()) {
        return false;
    }

    if bytes[5] == 1 {
        // indicates failure of some kind
        return false;
    }

    return true;
}

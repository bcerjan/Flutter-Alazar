import 'package:alazar_control/repository/models/alazar_board.dart';
import 'package:alazar_control/repository/models/alazar_channel.dart';
import 'package:alazar_control/repository/models/alazar_response.dart';
import 'package:alazar_control/repository/models/board_type.dart';
import 'package:alazar_control/repository/models/control_box.dart';
import 'package:alazar_control/repository/models/experiment.dart';
import 'package:alazar_control/repository/models/trigger_mode.dart';
import 'package:alazar_control/src/rust/api/configure_board.dart';
import 'package:alazar_control/src/rust/api/control_ramp_box.dart';
import 'package:alazar_control/src/rust/api/simple.dart';

class ExperimentService {
  Stream<AlazarResponse> getAlazarStream() =>
      createAlazarStream().map((RustAlazarResponse rustResp) => AlazarResponse(
            msg: rustResp.msg,
            running: rustResp.running,
            imageData: rustResp.imageData,
          ));

  Future<String> testPanic() async => panicTest();

  // Future<List<AlazarBoard>> detectBoards() async => [
  //       const AlazarBoard(
  //         boardType: BoardType.c9440,
  //         channels: [
  //           AlazarChannel(channelNum: 1, boardNum: 1),
  //           AlazarChannel(channelNum: 2, boardNum: 1),
  //         ],
  //       ),
  //       const AlazarBoard(boardType: BoardType.c9440, channels: [
  //         AlazarChannel(channelNum: 1, boardNum: 2),
  //         AlazarChannel(channelNum: 2, boardNum: 2),
  //         AlazarChannel(channelNum: 3, boardNum: 2),
  //         AlazarChannel(channelNum: 4, boardNum: 2),
  //       ]),
  //     ];
  Future<List<AlazarBoard>> detectBoards() async {
    final rustBoards = await detectBoardsRust();
    final List<AlazarBoard> ret = [];
    int i = 1;
    for (final rb in rustBoards) {
      final List<AlazarChannel> channels = rb.channels
          .map((rc) => AlazarChannel(channelNum: rc.index, boardNum: i))
          .toList();
      final type = BoardType.fromRustCardType(rb.cardType);
      ret.add(AlazarBoard(boardType: type, channels: channels));
      i++;
    }

    return ret;
  }

  Stream<AlazarResponse> startAcquisitionDart(
      {required Experiment experiment, required ControlBox controlBox}) {
    final RustTriggerType trigger = switch (experiment.settings.triggerMode) {
      TriggerMode.ext => RustTriggerType.ext,
      TriggerMode.pll => RustTriggerType.pll,
    };

    const RustRampBox rbox = RustRampBox(
        comPort: "",
        enableMode: 1,
        enablePolarity: 0,
        fastDacMode: 0,
        fastDacSteps: 0,
        fastDacPhase: 0,
        fastDacScans: 0,
        slowDacMode: 0,
        slowDacSteps: 0,
        slowDacScans: 0,
        boxType: RustRampBoxType.v2);

    final List<RustBoard> boards = [];
    final List<List<RustChannel>> channels = [];
    int i = 0;
    for (final AlazarBoard b in experiment.settings.boards) {
      final type = switch (b.boardType) {
        BoardType.c9440 => RustCardType.c9440,
        BoardType.c9462 => RustCardType.c9462,
        BoardType.c9350 => RustCardType.c9350,
      };
      int j = 0;
      channels.add(<RustChannel>[]);
      for (final AlazarChannel chan in b.channels) {
        channels[j].add(RustChannel(
            index: j,
            enabled: chan.enabled,
            coupling: chan.coupling.toRust(),
            termination: chan.termination.toRust(),
            range: chan.range.toRust()));
      }
      boards.add(RustBoard(
          index: i, cardType: type, channels: channels[j], bytesPerSample: 2));
      i++;
    }

    RustAlazarSettings rsettings = RustAlazarSettings(
      laserRepRateMHz: experiment.laserRepRateMHz.toInt(),
      numBuffers: experiment.settings.numBuffers,
      preTriggerSamples: 0, // experiment.settings.preTriggerSamples
      postTriggerSamples: experiment.settings.totalSamples,
      samplesPerRecord: experiment.settings.samplesPerRecord,
      bytesPerBuffer: experiment.settings.getBytesPerBuffer(),
      recordsPerAcquisition: experiment.settings.recordsPerAcquisition,
      recordsPerBuffer: experiment.settings.recordsPerBuffer,
      live: false, // hardcoded for now
      rampBoxAttached: false, // hardcoded for now
      trigger: trigger,
      triggerLevel: experiment.settings.triggerLevel,
      triggerDelaySec: experiment.settings.triggerDelaySec,
      triggerTimeoutSec: experiment.settings.triggerTimeoutSec,
      sampleRate: experiment.settings.sampleRate,
      decimantionFactor: experiment.settings.decimationFactor,
      admaFlags: 5121, // hardcoded for now
      channels: channels,
    );

    return startAcquisition(
            settings: rsettings, rampBoxSettings: rbox, boards: boards)
        .map((RustAlazarResponse rustResp) => AlazarResponse(
              msg: rustResp.msg,
              running: rustResp.running,
              imageData: rustResp.imageData,
            ));
  }
}

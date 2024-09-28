import 'package:alazar_control/repository/models/alazar_board.dart';
import 'package:alazar_control/repository/models/alazar_channel.dart';
import 'package:alazar_control/repository/models/trigger_mode.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'alazar_settings.mapper.dart';

@MappableClass()
class AlazarSettings with AlazarSettingsMappable {
  const AlazarSettings({
    required this.sampleRate,
    required this.decimationFactor,
    required this.samplesPerRecord,
    required this.totalSamples,
    this.recordsPerBuffer = 1,
    this.numBuffers = 1,
    this.recordsPerAcquisition = 1,
    this.preTriggerSamples = 0,
    this.triggerDelaySec = 0.0,
    this.triggerTimeoutSec = 0.0,
    this.triggerLevel = 160,
    this.boards = const [],
    this.triggerMode = TriggerMode.pll,
  });

  const AlazarSettings.getDefault()
      : sampleRate = 1,
        decimationFactor = -1,
        samplesPerRecord = 1,
        totalSamples = 1,
        recordsPerBuffer = -1,
        numBuffers = 0,
        recordsPerAcquisition = 0,
        preTriggerSamples = 0,
        triggerDelaySec = 0.0,
        triggerTimeoutSec = 0.0,
        triggerLevel = 1,
        boards = const [],
        triggerMode = TriggerMode.pll;

  final int sampleRate;
  final int decimationFactor;
  final int samplesPerRecord;
  final int totalSamples;
  final int recordsPerBuffer;
  final int numBuffers;
  final int recordsPerAcquisition;
  final int preTriggerSamples;
  final double triggerDelaySec;
  final double triggerTimeoutSec;

  final List<AlazarBoard> boards;

  final int triggerLevel;
  final TriggerMode triggerMode;

  Map<String, AlazarChannel> getEnabledChannels() {
    final Map<String, AlazarChannel> ret = {};
    int i = 1;
    const String letters = 'ABCDEFGHIJKLMNOPQRSTUVYXYZ';
    for (final AlazarBoard board in boards) {
      for (final AlazarChannel channel in board.channels) {
        if (channel.enabled) {
          final letter =
              letters[channel.channelNum - 1]; // indexed from 1 instead of 0
          ret.addEntries([
            MapEntry('Board $i: Channel $letter', channel),
          ]);
        }
      }
      i++;
    }
    return ret;
  }
}

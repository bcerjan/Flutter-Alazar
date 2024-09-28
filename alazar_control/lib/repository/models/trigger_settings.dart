import 'package:alazar_control/repository/models/trigger_mode.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'trigger_settings.mapper.dart';

@MappableClass()
class TriggerSettings with TriggerSettingsMappable {
  const TriggerSettings({
    this.triggerMode = TriggerMode.pll,
    this.triggerLevel = 160,
    this.triggerDelaySec = 0.0,
    this.triggerTimeoutSec = 0.0,
    this.preTriggerSamples = 0,
  });
  final TriggerMode triggerMode;
  final int triggerLevel;
  final double triggerTimeoutSec;
  final double triggerDelaySec;
  final int preTriggerSamples;
}

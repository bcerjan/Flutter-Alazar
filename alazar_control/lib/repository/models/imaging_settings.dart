import 'package:alazar_control/repository/models/alazar_channel.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'imaging_settings.mapper.dart';

/// This stores what is displayed on the UI, and is used to generate the "real"
/// settings for running the acquisition.
@MappableClass()
class ImagingSettings with ImagingSettingsMappable {
  const ImagingSettings({
    this.scanPeriodUs = 66.3,
    this.imageHeightPix = 512,
    this.imageWidthPix = 512,
    this.numberOfFrames = 1,
    this.fastMirrorPhase = 0.0,
    this.liveFrames = 1,
    this.liveChannel,
  });
  final double scanPeriodUs;
  final int imageWidthPix;
  final int imageHeightPix;
  final int numberOfFrames;
  final double fastMirrorPhase;
  final int liveFrames;
  final AlazarChannel? liveChannel;
}

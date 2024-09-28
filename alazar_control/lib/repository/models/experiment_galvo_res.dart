part of 'experiment.dart';

@MappableClass()
class ExperimentGalvoRes extends ExperimentImaging
    with ExperimentGalvoResMappable {
  const ExperimentGalvoRes(
      {required super.settings,
      required super.laserRepRateMHz,
      super.folderPath = '',
      super.autosave = false,
      super.liveFn = '',
      super.endFn = 'signalAveraging',
      super.preAcqFn = '',
      super.postAcqFn = '',
      super.numberOfAcquisitions = 1,
      super.controlBoxNeeded = false,
      super.controlBox,
      super.imagingSettings = const ImagingSettings()});

  ExperimentGalvoRes fromUI({
    required List<AlazarBoard> boards,
  }) {
    final AlazarSettings settings = Experiment.prepareSettingsStandard(
      laserRepRateMHz: laserRepRateMHz,
      imageHeightPix: imagingSettings.imageHeightPix,
      numberOfFrames: imagingSettings.numberOfFrames,
      scanPeriodUs: imagingSettings.scanPeriodUs,
      boards: boards,
      triggerMode: this.settings.triggerMode,
      triggerLevel: this.settings.triggerLevel,
      triggerDelaySec: this.settings.triggerDelaySec,
      triggerTimeoutSec: this.settings.triggerTimeoutSec,
      preTriggerSamples: this.settings.preTriggerSamples,
    );
    return ExperimentGalvoRes(
      laserRepRateMHz: laserRepRateMHz,
      settings: settings,
      folderPath: folderPath,
      autosave: autosave,
      liveFn: liveFn,
      endFn: endFn,
      preAcqFn: preAcqFn,
      postAcqFn: postAcqFn,
      controlBoxNeeded: false,
      controlBox: null,
    );
  }

  ExperimentGalvoRes scanPeriodUpdate({
    required double scanPeriodUs,
    required int imageHeightPix,
  }) {
    return copyWith(
        settings: settings.copyWith(
            samplesPerRecord: Experiment.calculateSamplesStandard(
                imageHeightPix: imageHeightPix,
                laserRepRateMHz: laserRepRateMHz,
                scanFreqHz: Experiment.scanPeriodToScanFreqHz(scanPeriodUs))));
  }

  const ExperimentGalvoRes.getDefault()
      : super(
          settings: const AlazarSettings.getDefault(),
          laserRepRateMHz: 1,
          imagingSettings: const ImagingSettings(),
        );
}

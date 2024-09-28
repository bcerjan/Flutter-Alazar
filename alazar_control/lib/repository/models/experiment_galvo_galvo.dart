part of 'experiment.dart';

@MappableClass()
class ExperimentGalvoGalvo extends ExperimentImaging
    with ExperimentGalvoGalvoMappable {
  const ExperimentGalvoGalvo({
    required super.settings,
    required super.laserRepRateMHz,
    super.folderPath = '',
    super.autosave = false,
    super.liveFn = '',
    super.endFn = 'fptirAnalysis',
    super.preAcqFn = '',
    super.postAcqFn = '',
    super.numberOfAcquisitions = 1,
    super.controlBoxNeeded = true,
    super.controlBox,
    super.imagingSettings = const ImagingSettings(),
  });

  ExperimentGalvoGalvo fromUI({
    required List<AlazarBoard> boards,
    bool controlBoxAttached = true,
    ControlBox? controlBox,
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
    if (controlBoxAttached) {
      if (controlBox == null) {
        throw const InvalidControlBoxException(
            'Control box needed, but no control box information provided');
      }
    }
    return ExperimentGalvoGalvo(
      laserRepRateMHz: laserRepRateMHz,
      settings: settings,
      folderPath: folderPath,
      autosave: autosave,
      liveFn: liveFn,
      endFn: endFn,
      preAcqFn: preAcqFn,
      postAcqFn: postAcqFn,
      controlBoxNeeded: controlBoxAttached,
      controlBox: controlBox,
    );
  }

  const ExperimentGalvoGalvo.getDefault()
      : super(
          settings: const AlazarSettings.getDefault(),
          laserRepRateMHz: 1,
          imagingSettings: const ImagingSettings(),
        );
}

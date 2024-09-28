part of 'experiment.dart';

@MappableClass()
sealed class ExperimentImaging extends Experiment
    with ExperimentImagingMappable {
  const ExperimentImaging({
    required super.settings,
    required super.laserRepRateMHz,
    super.folderPath = '',
    super.autosave = false,
    super.liveFn = '',
    super.endFn = '',
    super.preAcqFn = '',
    super.postAcqFn = '',
    super.numberOfAcquisitions = 1,
    super.controlBoxNeeded = true,
    super.controlBox,
    required this.imagingSettings,
  });

  final ImagingSettings imagingSettings;
}

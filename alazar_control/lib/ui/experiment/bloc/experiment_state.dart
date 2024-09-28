part of 'experiment_bloc.dart';

@MappableEnum()
enum ExperimentStatus { error, running, idle }

@MappableClass()
class ExperimentState with ExperimentStateMappable {
  const ExperimentState({
    this.status = ExperimentStatus.idle,
    this.experiment = const ExperimentGalvoGalvo.getDefault(),
    this.cache = const {},
    this.errorText,
    this.imageData,
  });

  /// Use this constructor for serialization as we don't want to save the live
  /// image data (if any)
  @MappableConstructor()
  const ExperimentState.serialization({
    this.status = ExperimentStatus.idle,
    this.experiment = const ExperimentGalvoGalvo.getDefault(),
    this.cache = const {},
    this.errorText,
  }) : imageData = const [];

  final ExperimentStatus status;
  final Experiment experiment;
  final Map<AllExperimentsEnum, Experiment> cache;
  final String? errorText;
  final List<int>? imageData;

  ExperimentState store(Experiment exp) {
    final Map<AllExperimentsEnum, Experiment> newCache = Map.from(cache);
    final type = AllExperimentsEnum.fromModel(exp);
    newCache.remove(type);
    newCache.putIfAbsent(type, () => exp);
    return copyWith(cache: newCache);
  }

  Experiment? retrieve(AllExperimentsEnum type) {
    return cache[type];
  }

  bool isValid() {
    return experiment.isValid();
  }
}

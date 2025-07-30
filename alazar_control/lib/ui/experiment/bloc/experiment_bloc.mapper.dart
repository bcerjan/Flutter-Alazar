// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'experiment_bloc.dart';

class ExperimentStatusMapper extends EnumMapper<ExperimentStatus> {
  ExperimentStatusMapper._();

  static ExperimentStatusMapper? _instance;
  static ExperimentStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ExperimentStatusMapper._());
    }
    return _instance!;
  }

  static ExperimentStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ExperimentStatus decode(dynamic value) {
    switch (value) {
      case 'error':
        return ExperimentStatus.error;
      case 'running':
        return ExperimentStatus.running;
      case 'idle':
        return ExperimentStatus.idle;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ExperimentStatus self) {
    switch (self) {
      case ExperimentStatus.error:
        return 'error';
      case ExperimentStatus.running:
        return 'running';
      case ExperimentStatus.idle:
        return 'idle';
    }
  }
}

extension ExperimentStatusMapperExtension on ExperimentStatus {
  String toValue() {
    ExperimentStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ExperimentStatus>(this) as String;
  }
}

class ExperimentStateMapper extends ClassMapperBase<ExperimentState> {
  ExperimentStateMapper._();

  static ExperimentStateMapper? _instance;
  static ExperimentStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ExperimentStateMapper._());
      ExperimentStatusMapper.ensureInitialized();
      ExperimentMapper.ensureInitialized();
      AllExperimentsEnumMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ExperimentState';

  static ExperimentStatus _$status(ExperimentState v) => v.status;
  static const Field<ExperimentState, ExperimentStatus> _f$status =
      Field('status', _$status, opt: true, def: ExperimentStatus.idle);
  static Experiment _$experiment(ExperimentState v) => v.experiment;
  static const Field<ExperimentState, Experiment> _f$experiment = Field(
      'experiment', _$experiment,
      opt: true, def: const ExperimentGalvoGalvo.getDefault());
  static Map<AllExperimentsEnum, Experiment> _$cache(ExperimentState v) =>
      v.cache;
  static const Field<ExperimentState, Map<AllExperimentsEnum, Experiment>>
      _f$cache = Field('cache', _$cache, opt: true, def: const {});
  static String? _$errorText(ExperimentState v) => v.errorText;
  static const Field<ExperimentState, String> _f$errorText =
      Field('errorText', _$errorText, opt: true);
  static List<int>? _$imageData(ExperimentState v) => v.imageData;
  static const Field<ExperimentState, List<int>> _f$imageData =
      Field('imageData', _$imageData, mode: FieldMode.member);
  static Stream<AlazarResponse>? _$stream(ExperimentState v) => v.stream;
  static const Field<ExperimentState, Stream<AlazarResponse>> _f$stream =
      Field('stream', _$stream, mode: FieldMode.member);

  @override
  final MappableFields<ExperimentState> fields = const {
    #status: _f$status,
    #experiment: _f$experiment,
    #cache: _f$cache,
    #errorText: _f$errorText,
    #imageData: _f$imageData,
    #stream: _f$stream,
  };

  static ExperimentState _instantiate(DecodingData data) {
    return ExperimentState.serialization(
        status: data.dec(_f$status),
        experiment: data.dec(_f$experiment),
        cache: data.dec(_f$cache),
        errorText: data.dec(_f$errorText));
  }

  @override
  final Function instantiate = _instantiate;

  static ExperimentState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ExperimentState>(map);
  }

  static ExperimentState fromJson(String json) {
    return ensureInitialized().decodeJson<ExperimentState>(json);
  }
}

mixin ExperimentStateMappable {
  String toJson() {
    return ExperimentStateMapper.ensureInitialized()
        .encodeJson<ExperimentState>(this as ExperimentState);
  }

  Map<String, dynamic> toMap() {
    return ExperimentStateMapper.ensureInitialized()
        .encodeMap<ExperimentState>(this as ExperimentState);
  }

  ExperimentStateCopyWith<ExperimentState, ExperimentState, ExperimentState>
      get copyWith => _ExperimentStateCopyWithImpl(
          this as ExperimentState, $identity, $identity);
  @override
  String toString() {
    return ExperimentStateMapper.ensureInitialized()
        .stringifyValue(this as ExperimentState);
  }

  @override
  bool operator ==(Object other) {
    return ExperimentStateMapper.ensureInitialized()
        .equalsValue(this as ExperimentState, other);
  }

  @override
  int get hashCode {
    return ExperimentStateMapper.ensureInitialized()
        .hashValue(this as ExperimentState);
  }
}

extension ExperimentStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ExperimentState, $Out> {
  ExperimentStateCopyWith<$R, ExperimentState, $Out> get $asExperimentState =>
      $base.as((v, t, t2) => _ExperimentStateCopyWithImpl(v, t, t2));
}

abstract class ExperimentStateCopyWith<$R, $In extends ExperimentState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, AllExperimentsEnum, Experiment,
      ObjectCopyWith<$R, Experiment, Experiment>> get cache;
  $R call(
      {ExperimentStatus? status,
      Experiment? experiment,
      Map<AllExperimentsEnum, Experiment>? cache,
      String? errorText});
  ExperimentStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ExperimentStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ExperimentState, $Out>
    implements ExperimentStateCopyWith<$R, ExperimentState, $Out> {
  _ExperimentStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ExperimentState> $mapper =
      ExperimentStateMapper.ensureInitialized();
  @override
  MapCopyWith<$R, AllExperimentsEnum, Experiment,
          ObjectCopyWith<$R, Experiment, Experiment>>
      get cache => MapCopyWith($value.cache,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(cache: v));
  @override
  $R call(
          {ExperimentStatus? status,
          Experiment? experiment,
          Map<AllExperimentsEnum, Experiment>? cache,
          Object? errorText = $none}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (experiment != null) #experiment: experiment,
        if (cache != null) #cache: cache,
        if (errorText != $none) #errorText: errorText
      }));
  @override
  ExperimentState $make(CopyWithData data) => ExperimentState.serialization(
      status: data.get(#status, or: $value.status),
      experiment: data.get(#experiment, or: $value.experiment),
      cache: data.get(#cache, or: $value.cache),
      errorText: data.get(#errorText, or: $value.errorText));

  @override
  ExperimentStateCopyWith<$R2, ExperimentState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ExperimentStateCopyWithImpl($value, $cast, t);
}

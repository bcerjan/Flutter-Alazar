// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'experiment.dart';

class ExperimentMapper extends ClassMapperBase<Experiment> {
  ExperimentMapper._();

  static ExperimentMapper? _instance;
  static ExperimentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ExperimentMapper._());
      ExperimentImagingMapper.ensureInitialized();
      AlazarSettingsMapper.ensureInitialized();
      ControlBoxMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Experiment';

  static AlazarSettings _$settings(Experiment v) => v.settings;
  static const Field<Experiment, AlazarSettings> _f$settings =
      Field('settings', _$settings);
  static double _$laserRepRateMHz(Experiment v) => v.laserRepRateMHz;
  static const Field<Experiment, double> _f$laserRepRateMHz =
      Field('laserRepRateMHz', _$laserRepRateMHz);
  static String _$folderPath(Experiment v) => v.folderPath;
  static const Field<Experiment, String> _f$folderPath =
      Field('folderPath', _$folderPath, opt: true, def: '');
  static bool _$autosave(Experiment v) => v.autosave;
  static const Field<Experiment, bool> _f$autosave =
      Field('autosave', _$autosave, opt: true, def: false);
  static String _$liveFn(Experiment v) => v.liveFn;
  static const Field<Experiment, String> _f$liveFn =
      Field('liveFn', _$liveFn, opt: true, def: '');
  static String _$endFn(Experiment v) => v.endFn;
  static const Field<Experiment, String> _f$endFn =
      Field('endFn', _$endFn, opt: true, def: '');
  static String _$preAcqFn(Experiment v) => v.preAcqFn;
  static const Field<Experiment, String> _f$preAcqFn =
      Field('preAcqFn', _$preAcqFn, opt: true, def: '');
  static String _$postAcqFn(Experiment v) => v.postAcqFn;
  static const Field<Experiment, String> _f$postAcqFn =
      Field('postAcqFn', _$postAcqFn, opt: true, def: '');
  static int _$numberOfAcquisitions(Experiment v) => v.numberOfAcquisitions;
  static const Field<Experiment, int> _f$numberOfAcquisitions =
      Field('numberOfAcquisitions', _$numberOfAcquisitions, opt: true, def: 1);
  static bool _$controlBoxNeeded(Experiment v) => v.controlBoxNeeded;
  static const Field<Experiment, bool> _f$controlBoxNeeded =
      Field('controlBoxNeeded', _$controlBoxNeeded, opt: true, def: false);
  static ControlBox? _$controlBox(Experiment v) => v.controlBox;
  static const Field<Experiment, ControlBox> _f$controlBox =
      Field('controlBox', _$controlBox, opt: true);

  @override
  final MappableFields<Experiment> fields = const {
    #settings: _f$settings,
    #laserRepRateMHz: _f$laserRepRateMHz,
    #folderPath: _f$folderPath,
    #autosave: _f$autosave,
    #liveFn: _f$liveFn,
    #endFn: _f$endFn,
    #preAcqFn: _f$preAcqFn,
    #postAcqFn: _f$postAcqFn,
    #numberOfAcquisitions: _f$numberOfAcquisitions,
    #controlBoxNeeded: _f$controlBoxNeeded,
    #controlBox: _f$controlBox,
  };

  static Experiment _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'Experiment', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static Experiment fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Experiment>(map);
  }

  static Experiment fromJson(String json) {
    return ensureInitialized().decodeJson<Experiment>(json);
  }
}

mixin ExperimentMappable {
  String toJson();
  Map<String, dynamic> toMap();
  ExperimentCopyWith<Experiment, Experiment, Experiment> get copyWith;
}

abstract class ExperimentCopyWith<$R, $In extends Experiment, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  AlazarSettingsCopyWith<$R, AlazarSettings, AlazarSettings> get settings;
  ControlBoxCopyWith<$R, ControlBox, ControlBox>? get controlBox;
  $R call(
      {AlazarSettings? settings,
      double? laserRepRateMHz,
      String? folderPath,
      bool? autosave,
      String? liveFn,
      String? endFn,
      String? preAcqFn,
      String? postAcqFn,
      int? numberOfAcquisitions,
      bool? controlBoxNeeded,
      ControlBox? controlBox});
  ExperimentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class ExperimentImagingMapper extends SubClassMapperBase<ExperimentImaging> {
  ExperimentImagingMapper._();

  static ExperimentImagingMapper? _instance;
  static ExperimentImagingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ExperimentImagingMapper._());
      ExperimentMapper.ensureInitialized().addSubMapper(_instance!);
      ExperimentGalvoResMapper.ensureInitialized();
      ExperimentGalvoGalvoMapper.ensureInitialized();
      AlazarSettingsMapper.ensureInitialized();
      ControlBoxMapper.ensureInitialized();
      ImagingSettingsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ExperimentImaging';

  static AlazarSettings _$settings(ExperimentImaging v) => v.settings;
  static const Field<ExperimentImaging, AlazarSettings> _f$settings =
      Field('settings', _$settings);
  static double _$laserRepRateMHz(ExperimentImaging v) => v.laserRepRateMHz;
  static const Field<ExperimentImaging, double> _f$laserRepRateMHz =
      Field('laserRepRateMHz', _$laserRepRateMHz);
  static String _$folderPath(ExperimentImaging v) => v.folderPath;
  static const Field<ExperimentImaging, String> _f$folderPath =
      Field('folderPath', _$folderPath, opt: true, def: '');
  static bool _$autosave(ExperimentImaging v) => v.autosave;
  static const Field<ExperimentImaging, bool> _f$autosave =
      Field('autosave', _$autosave, opt: true, def: false);
  static String _$liveFn(ExperimentImaging v) => v.liveFn;
  static const Field<ExperimentImaging, String> _f$liveFn =
      Field('liveFn', _$liveFn, opt: true, def: '');
  static String _$endFn(ExperimentImaging v) => v.endFn;
  static const Field<ExperimentImaging, String> _f$endFn =
      Field('endFn', _$endFn, opt: true, def: '');
  static String _$preAcqFn(ExperimentImaging v) => v.preAcqFn;
  static const Field<ExperimentImaging, String> _f$preAcqFn =
      Field('preAcqFn', _$preAcqFn, opt: true, def: '');
  static String _$postAcqFn(ExperimentImaging v) => v.postAcqFn;
  static const Field<ExperimentImaging, String> _f$postAcqFn =
      Field('postAcqFn', _$postAcqFn, opt: true, def: '');
  static int _$numberOfAcquisitions(ExperimentImaging v) =>
      v.numberOfAcquisitions;
  static const Field<ExperimentImaging, int> _f$numberOfAcquisitions =
      Field('numberOfAcquisitions', _$numberOfAcquisitions, opt: true, def: 1);
  static bool _$controlBoxNeeded(ExperimentImaging v) => v.controlBoxNeeded;
  static const Field<ExperimentImaging, bool> _f$controlBoxNeeded =
      Field('controlBoxNeeded', _$controlBoxNeeded, opt: true, def: true);
  static ControlBox? _$controlBox(ExperimentImaging v) => v.controlBox;
  static const Field<ExperimentImaging, ControlBox> _f$controlBox =
      Field('controlBox', _$controlBox, opt: true);
  static ImagingSettings _$imagingSettings(ExperimentImaging v) =>
      v.imagingSettings;
  static const Field<ExperimentImaging, ImagingSettings> _f$imagingSettings =
      Field('imagingSettings', _$imagingSettings);

  @override
  final MappableFields<ExperimentImaging> fields = const {
    #settings: _f$settings,
    #laserRepRateMHz: _f$laserRepRateMHz,
    #folderPath: _f$folderPath,
    #autosave: _f$autosave,
    #liveFn: _f$liveFn,
    #endFn: _f$endFn,
    #preAcqFn: _f$preAcqFn,
    #postAcqFn: _f$postAcqFn,
    #numberOfAcquisitions: _f$numberOfAcquisitions,
    #controlBoxNeeded: _f$controlBoxNeeded,
    #controlBox: _f$controlBox,
    #imagingSettings: _f$imagingSettings,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'ExperimentImaging';
  @override
  late final ClassMapperBase superMapper = ExperimentMapper.ensureInitialized();

  static ExperimentImaging _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'ExperimentImaging', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static ExperimentImaging fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ExperimentImaging>(map);
  }

  static ExperimentImaging fromJson(String json) {
    return ensureInitialized().decodeJson<ExperimentImaging>(json);
  }
}

mixin ExperimentImagingMappable {
  String toJson();
  Map<String, dynamic> toMap();
  ExperimentImagingCopyWith<ExperimentImaging, ExperimentImaging,
      ExperimentImaging> get copyWith;
}

abstract class ExperimentImagingCopyWith<$R, $In extends ExperimentImaging,
    $Out> implements ExperimentCopyWith<$R, $In, $Out> {
  @override
  AlazarSettingsCopyWith<$R, AlazarSettings, AlazarSettings> get settings;
  @override
  ControlBoxCopyWith<$R, ControlBox, ControlBox>? get controlBox;
  ImagingSettingsCopyWith<$R, ImagingSettings, ImagingSettings>
      get imagingSettings;
  @override
  $R call(
      {AlazarSettings? settings,
      double? laserRepRateMHz,
      String? folderPath,
      bool? autosave,
      String? liveFn,
      String? endFn,
      String? preAcqFn,
      String? postAcqFn,
      int? numberOfAcquisitions,
      bool? controlBoxNeeded,
      ControlBox? controlBox,
      ImagingSettings? imagingSettings});
  ExperimentImagingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class ExperimentGalvoResMapper extends SubClassMapperBase<ExperimentGalvoRes> {
  ExperimentGalvoResMapper._();

  static ExperimentGalvoResMapper? _instance;
  static ExperimentGalvoResMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ExperimentGalvoResMapper._());
      ExperimentImagingMapper.ensureInitialized().addSubMapper(_instance!);
      AlazarSettingsMapper.ensureInitialized();
      ControlBoxMapper.ensureInitialized();
      ImagingSettingsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ExperimentGalvoRes';

  static AlazarSettings _$settings(ExperimentGalvoRes v) => v.settings;
  static const Field<ExperimentGalvoRes, AlazarSettings> _f$settings =
      Field('settings', _$settings);
  static double _$laserRepRateMHz(ExperimentGalvoRes v) => v.laserRepRateMHz;
  static const Field<ExperimentGalvoRes, double> _f$laserRepRateMHz =
      Field('laserRepRateMHz', _$laserRepRateMHz);
  static String _$folderPath(ExperimentGalvoRes v) => v.folderPath;
  static const Field<ExperimentGalvoRes, String> _f$folderPath =
      Field('folderPath', _$folderPath, opt: true, def: '');
  static bool _$autosave(ExperimentGalvoRes v) => v.autosave;
  static const Field<ExperimentGalvoRes, bool> _f$autosave =
      Field('autosave', _$autosave, opt: true, def: false);
  static String _$liveFn(ExperimentGalvoRes v) => v.liveFn;
  static const Field<ExperimentGalvoRes, String> _f$liveFn =
      Field('liveFn', _$liveFn, opt: true, def: '');
  static String _$endFn(ExperimentGalvoRes v) => v.endFn;
  static const Field<ExperimentGalvoRes, String> _f$endFn =
      Field('endFn', _$endFn, opt: true, def: 'signalAveraging');
  static String _$preAcqFn(ExperimentGalvoRes v) => v.preAcqFn;
  static const Field<ExperimentGalvoRes, String> _f$preAcqFn =
      Field('preAcqFn', _$preAcqFn, opt: true, def: '');
  static String _$postAcqFn(ExperimentGalvoRes v) => v.postAcqFn;
  static const Field<ExperimentGalvoRes, String> _f$postAcqFn =
      Field('postAcqFn', _$postAcqFn, opt: true, def: '');
  static int _$numberOfAcquisitions(ExperimentGalvoRes v) =>
      v.numberOfAcquisitions;
  static const Field<ExperimentGalvoRes, int> _f$numberOfAcquisitions =
      Field('numberOfAcquisitions', _$numberOfAcquisitions, opt: true, def: 1);
  static bool _$controlBoxNeeded(ExperimentGalvoRes v) => v.controlBoxNeeded;
  static const Field<ExperimentGalvoRes, bool> _f$controlBoxNeeded =
      Field('controlBoxNeeded', _$controlBoxNeeded, opt: true, def: false);
  static ControlBox? _$controlBox(ExperimentGalvoRes v) => v.controlBox;
  static const Field<ExperimentGalvoRes, ControlBox> _f$controlBox =
      Field('controlBox', _$controlBox, opt: true);
  static ImagingSettings _$imagingSettings(ExperimentGalvoRes v) =>
      v.imagingSettings;
  static const Field<ExperimentGalvoRes, ImagingSettings> _f$imagingSettings =
      Field('imagingSettings', _$imagingSettings,
          opt: true, def: const ImagingSettings());

  @override
  final MappableFields<ExperimentGalvoRes> fields = const {
    #settings: _f$settings,
    #laserRepRateMHz: _f$laserRepRateMHz,
    #folderPath: _f$folderPath,
    #autosave: _f$autosave,
    #liveFn: _f$liveFn,
    #endFn: _f$endFn,
    #preAcqFn: _f$preAcqFn,
    #postAcqFn: _f$postAcqFn,
    #numberOfAcquisitions: _f$numberOfAcquisitions,
    #controlBoxNeeded: _f$controlBoxNeeded,
    #controlBox: _f$controlBox,
    #imagingSettings: _f$imagingSettings,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'ExperimentGalvoRes';
  @override
  late final ClassMapperBase superMapper =
      ExperimentImagingMapper.ensureInitialized();

  static ExperimentGalvoRes _instantiate(DecodingData data) {
    return ExperimentGalvoRes(
        settings: data.dec(_f$settings),
        laserRepRateMHz: data.dec(_f$laserRepRateMHz),
        folderPath: data.dec(_f$folderPath),
        autosave: data.dec(_f$autosave),
        liveFn: data.dec(_f$liveFn),
        endFn: data.dec(_f$endFn),
        preAcqFn: data.dec(_f$preAcqFn),
        postAcqFn: data.dec(_f$postAcqFn),
        numberOfAcquisitions: data.dec(_f$numberOfAcquisitions),
        controlBoxNeeded: data.dec(_f$controlBoxNeeded),
        controlBox: data.dec(_f$controlBox),
        imagingSettings: data.dec(_f$imagingSettings));
  }

  @override
  final Function instantiate = _instantiate;

  static ExperimentGalvoRes fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ExperimentGalvoRes>(map);
  }

  static ExperimentGalvoRes fromJson(String json) {
    return ensureInitialized().decodeJson<ExperimentGalvoRes>(json);
  }
}

mixin ExperimentGalvoResMappable {
  String toJson() {
    return ExperimentGalvoResMapper.ensureInitialized()
        .encodeJson<ExperimentGalvoRes>(this as ExperimentGalvoRes);
  }

  Map<String, dynamic> toMap() {
    return ExperimentGalvoResMapper.ensureInitialized()
        .encodeMap<ExperimentGalvoRes>(this as ExperimentGalvoRes);
  }

  ExperimentGalvoResCopyWith<ExperimentGalvoRes, ExperimentGalvoRes,
          ExperimentGalvoRes>
      get copyWith => _ExperimentGalvoResCopyWithImpl(
          this as ExperimentGalvoRes, $identity, $identity);
  @override
  String toString() {
    return ExperimentGalvoResMapper.ensureInitialized()
        .stringifyValue(this as ExperimentGalvoRes);
  }

  @override
  bool operator ==(Object other) {
    return ExperimentGalvoResMapper.ensureInitialized()
        .equalsValue(this as ExperimentGalvoRes, other);
  }

  @override
  int get hashCode {
    return ExperimentGalvoResMapper.ensureInitialized()
        .hashValue(this as ExperimentGalvoRes);
  }
}

extension ExperimentGalvoResValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ExperimentGalvoRes, $Out> {
  ExperimentGalvoResCopyWith<$R, ExperimentGalvoRes, $Out>
      get $asExperimentGalvoRes =>
          $base.as((v, t, t2) => _ExperimentGalvoResCopyWithImpl(v, t, t2));
}

abstract class ExperimentGalvoResCopyWith<$R, $In extends ExperimentGalvoRes,
    $Out> implements ExperimentImagingCopyWith<$R, $In, $Out> {
  @override
  AlazarSettingsCopyWith<$R, AlazarSettings, AlazarSettings> get settings;
  @override
  ControlBoxCopyWith<$R, ControlBox, ControlBox>? get controlBox;
  @override
  ImagingSettingsCopyWith<$R, ImagingSettings, ImagingSettings>
      get imagingSettings;
  @override
  $R call(
      {AlazarSettings? settings,
      double? laserRepRateMHz,
      String? folderPath,
      bool? autosave,
      String? liveFn,
      String? endFn,
      String? preAcqFn,
      String? postAcqFn,
      int? numberOfAcquisitions,
      bool? controlBoxNeeded,
      ControlBox? controlBox,
      ImagingSettings? imagingSettings});
  ExperimentGalvoResCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ExperimentGalvoResCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ExperimentGalvoRes, $Out>
    implements ExperimentGalvoResCopyWith<$R, ExperimentGalvoRes, $Out> {
  _ExperimentGalvoResCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ExperimentGalvoRes> $mapper =
      ExperimentGalvoResMapper.ensureInitialized();
  @override
  AlazarSettingsCopyWith<$R, AlazarSettings, AlazarSettings> get settings =>
      $value.settings.copyWith.$chain((v) => call(settings: v));
  @override
  ControlBoxCopyWith<$R, ControlBox, ControlBox>? get controlBox =>
      $value.controlBox?.copyWith.$chain((v) => call(controlBox: v));
  @override
  ImagingSettingsCopyWith<$R, ImagingSettings, ImagingSettings>
      get imagingSettings => $value.imagingSettings.copyWith
          .$chain((v) => call(imagingSettings: v));
  @override
  $R call(
          {AlazarSettings? settings,
          double? laserRepRateMHz,
          String? folderPath,
          bool? autosave,
          String? liveFn,
          String? endFn,
          String? preAcqFn,
          String? postAcqFn,
          int? numberOfAcquisitions,
          bool? controlBoxNeeded,
          Object? controlBox = $none,
          ImagingSettings? imagingSettings}) =>
      $apply(FieldCopyWithData({
        if (settings != null) #settings: settings,
        if (laserRepRateMHz != null) #laserRepRateMHz: laserRepRateMHz,
        if (folderPath != null) #folderPath: folderPath,
        if (autosave != null) #autosave: autosave,
        if (liveFn != null) #liveFn: liveFn,
        if (endFn != null) #endFn: endFn,
        if (preAcqFn != null) #preAcqFn: preAcqFn,
        if (postAcqFn != null) #postAcqFn: postAcqFn,
        if (numberOfAcquisitions != null)
          #numberOfAcquisitions: numberOfAcquisitions,
        if (controlBoxNeeded != null) #controlBoxNeeded: controlBoxNeeded,
        if (controlBox != $none) #controlBox: controlBox,
        if (imagingSettings != null) #imagingSettings: imagingSettings
      }));
  @override
  ExperimentGalvoRes $make(CopyWithData data) => ExperimentGalvoRes(
      settings: data.get(#settings, or: $value.settings),
      laserRepRateMHz: data.get(#laserRepRateMHz, or: $value.laserRepRateMHz),
      folderPath: data.get(#folderPath, or: $value.folderPath),
      autosave: data.get(#autosave, or: $value.autosave),
      liveFn: data.get(#liveFn, or: $value.liveFn),
      endFn: data.get(#endFn, or: $value.endFn),
      preAcqFn: data.get(#preAcqFn, or: $value.preAcqFn),
      postAcqFn: data.get(#postAcqFn, or: $value.postAcqFn),
      numberOfAcquisitions:
          data.get(#numberOfAcquisitions, or: $value.numberOfAcquisitions),
      controlBoxNeeded:
          data.get(#controlBoxNeeded, or: $value.controlBoxNeeded),
      controlBox: data.get(#controlBox, or: $value.controlBox),
      imagingSettings: data.get(#imagingSettings, or: $value.imagingSettings));

  @override
  ExperimentGalvoResCopyWith<$R2, ExperimentGalvoRes, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ExperimentGalvoResCopyWithImpl($value, $cast, t);
}

class ExperimentGalvoGalvoMapper
    extends SubClassMapperBase<ExperimentGalvoGalvo> {
  ExperimentGalvoGalvoMapper._();

  static ExperimentGalvoGalvoMapper? _instance;
  static ExperimentGalvoGalvoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ExperimentGalvoGalvoMapper._());
      ExperimentImagingMapper.ensureInitialized().addSubMapper(_instance!);
      AlazarSettingsMapper.ensureInitialized();
      ControlBoxMapper.ensureInitialized();
      ImagingSettingsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ExperimentGalvoGalvo';

  static AlazarSettings _$settings(ExperimentGalvoGalvo v) => v.settings;
  static const Field<ExperimentGalvoGalvo, AlazarSettings> _f$settings =
      Field('settings', _$settings);
  static double _$laserRepRateMHz(ExperimentGalvoGalvo v) => v.laserRepRateMHz;
  static const Field<ExperimentGalvoGalvo, double> _f$laserRepRateMHz =
      Field('laserRepRateMHz', _$laserRepRateMHz);
  static String _$folderPath(ExperimentGalvoGalvo v) => v.folderPath;
  static const Field<ExperimentGalvoGalvo, String> _f$folderPath =
      Field('folderPath', _$folderPath, opt: true, def: '');
  static bool _$autosave(ExperimentGalvoGalvo v) => v.autosave;
  static const Field<ExperimentGalvoGalvo, bool> _f$autosave =
      Field('autosave', _$autosave, opt: true, def: false);
  static String _$liveFn(ExperimentGalvoGalvo v) => v.liveFn;
  static const Field<ExperimentGalvoGalvo, String> _f$liveFn =
      Field('liveFn', _$liveFn, opt: true, def: '');
  static String _$endFn(ExperimentGalvoGalvo v) => v.endFn;
  static const Field<ExperimentGalvoGalvo, String> _f$endFn =
      Field('endFn', _$endFn, opt: true, def: 'fptirAnalysis');
  static String _$preAcqFn(ExperimentGalvoGalvo v) => v.preAcqFn;
  static const Field<ExperimentGalvoGalvo, String> _f$preAcqFn =
      Field('preAcqFn', _$preAcqFn, opt: true, def: '');
  static String _$postAcqFn(ExperimentGalvoGalvo v) => v.postAcqFn;
  static const Field<ExperimentGalvoGalvo, String> _f$postAcqFn =
      Field('postAcqFn', _$postAcqFn, opt: true, def: '');
  static int _$numberOfAcquisitions(ExperimentGalvoGalvo v) =>
      v.numberOfAcquisitions;
  static const Field<ExperimentGalvoGalvo, int> _f$numberOfAcquisitions =
      Field('numberOfAcquisitions', _$numberOfAcquisitions, opt: true, def: 1);
  static bool _$controlBoxNeeded(ExperimentGalvoGalvo v) => v.controlBoxNeeded;
  static const Field<ExperimentGalvoGalvo, bool> _f$controlBoxNeeded =
      Field('controlBoxNeeded', _$controlBoxNeeded, opt: true, def: true);
  static ControlBox? _$controlBox(ExperimentGalvoGalvo v) => v.controlBox;
  static const Field<ExperimentGalvoGalvo, ControlBox> _f$controlBox =
      Field('controlBox', _$controlBox, opt: true);
  static ImagingSettings _$imagingSettings(ExperimentGalvoGalvo v) =>
      v.imagingSettings;
  static const Field<ExperimentGalvoGalvo, ImagingSettings> _f$imagingSettings =
      Field('imagingSettings', _$imagingSettings,
          opt: true, def: const ImagingSettings());

  @override
  final MappableFields<ExperimentGalvoGalvo> fields = const {
    #settings: _f$settings,
    #laserRepRateMHz: _f$laserRepRateMHz,
    #folderPath: _f$folderPath,
    #autosave: _f$autosave,
    #liveFn: _f$liveFn,
    #endFn: _f$endFn,
    #preAcqFn: _f$preAcqFn,
    #postAcqFn: _f$postAcqFn,
    #numberOfAcquisitions: _f$numberOfAcquisitions,
    #controlBoxNeeded: _f$controlBoxNeeded,
    #controlBox: _f$controlBox,
    #imagingSettings: _f$imagingSettings,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'ExperimentGalvoGalvo';
  @override
  late final ClassMapperBase superMapper =
      ExperimentImagingMapper.ensureInitialized();

  static ExperimentGalvoGalvo _instantiate(DecodingData data) {
    return ExperimentGalvoGalvo(
        settings: data.dec(_f$settings),
        laserRepRateMHz: data.dec(_f$laserRepRateMHz),
        folderPath: data.dec(_f$folderPath),
        autosave: data.dec(_f$autosave),
        liveFn: data.dec(_f$liveFn),
        endFn: data.dec(_f$endFn),
        preAcqFn: data.dec(_f$preAcqFn),
        postAcqFn: data.dec(_f$postAcqFn),
        numberOfAcquisitions: data.dec(_f$numberOfAcquisitions),
        controlBoxNeeded: data.dec(_f$controlBoxNeeded),
        controlBox: data.dec(_f$controlBox),
        imagingSettings: data.dec(_f$imagingSettings));
  }

  @override
  final Function instantiate = _instantiate;

  static ExperimentGalvoGalvo fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ExperimentGalvoGalvo>(map);
  }

  static ExperimentGalvoGalvo fromJson(String json) {
    return ensureInitialized().decodeJson<ExperimentGalvoGalvo>(json);
  }
}

mixin ExperimentGalvoGalvoMappable {
  String toJson() {
    return ExperimentGalvoGalvoMapper.ensureInitialized()
        .encodeJson<ExperimentGalvoGalvo>(this as ExperimentGalvoGalvo);
  }

  Map<String, dynamic> toMap() {
    return ExperimentGalvoGalvoMapper.ensureInitialized()
        .encodeMap<ExperimentGalvoGalvo>(this as ExperimentGalvoGalvo);
  }

  ExperimentGalvoGalvoCopyWith<ExperimentGalvoGalvo, ExperimentGalvoGalvo,
          ExperimentGalvoGalvo>
      get copyWith => _ExperimentGalvoGalvoCopyWithImpl(
          this as ExperimentGalvoGalvo, $identity, $identity);
  @override
  String toString() {
    return ExperimentGalvoGalvoMapper.ensureInitialized()
        .stringifyValue(this as ExperimentGalvoGalvo);
  }

  @override
  bool operator ==(Object other) {
    return ExperimentGalvoGalvoMapper.ensureInitialized()
        .equalsValue(this as ExperimentGalvoGalvo, other);
  }

  @override
  int get hashCode {
    return ExperimentGalvoGalvoMapper.ensureInitialized()
        .hashValue(this as ExperimentGalvoGalvo);
  }
}

extension ExperimentGalvoGalvoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ExperimentGalvoGalvo, $Out> {
  ExperimentGalvoGalvoCopyWith<$R, ExperimentGalvoGalvo, $Out>
      get $asExperimentGalvoGalvo =>
          $base.as((v, t, t2) => _ExperimentGalvoGalvoCopyWithImpl(v, t, t2));
}

abstract class ExperimentGalvoGalvoCopyWith<
    $R,
    $In extends ExperimentGalvoGalvo,
    $Out> implements ExperimentImagingCopyWith<$R, $In, $Out> {
  @override
  AlazarSettingsCopyWith<$R, AlazarSettings, AlazarSettings> get settings;
  @override
  ControlBoxCopyWith<$R, ControlBox, ControlBox>? get controlBox;
  @override
  ImagingSettingsCopyWith<$R, ImagingSettings, ImagingSettings>
      get imagingSettings;
  @override
  $R call(
      {AlazarSettings? settings,
      double? laserRepRateMHz,
      String? folderPath,
      bool? autosave,
      String? liveFn,
      String? endFn,
      String? preAcqFn,
      String? postAcqFn,
      int? numberOfAcquisitions,
      bool? controlBoxNeeded,
      ControlBox? controlBox,
      ImagingSettings? imagingSettings});
  ExperimentGalvoGalvoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ExperimentGalvoGalvoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ExperimentGalvoGalvo, $Out>
    implements ExperimentGalvoGalvoCopyWith<$R, ExperimentGalvoGalvo, $Out> {
  _ExperimentGalvoGalvoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ExperimentGalvoGalvo> $mapper =
      ExperimentGalvoGalvoMapper.ensureInitialized();
  @override
  AlazarSettingsCopyWith<$R, AlazarSettings, AlazarSettings> get settings =>
      $value.settings.copyWith.$chain((v) => call(settings: v));
  @override
  ControlBoxCopyWith<$R, ControlBox, ControlBox>? get controlBox =>
      $value.controlBox?.copyWith.$chain((v) => call(controlBox: v));
  @override
  ImagingSettingsCopyWith<$R, ImagingSettings, ImagingSettings>
      get imagingSettings => $value.imagingSettings.copyWith
          .$chain((v) => call(imagingSettings: v));
  @override
  $R call(
          {AlazarSettings? settings,
          double? laserRepRateMHz,
          String? folderPath,
          bool? autosave,
          String? liveFn,
          String? endFn,
          String? preAcqFn,
          String? postAcqFn,
          int? numberOfAcquisitions,
          bool? controlBoxNeeded,
          Object? controlBox = $none,
          ImagingSettings? imagingSettings}) =>
      $apply(FieldCopyWithData({
        if (settings != null) #settings: settings,
        if (laserRepRateMHz != null) #laserRepRateMHz: laserRepRateMHz,
        if (folderPath != null) #folderPath: folderPath,
        if (autosave != null) #autosave: autosave,
        if (liveFn != null) #liveFn: liveFn,
        if (endFn != null) #endFn: endFn,
        if (preAcqFn != null) #preAcqFn: preAcqFn,
        if (postAcqFn != null) #postAcqFn: postAcqFn,
        if (numberOfAcquisitions != null)
          #numberOfAcquisitions: numberOfAcquisitions,
        if (controlBoxNeeded != null) #controlBoxNeeded: controlBoxNeeded,
        if (controlBox != $none) #controlBox: controlBox,
        if (imagingSettings != null) #imagingSettings: imagingSettings
      }));
  @override
  ExperimentGalvoGalvo $make(CopyWithData data) => ExperimentGalvoGalvo(
      settings: data.get(#settings, or: $value.settings),
      laserRepRateMHz: data.get(#laserRepRateMHz, or: $value.laserRepRateMHz),
      folderPath: data.get(#folderPath, or: $value.folderPath),
      autosave: data.get(#autosave, or: $value.autosave),
      liveFn: data.get(#liveFn, or: $value.liveFn),
      endFn: data.get(#endFn, or: $value.endFn),
      preAcqFn: data.get(#preAcqFn, or: $value.preAcqFn),
      postAcqFn: data.get(#postAcqFn, or: $value.postAcqFn),
      numberOfAcquisitions:
          data.get(#numberOfAcquisitions, or: $value.numberOfAcquisitions),
      controlBoxNeeded:
          data.get(#controlBoxNeeded, or: $value.controlBoxNeeded),
      controlBox: data.get(#controlBox, or: $value.controlBox),
      imagingSettings: data.get(#imagingSettings, or: $value.imagingSettings));

  @override
  ExperimentGalvoGalvoCopyWith<$R2, ExperimentGalvoGalvo, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ExperimentGalvoGalvoCopyWithImpl($value, $cast, t);
}

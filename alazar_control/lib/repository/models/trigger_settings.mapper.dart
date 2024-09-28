// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'trigger_settings.dart';

class TriggerSettingsMapper extends ClassMapperBase<TriggerSettings> {
  TriggerSettingsMapper._();

  static TriggerSettingsMapper? _instance;
  static TriggerSettingsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TriggerSettingsMapper._());
      TriggerModeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TriggerSettings';

  static TriggerMode _$triggerMode(TriggerSettings v) => v.triggerMode;
  static const Field<TriggerSettings, TriggerMode> _f$triggerMode =
      Field('triggerMode', _$triggerMode, opt: true, def: TriggerMode.pll);
  static int _$triggerLevel(TriggerSettings v) => v.triggerLevel;
  static const Field<TriggerSettings, int> _f$triggerLevel =
      Field('triggerLevel', _$triggerLevel, opt: true, def: 160);
  static double _$triggerDelaySec(TriggerSettings v) => v.triggerDelaySec;
  static const Field<TriggerSettings, double> _f$triggerDelaySec =
      Field('triggerDelaySec', _$triggerDelaySec, opt: true, def: 0.0);
  static double _$triggerTimeoutSec(TriggerSettings v) => v.triggerTimeoutSec;
  static const Field<TriggerSettings, double> _f$triggerTimeoutSec =
      Field('triggerTimeoutSec', _$triggerTimeoutSec, opt: true, def: 0.0);
  static int _$preTriggerSamples(TriggerSettings v) => v.preTriggerSamples;
  static const Field<TriggerSettings, int> _f$preTriggerSamples =
      Field('preTriggerSamples', _$preTriggerSamples, opt: true, def: 0);

  @override
  final MappableFields<TriggerSettings> fields = const {
    #triggerMode: _f$triggerMode,
    #triggerLevel: _f$triggerLevel,
    #triggerDelaySec: _f$triggerDelaySec,
    #triggerTimeoutSec: _f$triggerTimeoutSec,
    #preTriggerSamples: _f$preTriggerSamples,
  };

  static TriggerSettings _instantiate(DecodingData data) {
    return TriggerSettings(
        triggerMode: data.dec(_f$triggerMode),
        triggerLevel: data.dec(_f$triggerLevel),
        triggerDelaySec: data.dec(_f$triggerDelaySec),
        triggerTimeoutSec: data.dec(_f$triggerTimeoutSec),
        preTriggerSamples: data.dec(_f$preTriggerSamples));
  }

  @override
  final Function instantiate = _instantiate;

  static TriggerSettings fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TriggerSettings>(map);
  }

  static TriggerSettings fromJson(String json) {
    return ensureInitialized().decodeJson<TriggerSettings>(json);
  }
}

mixin TriggerSettingsMappable {
  String toJson() {
    return TriggerSettingsMapper.ensureInitialized()
        .encodeJson<TriggerSettings>(this as TriggerSettings);
  }

  Map<String, dynamic> toMap() {
    return TriggerSettingsMapper.ensureInitialized()
        .encodeMap<TriggerSettings>(this as TriggerSettings);
  }

  TriggerSettingsCopyWith<TriggerSettings, TriggerSettings, TriggerSettings>
      get copyWith => _TriggerSettingsCopyWithImpl(
          this as TriggerSettings, $identity, $identity);
  @override
  String toString() {
    return TriggerSettingsMapper.ensureInitialized()
        .stringifyValue(this as TriggerSettings);
  }

  @override
  bool operator ==(Object other) {
    return TriggerSettingsMapper.ensureInitialized()
        .equalsValue(this as TriggerSettings, other);
  }

  @override
  int get hashCode {
    return TriggerSettingsMapper.ensureInitialized()
        .hashValue(this as TriggerSettings);
  }
}

extension TriggerSettingsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TriggerSettings, $Out> {
  TriggerSettingsCopyWith<$R, TriggerSettings, $Out> get $asTriggerSettings =>
      $base.as((v, t, t2) => _TriggerSettingsCopyWithImpl(v, t, t2));
}

abstract class TriggerSettingsCopyWith<$R, $In extends TriggerSettings, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {TriggerMode? triggerMode,
      int? triggerLevel,
      double? triggerDelaySec,
      double? triggerTimeoutSec,
      int? preTriggerSamples});
  TriggerSettingsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TriggerSettingsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TriggerSettings, $Out>
    implements TriggerSettingsCopyWith<$R, TriggerSettings, $Out> {
  _TriggerSettingsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TriggerSettings> $mapper =
      TriggerSettingsMapper.ensureInitialized();
  @override
  $R call(
          {TriggerMode? triggerMode,
          int? triggerLevel,
          double? triggerDelaySec,
          double? triggerTimeoutSec,
          int? preTriggerSamples}) =>
      $apply(FieldCopyWithData({
        if (triggerMode != null) #triggerMode: triggerMode,
        if (triggerLevel != null) #triggerLevel: triggerLevel,
        if (triggerDelaySec != null) #triggerDelaySec: triggerDelaySec,
        if (triggerTimeoutSec != null) #triggerTimeoutSec: triggerTimeoutSec,
        if (preTriggerSamples != null) #preTriggerSamples: preTriggerSamples
      }));
  @override
  TriggerSettings $make(CopyWithData data) => TriggerSettings(
      triggerMode: data.get(#triggerMode, or: $value.triggerMode),
      triggerLevel: data.get(#triggerLevel, or: $value.triggerLevel),
      triggerDelaySec: data.get(#triggerDelaySec, or: $value.triggerDelaySec),
      triggerTimeoutSec:
          data.get(#triggerTimeoutSec, or: $value.triggerTimeoutSec),
      preTriggerSamples:
          data.get(#preTriggerSamples, or: $value.preTriggerSamples));

  @override
  TriggerSettingsCopyWith<$R2, TriggerSettings, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TriggerSettingsCopyWithImpl($value, $cast, t);
}

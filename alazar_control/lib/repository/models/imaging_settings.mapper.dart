// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'imaging_settings.dart';

class ImagingSettingsMapper extends ClassMapperBase<ImagingSettings> {
  ImagingSettingsMapper._();

  static ImagingSettingsMapper? _instance;
  static ImagingSettingsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ImagingSettingsMapper._());
      AlazarChannelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ImagingSettings';

  static double _$scanPeriodUs(ImagingSettings v) => v.scanPeriodUs;
  static const Field<ImagingSettings, double> _f$scanPeriodUs =
      Field('scanPeriodUs', _$scanPeriodUs, opt: true, def: 66.3);
  static int _$imageHeightPix(ImagingSettings v) => v.imageHeightPix;
  static const Field<ImagingSettings, int> _f$imageHeightPix =
      Field('imageHeightPix', _$imageHeightPix, opt: true, def: 512);
  static int _$imageWidthPix(ImagingSettings v) => v.imageWidthPix;
  static const Field<ImagingSettings, int> _f$imageWidthPix =
      Field('imageWidthPix', _$imageWidthPix, opt: true, def: 512);
  static int _$numberOfFrames(ImagingSettings v) => v.numberOfFrames;
  static const Field<ImagingSettings, int> _f$numberOfFrames =
      Field('numberOfFrames', _$numberOfFrames, opt: true, def: 1);
  static double _$fastMirrorPhase(ImagingSettings v) => v.fastMirrorPhase;
  static const Field<ImagingSettings, double> _f$fastMirrorPhase =
      Field('fastMirrorPhase', _$fastMirrorPhase, opt: true, def: 0.0);
  static int _$liveFrames(ImagingSettings v) => v.liveFrames;
  static const Field<ImagingSettings, int> _f$liveFrames =
      Field('liveFrames', _$liveFrames, opt: true, def: 1);
  static AlazarChannel? _$liveChannel(ImagingSettings v) => v.liveChannel;
  static const Field<ImagingSettings, AlazarChannel> _f$liveChannel =
      Field('liveChannel', _$liveChannel, opt: true);

  @override
  final MappableFields<ImagingSettings> fields = const {
    #scanPeriodUs: _f$scanPeriodUs,
    #imageHeightPix: _f$imageHeightPix,
    #imageWidthPix: _f$imageWidthPix,
    #numberOfFrames: _f$numberOfFrames,
    #fastMirrorPhase: _f$fastMirrorPhase,
    #liveFrames: _f$liveFrames,
    #liveChannel: _f$liveChannel,
  };

  static ImagingSettings _instantiate(DecodingData data) {
    return ImagingSettings(
        scanPeriodUs: data.dec(_f$scanPeriodUs),
        imageHeightPix: data.dec(_f$imageHeightPix),
        imageWidthPix: data.dec(_f$imageWidthPix),
        numberOfFrames: data.dec(_f$numberOfFrames),
        fastMirrorPhase: data.dec(_f$fastMirrorPhase),
        liveFrames: data.dec(_f$liveFrames),
        liveChannel: data.dec(_f$liveChannel));
  }

  @override
  final Function instantiate = _instantiate;

  static ImagingSettings fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ImagingSettings>(map);
  }

  static ImagingSettings fromJson(String json) {
    return ensureInitialized().decodeJson<ImagingSettings>(json);
  }
}

mixin ImagingSettingsMappable {
  String toJson() {
    return ImagingSettingsMapper.ensureInitialized()
        .encodeJson<ImagingSettings>(this as ImagingSettings);
  }

  Map<String, dynamic> toMap() {
    return ImagingSettingsMapper.ensureInitialized()
        .encodeMap<ImagingSettings>(this as ImagingSettings);
  }

  ImagingSettingsCopyWith<ImagingSettings, ImagingSettings, ImagingSettings>
      get copyWith => _ImagingSettingsCopyWithImpl(
          this as ImagingSettings, $identity, $identity);
  @override
  String toString() {
    return ImagingSettingsMapper.ensureInitialized()
        .stringifyValue(this as ImagingSettings);
  }

  @override
  bool operator ==(Object other) {
    return ImagingSettingsMapper.ensureInitialized()
        .equalsValue(this as ImagingSettings, other);
  }

  @override
  int get hashCode {
    return ImagingSettingsMapper.ensureInitialized()
        .hashValue(this as ImagingSettings);
  }
}

extension ImagingSettingsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ImagingSettings, $Out> {
  ImagingSettingsCopyWith<$R, ImagingSettings, $Out> get $asImagingSettings =>
      $base.as((v, t, t2) => _ImagingSettingsCopyWithImpl(v, t, t2));
}

abstract class ImagingSettingsCopyWith<$R, $In extends ImagingSettings, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  AlazarChannelCopyWith<$R, AlazarChannel, AlazarChannel>? get liveChannel;
  $R call(
      {double? scanPeriodUs,
      int? imageHeightPix,
      int? imageWidthPix,
      int? numberOfFrames,
      double? fastMirrorPhase,
      int? liveFrames,
      AlazarChannel? liveChannel});
  ImagingSettingsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ImagingSettingsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ImagingSettings, $Out>
    implements ImagingSettingsCopyWith<$R, ImagingSettings, $Out> {
  _ImagingSettingsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ImagingSettings> $mapper =
      ImagingSettingsMapper.ensureInitialized();
  @override
  AlazarChannelCopyWith<$R, AlazarChannel, AlazarChannel>? get liveChannel =>
      $value.liveChannel?.copyWith.$chain((v) => call(liveChannel: v));
  @override
  $R call(
          {double? scanPeriodUs,
          int? imageHeightPix,
          int? imageWidthPix,
          int? numberOfFrames,
          double? fastMirrorPhase,
          int? liveFrames,
          Object? liveChannel = $none}) =>
      $apply(FieldCopyWithData({
        if (scanPeriodUs != null) #scanPeriodUs: scanPeriodUs,
        if (imageHeightPix != null) #imageHeightPix: imageHeightPix,
        if (imageWidthPix != null) #imageWidthPix: imageWidthPix,
        if (numberOfFrames != null) #numberOfFrames: numberOfFrames,
        if (fastMirrorPhase != null) #fastMirrorPhase: fastMirrorPhase,
        if (liveFrames != null) #liveFrames: liveFrames,
        if (liveChannel != $none) #liveChannel: liveChannel
      }));
  @override
  ImagingSettings $make(CopyWithData data) => ImagingSettings(
      scanPeriodUs: data.get(#scanPeriodUs, or: $value.scanPeriodUs),
      imageHeightPix: data.get(#imageHeightPix, or: $value.imageHeightPix),
      imageWidthPix: data.get(#imageWidthPix, or: $value.imageWidthPix),
      numberOfFrames: data.get(#numberOfFrames, or: $value.numberOfFrames),
      fastMirrorPhase: data.get(#fastMirrorPhase, or: $value.fastMirrorPhase),
      liveFrames: data.get(#liveFrames, or: $value.liveFrames),
      liveChannel: data.get(#liveChannel, or: $value.liveChannel));

  @override
  ImagingSettingsCopyWith<$R2, ImagingSettings, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ImagingSettingsCopyWithImpl($value, $cast, t);
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'alazar_settings.dart';

class AlazarSettingsMapper extends ClassMapperBase<AlazarSettings> {
  AlazarSettingsMapper._();

  static AlazarSettingsMapper? _instance;
  static AlazarSettingsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AlazarSettingsMapper._());
      AlazarBoardMapper.ensureInitialized();
      TriggerModeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AlazarSettings';

  static int _$sampleRate(AlazarSettings v) => v.sampleRate;
  static const Field<AlazarSettings, int> _f$sampleRate =
      Field('sampleRate', _$sampleRate);
  static int _$decimationFactor(AlazarSettings v) => v.decimationFactor;
  static const Field<AlazarSettings, int> _f$decimationFactor =
      Field('decimationFactor', _$decimationFactor);
  static int _$samplesPerRecord(AlazarSettings v) => v.samplesPerRecord;
  static const Field<AlazarSettings, int> _f$samplesPerRecord =
      Field('samplesPerRecord', _$samplesPerRecord);
  static int _$totalSamples(AlazarSettings v) => v.totalSamples;
  static const Field<AlazarSettings, int> _f$totalSamples =
      Field('totalSamples', _$totalSamples);
  static int _$recordsPerBuffer(AlazarSettings v) => v.recordsPerBuffer;
  static const Field<AlazarSettings, int> _f$recordsPerBuffer =
      Field('recordsPerBuffer', _$recordsPerBuffer, opt: true, def: 1);
  static int _$numBuffers(AlazarSettings v) => v.numBuffers;
  static const Field<AlazarSettings, int> _f$numBuffers =
      Field('numBuffers', _$numBuffers, opt: true, def: 1);
  static int _$recordsPerAcquisition(AlazarSettings v) =>
      v.recordsPerAcquisition;
  static const Field<AlazarSettings, int> _f$recordsPerAcquisition = Field(
      'recordsPerAcquisition', _$recordsPerAcquisition,
      opt: true, def: 1);
  static int _$preTriggerSamples(AlazarSettings v) => v.preTriggerSamples;
  static const Field<AlazarSettings, int> _f$preTriggerSamples =
      Field('preTriggerSamples', _$preTriggerSamples, opt: true, def: 0);
  static double _$triggerDelaySec(AlazarSettings v) => v.triggerDelaySec;
  static const Field<AlazarSettings, double> _f$triggerDelaySec =
      Field('triggerDelaySec', _$triggerDelaySec, opt: true, def: 0.0);
  static double _$triggerTimeoutSec(AlazarSettings v) => v.triggerTimeoutSec;
  static const Field<AlazarSettings, double> _f$triggerTimeoutSec =
      Field('triggerTimeoutSec', _$triggerTimeoutSec, opt: true, def: 0.0);
  static int _$triggerLevel(AlazarSettings v) => v.triggerLevel;
  static const Field<AlazarSettings, int> _f$triggerLevel =
      Field('triggerLevel', _$triggerLevel, opt: true, def: 160);
  static List<AlazarBoard> _$boards(AlazarSettings v) => v.boards;
  static const Field<AlazarSettings, List<AlazarBoard>> _f$boards =
      Field('boards', _$boards, opt: true, def: const []);
  static TriggerMode _$triggerMode(AlazarSettings v) => v.triggerMode;
  static const Field<AlazarSettings, TriggerMode> _f$triggerMode =
      Field('triggerMode', _$triggerMode, opt: true, def: TriggerMode.pll);

  @override
  final MappableFields<AlazarSettings> fields = const {
    #sampleRate: _f$sampleRate,
    #decimationFactor: _f$decimationFactor,
    #samplesPerRecord: _f$samplesPerRecord,
    #totalSamples: _f$totalSamples,
    #recordsPerBuffer: _f$recordsPerBuffer,
    #numBuffers: _f$numBuffers,
    #recordsPerAcquisition: _f$recordsPerAcquisition,
    #preTriggerSamples: _f$preTriggerSamples,
    #triggerDelaySec: _f$triggerDelaySec,
    #triggerTimeoutSec: _f$triggerTimeoutSec,
    #triggerLevel: _f$triggerLevel,
    #boards: _f$boards,
    #triggerMode: _f$triggerMode,
  };

  static AlazarSettings _instantiate(DecodingData data) {
    return AlazarSettings(
        sampleRate: data.dec(_f$sampleRate),
        decimationFactor: data.dec(_f$decimationFactor),
        samplesPerRecord: data.dec(_f$samplesPerRecord),
        totalSamples: data.dec(_f$totalSamples),
        recordsPerBuffer: data.dec(_f$recordsPerBuffer),
        numBuffers: data.dec(_f$numBuffers),
        recordsPerAcquisition: data.dec(_f$recordsPerAcquisition),
        preTriggerSamples: data.dec(_f$preTriggerSamples),
        triggerDelaySec: data.dec(_f$triggerDelaySec),
        triggerTimeoutSec: data.dec(_f$triggerTimeoutSec),
        triggerLevel: data.dec(_f$triggerLevel),
        boards: data.dec(_f$boards),
        triggerMode: data.dec(_f$triggerMode));
  }

  @override
  final Function instantiate = _instantiate;

  static AlazarSettings fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AlazarSettings>(map);
  }

  static AlazarSettings fromJson(String json) {
    return ensureInitialized().decodeJson<AlazarSettings>(json);
  }
}

mixin AlazarSettingsMappable {
  String toJson() {
    return AlazarSettingsMapper.ensureInitialized()
        .encodeJson<AlazarSettings>(this as AlazarSettings);
  }

  Map<String, dynamic> toMap() {
    return AlazarSettingsMapper.ensureInitialized()
        .encodeMap<AlazarSettings>(this as AlazarSettings);
  }

  AlazarSettingsCopyWith<AlazarSettings, AlazarSettings, AlazarSettings>
      get copyWith => _AlazarSettingsCopyWithImpl(
          this as AlazarSettings, $identity, $identity);
  @override
  String toString() {
    return AlazarSettingsMapper.ensureInitialized()
        .stringifyValue(this as AlazarSettings);
  }

  @override
  bool operator ==(Object other) {
    return AlazarSettingsMapper.ensureInitialized()
        .equalsValue(this as AlazarSettings, other);
  }

  @override
  int get hashCode {
    return AlazarSettingsMapper.ensureInitialized()
        .hashValue(this as AlazarSettings);
  }
}

extension AlazarSettingsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AlazarSettings, $Out> {
  AlazarSettingsCopyWith<$R, AlazarSettings, $Out> get $asAlazarSettings =>
      $base.as((v, t, t2) => _AlazarSettingsCopyWithImpl(v, t, t2));
}

abstract class AlazarSettingsCopyWith<$R, $In extends AlazarSettings, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, AlazarBoard,
      AlazarBoardCopyWith<$R, AlazarBoard, AlazarBoard>> get boards;
  $R call(
      {int? sampleRate,
      int? decimationFactor,
      int? samplesPerRecord,
      int? totalSamples,
      int? recordsPerBuffer,
      int? numBuffers,
      int? recordsPerAcquisition,
      int? preTriggerSamples,
      double? triggerDelaySec,
      double? triggerTimeoutSec,
      int? triggerLevel,
      List<AlazarBoard>? boards,
      TriggerMode? triggerMode});
  AlazarSettingsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AlazarSettingsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AlazarSettings, $Out>
    implements AlazarSettingsCopyWith<$R, AlazarSettings, $Out> {
  _AlazarSettingsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AlazarSettings> $mapper =
      AlazarSettingsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, AlazarBoard,
          AlazarBoardCopyWith<$R, AlazarBoard, AlazarBoard>>
      get boards => ListCopyWith($value.boards, (v, t) => v.copyWith.$chain(t),
          (v) => call(boards: v));
  @override
  $R call(
          {int? sampleRate,
          int? decimationFactor,
          int? samplesPerRecord,
          int? totalSamples,
          int? recordsPerBuffer,
          int? numBuffers,
          int? recordsPerAcquisition,
          int? preTriggerSamples,
          double? triggerDelaySec,
          double? triggerTimeoutSec,
          int? triggerLevel,
          List<AlazarBoard>? boards,
          TriggerMode? triggerMode}) =>
      $apply(FieldCopyWithData({
        if (sampleRate != null) #sampleRate: sampleRate,
        if (decimationFactor != null) #decimationFactor: decimationFactor,
        if (samplesPerRecord != null) #samplesPerRecord: samplesPerRecord,
        if (totalSamples != null) #totalSamples: totalSamples,
        if (recordsPerBuffer != null) #recordsPerBuffer: recordsPerBuffer,
        if (numBuffers != null) #numBuffers: numBuffers,
        if (recordsPerAcquisition != null)
          #recordsPerAcquisition: recordsPerAcquisition,
        if (preTriggerSamples != null) #preTriggerSamples: preTriggerSamples,
        if (triggerDelaySec != null) #triggerDelaySec: triggerDelaySec,
        if (triggerTimeoutSec != null) #triggerTimeoutSec: triggerTimeoutSec,
        if (triggerLevel != null) #triggerLevel: triggerLevel,
        if (boards != null) #boards: boards,
        if (triggerMode != null) #triggerMode: triggerMode
      }));
  @override
  AlazarSettings $make(CopyWithData data) => AlazarSettings(
      sampleRate: data.get(#sampleRate, or: $value.sampleRate),
      decimationFactor:
          data.get(#decimationFactor, or: $value.decimationFactor),
      samplesPerRecord:
          data.get(#samplesPerRecord, or: $value.samplesPerRecord),
      totalSamples: data.get(#totalSamples, or: $value.totalSamples),
      recordsPerBuffer:
          data.get(#recordsPerBuffer, or: $value.recordsPerBuffer),
      numBuffers: data.get(#numBuffers, or: $value.numBuffers),
      recordsPerAcquisition:
          data.get(#recordsPerAcquisition, or: $value.recordsPerAcquisition),
      preTriggerSamples:
          data.get(#preTriggerSamples, or: $value.preTriggerSamples),
      triggerDelaySec: data.get(#triggerDelaySec, or: $value.triggerDelaySec),
      triggerTimeoutSec:
          data.get(#triggerTimeoutSec, or: $value.triggerTimeoutSec),
      triggerLevel: data.get(#triggerLevel, or: $value.triggerLevel),
      boards: data.get(#boards, or: $value.boards),
      triggerMode: data.get(#triggerMode, or: $value.triggerMode));

  @override
  AlazarSettingsCopyWith<$R2, AlazarSettings, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AlazarSettingsCopyWithImpl($value, $cast, t);
}

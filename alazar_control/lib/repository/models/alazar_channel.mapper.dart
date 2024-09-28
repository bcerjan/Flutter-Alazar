// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'alazar_channel.dart';

class AlazarChannelMapper extends ClassMapperBase<AlazarChannel> {
  AlazarChannelMapper._();

  static AlazarChannelMapper? _instance;
  static AlazarChannelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AlazarChannelMapper._());
      ChannelCouplingMapper.ensureInitialized();
      ChannelTerminationMapper.ensureInitialized();
      ChannelRangeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AlazarChannel';

  static bool _$enabled(AlazarChannel v) => v.enabled;
  static const Field<AlazarChannel, bool> _f$enabled =
      Field('enabled', _$enabled, opt: true, def: false);
  static ChannelCoupling _$coupling(AlazarChannel v) => v.coupling;
  static const Field<AlazarChannel, ChannelCoupling> _f$coupling =
      Field('coupling', _$coupling, opt: true, def: ChannelCoupling.dc);
  static ChannelTermination _$termination(AlazarChannel v) => v.termination;
  static const Field<AlazarChannel, ChannelTermination> _f$termination = Field(
      'termination', _$termination,
      opt: true, def: ChannelTermination.ohm50);
  static ChannelRange _$range(AlazarChannel v) => v.range;
  static const Field<AlazarChannel, ChannelRange> _f$range =
      Field('range', _$range, opt: true, def: ChannelRange.mv400);
  static int _$channelNum(AlazarChannel v) => v.channelNum;
  static const Field<AlazarChannel, int> _f$channelNum =
      Field('channelNum', _$channelNum);
  static int _$boardNum(AlazarChannel v) => v.boardNum;
  static const Field<AlazarChannel, int> _f$boardNum =
      Field('boardNum', _$boardNum);

  @override
  final MappableFields<AlazarChannel> fields = const {
    #enabled: _f$enabled,
    #coupling: _f$coupling,
    #termination: _f$termination,
    #range: _f$range,
    #channelNum: _f$channelNum,
    #boardNum: _f$boardNum,
  };

  static AlazarChannel _instantiate(DecodingData data) {
    return AlazarChannel(
        enabled: data.dec(_f$enabled),
        coupling: data.dec(_f$coupling),
        termination: data.dec(_f$termination),
        range: data.dec(_f$range),
        channelNum: data.dec(_f$channelNum),
        boardNum: data.dec(_f$boardNum));
  }

  @override
  final Function instantiate = _instantiate;

  static AlazarChannel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AlazarChannel>(map);
  }

  static AlazarChannel fromJson(String json) {
    return ensureInitialized().decodeJson<AlazarChannel>(json);
  }
}

mixin AlazarChannelMappable {
  String toJson() {
    return AlazarChannelMapper.ensureInitialized()
        .encodeJson<AlazarChannel>(this as AlazarChannel);
  }

  Map<String, dynamic> toMap() {
    return AlazarChannelMapper.ensureInitialized()
        .encodeMap<AlazarChannel>(this as AlazarChannel);
  }

  AlazarChannelCopyWith<AlazarChannel, AlazarChannel, AlazarChannel>
      get copyWith => _AlazarChannelCopyWithImpl(
          this as AlazarChannel, $identity, $identity);
  @override
  String toString() {
    return AlazarChannelMapper.ensureInitialized()
        .stringifyValue(this as AlazarChannel);
  }

  @override
  bool operator ==(Object other) {
    return AlazarChannelMapper.ensureInitialized()
        .equalsValue(this as AlazarChannel, other);
  }

  @override
  int get hashCode {
    return AlazarChannelMapper.ensureInitialized()
        .hashValue(this as AlazarChannel);
  }
}

extension AlazarChannelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AlazarChannel, $Out> {
  AlazarChannelCopyWith<$R, AlazarChannel, $Out> get $asAlazarChannel =>
      $base.as((v, t, t2) => _AlazarChannelCopyWithImpl(v, t, t2));
}

abstract class AlazarChannelCopyWith<$R, $In extends AlazarChannel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {bool? enabled,
      ChannelCoupling? coupling,
      ChannelTermination? termination,
      ChannelRange? range,
      int? channelNum,
      int? boardNum});
  AlazarChannelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AlazarChannelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AlazarChannel, $Out>
    implements AlazarChannelCopyWith<$R, AlazarChannel, $Out> {
  _AlazarChannelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AlazarChannel> $mapper =
      AlazarChannelMapper.ensureInitialized();
  @override
  $R call(
          {bool? enabled,
          ChannelCoupling? coupling,
          ChannelTermination? termination,
          ChannelRange? range,
          int? channelNum,
          int? boardNum}) =>
      $apply(FieldCopyWithData({
        if (enabled != null) #enabled: enabled,
        if (coupling != null) #coupling: coupling,
        if (termination != null) #termination: termination,
        if (range != null) #range: range,
        if (channelNum != null) #channelNum: channelNum,
        if (boardNum != null) #boardNum: boardNum
      }));
  @override
  AlazarChannel $make(CopyWithData data) => AlazarChannel(
      enabled: data.get(#enabled, or: $value.enabled),
      coupling: data.get(#coupling, or: $value.coupling),
      termination: data.get(#termination, or: $value.termination),
      range: data.get(#range, or: $value.range),
      channelNum: data.get(#channelNum, or: $value.channelNum),
      boardNum: data.get(#boardNum, or: $value.boardNum));

  @override
  AlazarChannelCopyWith<$R2, AlazarChannel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AlazarChannelCopyWithImpl($value, $cast, t);
}

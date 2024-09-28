// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'alazar_board.dart';

class AlazarBoardMapper extends ClassMapperBase<AlazarBoard> {
  AlazarBoardMapper._();

  static AlazarBoardMapper? _instance;
  static AlazarBoardMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AlazarBoardMapper._());
      BoardTypeMapper.ensureInitialized();
      AlazarChannelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AlazarBoard';

  static BoardType _$boardType(AlazarBoard v) => v.boardType;
  static const Field<AlazarBoard, BoardType> _f$boardType =
      Field('boardType', _$boardType);
  static List<AlazarChannel> _$channels(AlazarBoard v) => v.channels;
  static const Field<AlazarBoard, List<AlazarChannel>> _f$channels =
      Field('channels', _$channels, opt: true, def: const []);

  @override
  final MappableFields<AlazarBoard> fields = const {
    #boardType: _f$boardType,
    #channels: _f$channels,
  };

  static AlazarBoard _instantiate(DecodingData data) {
    return AlazarBoard(
        boardType: data.dec(_f$boardType), channels: data.dec(_f$channels));
  }

  @override
  final Function instantiate = _instantiate;

  static AlazarBoard fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AlazarBoard>(map);
  }

  static AlazarBoard fromJson(String json) {
    return ensureInitialized().decodeJson<AlazarBoard>(json);
  }
}

mixin AlazarBoardMappable {
  String toJson() {
    return AlazarBoardMapper.ensureInitialized()
        .encodeJson<AlazarBoard>(this as AlazarBoard);
  }

  Map<String, dynamic> toMap() {
    return AlazarBoardMapper.ensureInitialized()
        .encodeMap<AlazarBoard>(this as AlazarBoard);
  }

  AlazarBoardCopyWith<AlazarBoard, AlazarBoard, AlazarBoard> get copyWith =>
      _AlazarBoardCopyWithImpl(this as AlazarBoard, $identity, $identity);
  @override
  String toString() {
    return AlazarBoardMapper.ensureInitialized()
        .stringifyValue(this as AlazarBoard);
  }

  @override
  bool operator ==(Object other) {
    return AlazarBoardMapper.ensureInitialized()
        .equalsValue(this as AlazarBoard, other);
  }

  @override
  int get hashCode {
    return AlazarBoardMapper.ensureInitialized().hashValue(this as AlazarBoard);
  }
}

extension AlazarBoardValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AlazarBoard, $Out> {
  AlazarBoardCopyWith<$R, AlazarBoard, $Out> get $asAlazarBoard =>
      $base.as((v, t, t2) => _AlazarBoardCopyWithImpl(v, t, t2));
}

abstract class AlazarBoardCopyWith<$R, $In extends AlazarBoard, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, AlazarChannel,
      AlazarChannelCopyWith<$R, AlazarChannel, AlazarChannel>> get channels;
  $R call({BoardType? boardType, List<AlazarChannel>? channels});
  AlazarBoardCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AlazarBoardCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AlazarBoard, $Out>
    implements AlazarBoardCopyWith<$R, AlazarBoard, $Out> {
  _AlazarBoardCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AlazarBoard> $mapper =
      AlazarBoardMapper.ensureInitialized();
  @override
  ListCopyWith<$R, AlazarChannel,
          AlazarChannelCopyWith<$R, AlazarChannel, AlazarChannel>>
      get channels => ListCopyWith($value.channels,
          (v, t) => v.copyWith.$chain(t), (v) => call(channels: v));
  @override
  $R call({BoardType? boardType, List<AlazarChannel>? channels}) =>
      $apply(FieldCopyWithData({
        if (boardType != null) #boardType: boardType,
        if (channels != null) #channels: channels
      }));
  @override
  AlazarBoard $make(CopyWithData data) => AlazarBoard(
      boardType: data.get(#boardType, or: $value.boardType),
      channels: data.get(#channels, or: $value.channels));

  @override
  AlazarBoardCopyWith<$R2, AlazarBoard, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AlazarBoardCopyWithImpl($value, $cast, t);
}

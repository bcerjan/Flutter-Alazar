// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'control_box.dart';

class ControlBoxTypeMapper extends EnumMapper<ControlBoxType> {
  ControlBoxTypeMapper._();

  static ControlBoxTypeMapper? _instance;
  static ControlBoxTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ControlBoxTypeMapper._());
    }
    return _instance!;
  }

  static ControlBoxType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ControlBoxType decode(dynamic value) {
    switch (value) {
      case 'v1':
        return ControlBoxType.v1;
      case 'v2':
        return ControlBoxType.v2;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ControlBoxType self) {
    switch (self) {
      case ControlBoxType.v1:
        return 'v1';
      case ControlBoxType.v2:
        return 'v2';
    }
  }
}

extension ControlBoxTypeMapperExtension on ControlBoxType {
  String toValue() {
    ControlBoxTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ControlBoxType>(this) as String;
  }
}

class ControlBoxMapper extends ClassMapperBase<ControlBox> {
  ControlBoxMapper._();

  static ControlBoxMapper? _instance;
  static ControlBoxMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ControlBoxMapper._());
      ControlBoxTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ControlBox';

  static ControlBoxType _$type(ControlBox v) => v.type;
  static const Field<ControlBox, ControlBoxType> _f$type =
      Field('type', _$type, opt: true, def: ControlBoxType.v2);
  static String _$comPort(ControlBox v) => v.comPort;
  static const Field<ControlBox, String> _f$comPort =
      Field('comPort', _$comPort);
  static int _$enableMode(ControlBox v) => v.enableMode;
  static const Field<ControlBox, int> _f$enableMode =
      Field('enableMode', _$enableMode, opt: true, def: 1);
  static int _$enablePolarity(ControlBox v) => v.enablePolarity;
  static const Field<ControlBox, int> _f$enablePolarity =
      Field('enablePolarity', _$enablePolarity, opt: true, def: 1);
  static int _$fastDacMode(ControlBox v) => v.fastDacMode;
  static const Field<ControlBox, int> _f$fastDacMode =
      Field('fastDacMode', _$fastDacMode, opt: true, def: 0);
  static int _$slowDacMode(ControlBox v) => v.slowDacMode;
  static const Field<ControlBox, int> _f$slowDacMode =
      Field('slowDacMode', _$slowDacMode, opt: true, def: 0);
  static int _$fastDacPhase(ControlBox v) => v.fastDacPhase;
  static const Field<ControlBox, int> _f$fastDacPhase =
      Field('fastDacPhase', _$fastDacPhase, opt: true, def: 0);
  static int _$fastDacScans(ControlBox v) => v.fastDacScans;
  static const Field<ControlBox, int> _f$fastDacScans =
      Field('fastDacScans', _$fastDacScans, opt: true, def: 1);

  @override
  final MappableFields<ControlBox> fields = const {
    #type: _f$type,
    #comPort: _f$comPort,
    #enableMode: _f$enableMode,
    #enablePolarity: _f$enablePolarity,
    #fastDacMode: _f$fastDacMode,
    #slowDacMode: _f$slowDacMode,
    #fastDacPhase: _f$fastDacPhase,
    #fastDacScans: _f$fastDacScans,
  };

  static ControlBox _instantiate(DecodingData data) {
    return ControlBox(
        type: data.dec(_f$type),
        comPort: data.dec(_f$comPort),
        enableMode: data.dec(_f$enableMode),
        enablePolarity: data.dec(_f$enablePolarity),
        fastDacMode: data.dec(_f$fastDacMode),
        slowDacMode: data.dec(_f$slowDacMode),
        fastDacPhase: data.dec(_f$fastDacPhase),
        fastDacScans: data.dec(_f$fastDacScans));
  }

  @override
  final Function instantiate = _instantiate;

  static ControlBox fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ControlBox>(map);
  }

  static ControlBox fromJson(String json) {
    return ensureInitialized().decodeJson<ControlBox>(json);
  }
}

mixin ControlBoxMappable {
  String toJson() {
    return ControlBoxMapper.ensureInitialized()
        .encodeJson<ControlBox>(this as ControlBox);
  }

  Map<String, dynamic> toMap() {
    return ControlBoxMapper.ensureInitialized()
        .encodeMap<ControlBox>(this as ControlBox);
  }

  ControlBoxCopyWith<ControlBox, ControlBox, ControlBox> get copyWith =>
      _ControlBoxCopyWithImpl(this as ControlBox, $identity, $identity);
  @override
  String toString() {
    return ControlBoxMapper.ensureInitialized()
        .stringifyValue(this as ControlBox);
  }

  @override
  bool operator ==(Object other) {
    return ControlBoxMapper.ensureInitialized()
        .equalsValue(this as ControlBox, other);
  }

  @override
  int get hashCode {
    return ControlBoxMapper.ensureInitialized().hashValue(this as ControlBox);
  }
}

extension ControlBoxValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ControlBox, $Out> {
  ControlBoxCopyWith<$R, ControlBox, $Out> get $asControlBox =>
      $base.as((v, t, t2) => _ControlBoxCopyWithImpl(v, t, t2));
}

abstract class ControlBoxCopyWith<$R, $In extends ControlBox, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {ControlBoxType? type,
      String? comPort,
      int? enableMode,
      int? enablePolarity,
      int? fastDacMode,
      int? slowDacMode,
      int? fastDacPhase,
      int? fastDacScans});
  ControlBoxCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ControlBoxCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ControlBox, $Out>
    implements ControlBoxCopyWith<$R, ControlBox, $Out> {
  _ControlBoxCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ControlBox> $mapper =
      ControlBoxMapper.ensureInitialized();
  @override
  $R call(
          {ControlBoxType? type,
          String? comPort,
          int? enableMode,
          int? enablePolarity,
          int? fastDacMode,
          int? slowDacMode,
          int? fastDacPhase,
          int? fastDacScans}) =>
      $apply(FieldCopyWithData({
        if (type != null) #type: type,
        if (comPort != null) #comPort: comPort,
        if (enableMode != null) #enableMode: enableMode,
        if (enablePolarity != null) #enablePolarity: enablePolarity,
        if (fastDacMode != null) #fastDacMode: fastDacMode,
        if (slowDacMode != null) #slowDacMode: slowDacMode,
        if (fastDacPhase != null) #fastDacPhase: fastDacPhase,
        if (fastDacScans != null) #fastDacScans: fastDacScans
      }));
  @override
  ControlBox $make(CopyWithData data) => ControlBox(
      type: data.get(#type, or: $value.type),
      comPort: data.get(#comPort, or: $value.comPort),
      enableMode: data.get(#enableMode, or: $value.enableMode),
      enablePolarity: data.get(#enablePolarity, or: $value.enablePolarity),
      fastDacMode: data.get(#fastDacMode, or: $value.fastDacMode),
      slowDacMode: data.get(#slowDacMode, or: $value.slowDacMode),
      fastDacPhase: data.get(#fastDacPhase, or: $value.fastDacPhase),
      fastDacScans: data.get(#fastDacScans, or: $value.fastDacScans));

  @override
  ControlBoxCopyWith<$R2, ControlBox, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ControlBoxCopyWithImpl($value, $cast, t);
}

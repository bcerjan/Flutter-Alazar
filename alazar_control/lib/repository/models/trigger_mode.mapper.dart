// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'trigger_mode.dart';

class TriggerModeMapper extends EnumMapper<TriggerMode> {
  TriggerModeMapper._();

  static TriggerModeMapper? _instance;
  static TriggerModeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TriggerModeMapper._());
    }
    return _instance!;
  }

  static TriggerMode fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TriggerMode decode(dynamic value) {
    switch (value) {
      case 'ext':
        return TriggerMode.ext;
      case 'pll':
        return TriggerMode.pll;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TriggerMode self) {
    switch (self) {
      case TriggerMode.ext:
        return 'ext';
      case TriggerMode.pll:
        return 'pll';
    }
  }
}

extension TriggerModeMapperExtension on TriggerMode {
  String toValue() {
    TriggerModeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TriggerMode>(this) as String;
  }
}

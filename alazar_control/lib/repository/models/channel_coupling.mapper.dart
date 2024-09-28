// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'channel_coupling.dart';

class ChannelCouplingMapper extends EnumMapper<ChannelCoupling> {
  ChannelCouplingMapper._();

  static ChannelCouplingMapper? _instance;
  static ChannelCouplingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChannelCouplingMapper._());
    }
    return _instance!;
  }

  static ChannelCoupling fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ChannelCoupling decode(dynamic value) {
    switch (value) {
      case 'ac':
        return ChannelCoupling.ac;
      case 'dc':
        return ChannelCoupling.dc;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ChannelCoupling self) {
    switch (self) {
      case ChannelCoupling.ac:
        return 'ac';
      case ChannelCoupling.dc:
        return 'dc';
    }
  }
}

extension ChannelCouplingMapperExtension on ChannelCoupling {
  String toValue() {
    ChannelCouplingMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ChannelCoupling>(this) as String;
  }
}

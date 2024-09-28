// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'channel_termination.dart';

class ChannelTerminationMapper extends EnumMapper<ChannelTermination> {
  ChannelTerminationMapper._();

  static ChannelTerminationMapper? _instance;
  static ChannelTerminationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChannelTerminationMapper._());
    }
    return _instance!;
  }

  static ChannelTermination fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ChannelTermination decode(dynamic value) {
    switch (value) {
      case 'ohm50':
        return ChannelTermination.ohm50;
      case 'ohm1M':
        return ChannelTermination.ohm1M;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ChannelTermination self) {
    switch (self) {
      case ChannelTermination.ohm50:
        return 'ohm50';
      case ChannelTermination.ohm1M:
        return 'ohm1M';
    }
  }
}

extension ChannelTerminationMapperExtension on ChannelTermination {
  String toValue() {
    ChannelTerminationMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ChannelTermination>(this) as String;
  }
}

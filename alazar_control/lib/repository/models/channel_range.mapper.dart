// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'channel_range.dart';

class ChannelRangeMapper extends EnumMapper<ChannelRange> {
  ChannelRangeMapper._();

  static ChannelRangeMapper? _instance;
  static ChannelRangeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChannelRangeMapper._());
    }
    return _instance!;
  }

  static ChannelRange fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ChannelRange decode(dynamic value) {
    switch (value) {
      case 'mv20':
        return ChannelRange.mv20;
      case 'mv200':
        return ChannelRange.mv200;
      case 'mv400':
        return ChannelRange.mv400;
      case 'mv500':
        return ChannelRange.mv500;
      case 'v1':
        return ChannelRange.v1;
      case 'v2':
        return ChannelRange.v2;
      case 'v5':
        return ChannelRange.v5;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ChannelRange self) {
    switch (self) {
      case ChannelRange.mv20:
        return 'mv20';
      case ChannelRange.mv200:
        return 'mv200';
      case ChannelRange.mv400:
        return 'mv400';
      case ChannelRange.mv500:
        return 'mv500';
      case ChannelRange.v1:
        return 'v1';
      case ChannelRange.v2:
        return 'v2';
      case ChannelRange.v5:
        return 'v5';
    }
  }
}

extension ChannelRangeMapperExtension on ChannelRange {
  String toValue() {
    ChannelRangeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ChannelRange>(this) as String;
  }
}

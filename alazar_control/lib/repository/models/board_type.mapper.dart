// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'board_type.dart';

class BoardTypeMapper extends EnumMapper<BoardType> {
  BoardTypeMapper._();

  static BoardTypeMapper? _instance;
  static BoardTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BoardTypeMapper._());
    }
    return _instance!;
  }

  static BoardType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  BoardType decode(dynamic value) {
    switch (value) {
      case 'c9440':
        return BoardType.c9440;
      case 'c9462':
        return BoardType.c9462;
      case 'c9350':
        return BoardType.c9350;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(BoardType self) {
    switch (self) {
      case BoardType.c9440:
        return 'c9440';
      case BoardType.c9462:
        return 'c9462';
      case BoardType.c9350:
        return 'c9350';
    }
  }
}

extension BoardTypeMapperExtension on BoardType {
  String toValue() {
    BoardTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<BoardType>(this) as String;
  }
}

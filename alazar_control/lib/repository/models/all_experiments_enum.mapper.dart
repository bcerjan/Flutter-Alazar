// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'all_experiments_enum.dart';

class AllExperimentsEnumMapper extends EnumMapper<AllExperimentsEnum> {
  AllExperimentsEnumMapper._();

  static AllExperimentsEnumMapper? _instance;
  static AllExperimentsEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AllExperimentsEnumMapper._());
    }
    return _instance!;
  }

  static AllExperimentsEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AllExperimentsEnum decode(dynamic value) {
    switch (value) {
      case 'galvoGalvoImage':
        return AllExperimentsEnum.galvoGalvoImage;
      case 'galvoResImage':
        return AllExperimentsEnum.galvoResImage;
      case 'galvoGalvoMirage':
        return AllExperimentsEnum.galvoGalvoMirage;
      case 'galvoGalvoAutocorrelation':
        return AllExperimentsEnum.galvoGalvoAutocorrelation;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AllExperimentsEnum self) {
    switch (self) {
      case AllExperimentsEnum.galvoGalvoImage:
        return 'galvoGalvoImage';
      case AllExperimentsEnum.galvoResImage:
        return 'galvoResImage';
      case AllExperimentsEnum.galvoGalvoMirage:
        return 'galvoGalvoMirage';
      case AllExperimentsEnum.galvoGalvoAutocorrelation:
        return 'galvoGalvoAutocorrelation';
    }
  }
}

extension AllExperimentsEnumMapperExtension on AllExperimentsEnum {
  String toValue() {
    AllExperimentsEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AllExperimentsEnum>(this) as String;
  }
}

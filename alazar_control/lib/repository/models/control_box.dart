import 'package:dart_mappable/dart_mappable.dart';

part 'control_box.mapper.dart';

@MappableEnum()
enum ControlBoxType { v1, v2 }

@MappableClass()
class ControlBox with ControlBoxMappable {
  const ControlBox({
    this.type = ControlBoxType.v2,
    required this.comPort,
    this.enableMode = 1,
    this.enablePolarity = 1,
    this.fastDacMode = 0,
    this.slowDacMode = 0,
    this.fastDacPhase = 0,
    this.fastDacScans = 1,
  });

  const ControlBox.getDefault()
      : type = ControlBoxType.v2,
        comPort = '',
        enableMode = 1,
        enablePolarity = 1,
        fastDacMode = 0,
        slowDacMode = 0,
        fastDacPhase = 0,
        fastDacScans = 1;

  final ControlBoxType type;
  final String comPort;
  final int enableMode;
  final int enablePolarity;
  final int fastDacMode;
  final int slowDacMode;
  final int fastDacPhase;
  final int fastDacScans;
}

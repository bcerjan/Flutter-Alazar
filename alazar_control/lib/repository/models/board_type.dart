import 'package:alazar_control/repository/models/exceptions.dart';
import 'package:alazar_control/src/rust/api/simple.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'board_type.mapper.dart';

@MappableEnum()
enum BoardType {
  c9440,
  c9462,
  c9350;

  int getSampleRate(double targetSampleRate) {
    switch (this) {
      case BoardType.c9440:
        if (targetSampleRate == 50000000) {
          return targetSampleRate.toInt();
        } else {
          throw const SampleRateException(
              '9440 Board is only prepared for sample rates of 50 MHz, add other frequencies in board_type.dart if needed');
        }
      case BoardType.c9350:
        return targetSampleRate.toInt();

      case BoardType.c9462:
        throw const InvalidBoardValue(
            'Not configured for 9462 board type yet.');
    }
  }

  int getDecimationFactor() {
    switch (this) {
      case BoardType.c9440:
        return 1;
      case BoardType.c9350:
        return 0;
      case BoardType.c9462:
        throw const InvalidBoardValue(
            'Not configured for 9462 board type yet.');
      // return -1; // NOT YET CONFIGURED
    }
  }

  static fromRustCardType(RustCardType rtype) {
    switch (rtype) {
      case RustCardType.c9350:
        return BoardType.c9350;
      case RustCardType.c9440:
        return BoardType.c9440;
      case RustCardType.c9462:
        return BoardType.c9462;
    }
  }
}

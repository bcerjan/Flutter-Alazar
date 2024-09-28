import 'package:alazar_control/repository/models/alazar_channel.dart';
import 'package:alazar_control/repository/models/board_type.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'alazar_board.mapper.dart';

@MappableClass()
class AlazarBoard with AlazarBoardMappable {
  const AlazarBoard({
    required this.boardType,
    this.channels = const [],
  });
  final BoardType boardType;
  final List<AlazarChannel> channels;

  int countEnabledChannels() {
    int i = 0;
    for (final chan in channels) {
      chan.enabled ? i++ : null;
    }
    return i;
  }
}

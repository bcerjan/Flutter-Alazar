import 'package:alazar_control/repository/models/channel_coupling.dart';
import 'package:alazar_control/repository/models/channel_range.dart';
import 'package:alazar_control/repository/models/channel_termination.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'alazar_channel.mapper.dart';

@MappableClass()
class AlazarChannel with AlazarChannelMappable {
  const AlazarChannel({
    this.enabled = false,
    this.coupling = ChannelCoupling.dc,
    this.termination = ChannelTermination.ohm50,
    this.range = ChannelRange.mv400,
    required this.channelNum,
    required this.boardNum,
  });
  final bool enabled;
  final ChannelCoupling coupling;
  final ChannelTermination termination;
  final ChannelRange range;
  final int channelNum;
  final int boardNum;
}

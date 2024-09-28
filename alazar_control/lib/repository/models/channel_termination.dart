import 'package:dart_mappable/dart_mappable.dart';

part 'channel_termination.mapper.dart';

@MappableEnum()
enum ChannelTermination {
  ohm50('50 Ohm'),
  ohm1M('1 MOhm');

  const ChannelTermination(this.label);
  final String label;
}

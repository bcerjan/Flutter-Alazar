import 'package:dart_mappable/dart_mappable.dart';

part 'channel_range.mapper.dart';

@MappableEnum()
enum ChannelRange {
  mv20('20 mV'),
  mv200('200 mV'),
  mv400('400 mV'),
  mv500('500 mV'),
  v1('1 V'),
  v2('2 V'),
  v5('5 V');

  const ChannelRange(this.label);
  final String label;
}

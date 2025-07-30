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

  int toRust() {
    switch (this) {
      case ChannelRange.mv20:
        return 1;
      case ChannelRange.mv200:
        return 6;
      case ChannelRange.mv400:
        return 7;
      case ChannelRange.mv500:
        return 8;
      case ChannelRange.v1:
        return 10;
      case ChannelRange.v2:
        return 11;
      case ChannelRange.v5:
        return 13;
    }
  }
}

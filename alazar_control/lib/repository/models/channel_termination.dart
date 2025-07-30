import 'package:dart_mappable/dart_mappable.dart';

part 'channel_termination.mapper.dart';

@MappableEnum()
enum ChannelTermination {
  ohm50('50 Ohm'),
  ohm1M('1 MOhm');

  const ChannelTermination(this.label);
  final String label;

  int toRust() {
    switch (this) {
      case ChannelTermination.ohm50:
        return 2;
      case ChannelTermination.ohm1M:
        return 1;
    }
  }
}

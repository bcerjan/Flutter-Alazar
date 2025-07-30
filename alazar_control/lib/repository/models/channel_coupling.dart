import 'package:dart_mappable/dart_mappable.dart';

part 'channel_coupling.mapper.dart';

@MappableEnum()
enum ChannelCoupling {
  ac('AC'),
  dc('DC');

  const ChannelCoupling(this.label);
  final String label;

  int toRust() {
    switch (this) {
      case ac:
        return 1;
      case dc:
        return 2;
    }
  }
}

import 'package:alazar_control/repository/models/alazar_board.dart';
import 'package:alazar_control/repository/models/alazar_channel.dart';
import 'package:alazar_control/repository/models/alazar_response.dart';
import 'package:alazar_control/repository/models/board_type.dart';
import 'package:alazar_control/src/rust/api/simple.dart';

class ExperimentService {
  Stream<AlazarResponse> getAlazarStream() =>
      // createAlazarStream().map((RustAlazarResponse rustResp) => AlazarResponse(
      //       msg: rustResp.msg,
      //       running: rustResp.running,
      //       imageData: rustResp.imageData,
      //     ));
      const Stream.empty();

  // Future<List<AlazarBoard>> detectBoards() async => [
  //       const AlazarBoard(
  //         boardType: BoardType.c9440,
  //         channels: [
  //           AlazarChannel(channelNum: 1, boardNum: 1),
  //           AlazarChannel(channelNum: 2, boardNum: 1),
  //         ],
  //       ),
  //       const AlazarBoard(boardType: BoardType.c9440, channels: [
  //         AlazarChannel(channelNum: 1, boardNum: 2),
  //         AlazarChannel(channelNum: 2, boardNum: 2),
  //         AlazarChannel(channelNum: 3, boardNum: 2),
  //         AlazarChannel(channelNum: 4, boardNum: 2),
  //       ]),
  //     ];
  Future<List<AlazarBoard>> detectBoards() async {
    final rustBoards = await detectBoardsRust();
    final List<AlazarBoard> ret = [];
    int i = 1;
    for (final rb in rustBoards) {
      final List<AlazarChannel> channels = rb.channels
          .map((rc) => AlazarChannel(channelNum: rc.index, boardNum: i))
          .toList();
      final type = BoardType.fromRustCardType(rb.cardType);
      ret.add(AlazarBoard(boardType: type, channels: channels));
      i++;
    }

    return ret;
  }
}

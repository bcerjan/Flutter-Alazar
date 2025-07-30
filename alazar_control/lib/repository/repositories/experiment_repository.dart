import 'package:alazar_control/repository/models/alazar_board.dart';
import 'package:alazar_control/repository/models/alazar_response.dart';
import 'package:alazar_control/repository/models/control_box.dart';
import 'package:alazar_control/repository/models/experiment.dart';
import 'package:alazar_control/repository/repositories/services/experiment_service.dart';

class ExperimentRepository {
  const ExperimentRepository({required this.service});
  final ExperimentService service;

  Future<List<AlazarBoard>> detectBoards() async => service.detectBoards();
  Stream<AlazarResponse> getAlazarStream() => service.getAlazarStream();
  Stream<AlazarResponse> startAcquisition(
          Experiment experiment, ControlBox box) =>
      service.startAcquisitionDart(experiment: experiment, controlBox: box);
  void stopAcquisition() {}
  void testPanic() async => service.testPanic();
}

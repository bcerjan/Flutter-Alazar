part of 'experiment_bloc.dart';

sealed class ExperimentEvent {
  const ExperimentEvent();
}

class ExperimentUpdateEvent extends ExperimentEvent {
  const ExperimentUpdateEvent({required this.experiment});

  final Experiment experiment;
}

class ExperimentStartStopEvent extends ExperimentEvent {
  const ExperimentStartStopEvent({this.live = false});
  final bool live;
}

class ExperimentDetectBoards extends ExperimentEvent {}

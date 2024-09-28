import 'package:alazar_control/ui/experiment/bloc/experiment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartStopButton extends StatelessWidget {
  const StartStopButton({super.key, this.size = 200, this.live = false});
  final double size;
  final bool live;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExperimentBloc, ExperimentState>(
        builder: (context, state) {
      final String text =
          state.status == ExperimentStatus.running ? 'Stop' : 'Start';
      final bool isReady = state.experiment.isValid();
      return SizedBox(
        width: size,
        height: size,
        child: TextButton(
          onPressed: isReady
              ? () => context
                  .read<ExperimentBloc>()
                  .add(ExperimentStartStopEvent(live: live))
              : null,
          child: Text(text),
        ),
      );
    });
  }
}

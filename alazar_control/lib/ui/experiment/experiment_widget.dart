import 'package:alazar_control/repository/models/experiment.dart';
import 'package:alazar_control/ui/experiment/bloc/experiment_bloc.dart';
import 'package:alazar_control/ui/experiment/experiment_galvo_res_ui.dart';
import 'package:alazar_control/ui/experiment/experiment_galvo_galvo_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExperimentWidget extends StatelessWidget {
  const ExperimentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExperimentBloc, ExperimentState>(
        builder: (context, state) {
      if (state.status == ExperimentStatus.error) {
        // showDialog(
        //     context: context,
        //     builder: (context) => AlertDialog(
        //           title: const Text('Error'),
        //           content: Text('Error message: ${state.errorText ?? ''}'),
        //           actions: [
        //             TextButton(
        //                 onPressed: () => Navigator.pop(context),
        //                 child: const Text('Got it'))
        //           ],
        //         ));
      }
      switch (state.experiment) {
        case ExperimentGalvoRes():
          return const ExperimentGalvoResUi();
        case ExperimentGalvoGalvo():
          return const ExperimentGalvoGalvoUi();
      }
    });
  }
}

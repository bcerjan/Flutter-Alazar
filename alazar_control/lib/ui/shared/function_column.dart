import 'package:alazar_control/repository/models/experiment.dart';
import 'package:alazar_control/ui/experiment/bloc/experiment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FunctionColumn extends StatelessWidget {
  const FunctionColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExperimentBloc, ExperimentState>(
        builder: (context, state) {
      final Experiment experiment = state.experiment;
      return Column(
        children: [
          TextFormField(
            key: Key('Live ${experiment.runtimeType.toString()}'),
            decoration:
                const InputDecoration(helper: Text('Live Processing Function')),
            initialValue: experiment.liveFn,
            onChanged: (value) => context.read<ExperimentBloc>().add(
                ExperimentUpdateEvent(
                    experiment: state.experiment.copyWith(liveFn: value))),
          ),
          TextFormField(
            key: Key('End ${experiment.runtimeType.toString()}'),
            decoration:
                const InputDecoration(helper: Text('Post-Processing Function')),
            initialValue: experiment.endFn,
            onChanged: (value) => context.read<ExperimentBloc>().add(
                ExperimentUpdateEvent(
                    experiment: state.experiment.copyWith(endFn: value))),
          ),
          TextFormField(
            key: Key('Acquisitions ${experiment.runtimeType.toString()}'),
            decoration:
                const InputDecoration(helper: Text('Number of Acquisitions')),
            initialValue: experiment.numberOfAcquisitions.toString(),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (value) {
              final val = int.tryParse(value ?? '');
              if (val == null) {
                return 'Required';
              }

              if (val <= 0) {
                return 'Must be at least 1';
              }
              return null;
            },
            onChanged: (value) => context.read<ExperimentBloc>().add(
                ExperimentUpdateEvent(
                    experiment: state.experiment
                        .copyWith(numberOfAcquisitions: int.tryParse(value)))),
          ),
          TextFormField(
            key: Key('PreAcq ${experiment.runtimeType.toString()}'),
            decoration:
                const InputDecoration(helper: Text('Pre-Acquisition Function')),
            initialValue: experiment.preAcqFn,
            onChanged: (value) => context.read<ExperimentBloc>().add(
                ExperimentUpdateEvent(
                    experiment: state.experiment.copyWith(preAcqFn: value))),
          ),
          TextFormField(
            key: Key('PostAcq ${experiment.runtimeType.toString()}'),
            decoration: const InputDecoration(
                helper: Text('Post-Acquisition Function')),
            initialValue: experiment.postAcqFn,
            onChanged: (value) => context.read<ExperimentBloc>().add(
                ExperimentUpdateEvent(
                    experiment: state.experiment.copyWith(postAcqFn: value))),
          ),
        ],
      );
    });
  }
}

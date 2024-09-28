import 'package:alazar_control/ui/experiment/bloc/experiment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataAutosave extends StatelessWidget {
  const DataAutosave({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExperimentBloc, ExperimentState>(
        builder: (context, state) {
      return Row(children: [
        Tooltip(
            message: 'Autosave Data?',
            child: Checkbox(
                value: state.experiment.autosave,
                onChanged: (checked) => context.read<ExperimentBloc>().add(
                    ExperimentUpdateEvent(
                        experiment:
                            state.experiment.copyWith(autosave: checked))))),
        Expanded(
            child: TextFormField(
          key: Key('Folder ${state.experiment.runtimeType.toString()}'),
          decoration:
              const InputDecoration(helper: Text('Autosave Folder Path')),
          initialValue: state.experiment.folderPath,
          onChanged: (val) => context.read<ExperimentBloc>().add(
              ExperimentUpdateEvent(
                  experiment: state.experiment.copyWith(folderPath: val))),
        ))
      ]);
    });
  }
}

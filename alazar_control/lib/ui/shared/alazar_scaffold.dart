import 'package:alazar_control/repository/models/all_experiments_enum.dart';
import 'package:alazar_control/repository/models/experiment.dart';
import 'package:alazar_control/ui/experiment/bloc/experiment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlazarScaffold extends StatelessWidget {
  const AlazarScaffold({
    super.key,
    required this.tabs,
    required this.tabContents,
  });
  final List<Widget> tabs;
  final List<Widget> tabContents;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Alazar Control Panel'),
              bottom: TabBar(tabs: tabs),
              actions: const [ExperimentTypeSelectorWidget()],
            ),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: TabBarView(children: tabContents),
            )));
  }
}

class ExperimentTypeSelectorWidget extends StatelessWidget {
  const ExperimentTypeSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExperimentBloc, ExperimentState>(
        builder: (context, state) {
      final type = AllExperimentsEnum.fromModel(state.experiment);
      return DropdownMenu<AllExperimentsEnum>(
        enableSearch: false,
        initialSelection: type,
        dropdownMenuEntries: AllExperimentsEnum.values
            .map((type) => DropdownMenuEntry<AllExperimentsEnum>(
                value: type, label: type.label))
            .toList(),
        onSelected: (value) {
          final Experiment? newExp = switch (value) {
            null => null,
            AllExperimentsEnum.galvoGalvoImage =>
              const ExperimentGalvoGalvo.getDefault(),
            AllExperimentsEnum.galvoResImage =>
              const ExperimentGalvoRes.getDefault(),
            AllExperimentsEnum.galvoGalvoMirage => null,
            AllExperimentsEnum.galvoGalvoAutocorrelation => null,
          };
          if (newExp != null) {
            context
                .read<ExperimentBloc>()
                .add(ExperimentUpdateEvent(experiment: newExp));
          }
        },
      );
    });
  }
}

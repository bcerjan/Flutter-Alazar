import 'package:alazar_control/ui/experiment/bloc/experiment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlazarResponseWidget extends StatelessWidget {
  const AlazarResponseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExperimentBloc, ExperimentState>(
        builder: (context, state) {
      return StreamBuilder(
          stream: state.stream,
          builder: (context, snap) {
            switch (snap.connectionState) {
              case ConnectionState.none:
                return const Text('null stream');
              case ConnectionState.waiting:
                return const Text('Stream is waiting...');
              case ConnectionState.active:
              case ConnectionState.done:
                if (snap.hasData) {
                  return Text(snap.data!.msg);
                }
                return const Text('No data');
            }
          });
    });
  }
}

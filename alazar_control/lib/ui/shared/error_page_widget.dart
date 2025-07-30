import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alazar_control/ui/experiment/bloc/experiment_bloc.dart';
import 'package:flutter/material.dart';

class ErrorPageWidget extends StatelessWidget {
  const ErrorPageWidget({super.key, this.message = ''});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text('Error encountered: $message'),
        TextButton(
            onPressed: () =>
                context.read<ExperimentBloc>().add(ExperimentClearErrorEvent()),
            child: const Text('Got it!'))
      ]),
    );
  }
}

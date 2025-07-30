import 'package:alazar_control/repository/models/experiment.dart';
import 'package:alazar_control/ui/experiment/bloc/experiment_bloc.dart';
import 'package:alazar_control/ui/shared/alazar_response_widget.dart';
import 'package:alazar_control/ui/shared/data_autosave.dart';
import 'package:alazar_control/ui/shared/function_column.dart';
import 'package:alazar_control/ui/shared/start_stop_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagingTabWidget<T extends ExperimentImaging> extends StatelessWidget {
  const ImagingTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExperimentBloc, ExperimentState>(
        builder: (context, state) {
      final T experiment = state.experiment as T;
      return Form(
          child: Row(
        children: [
          Expanded(
              child: Column(children: [
            TextFormField(
              key: Key('RepRate ${experiment.runtimeType.toString()}'),
              readOnly: state.status == ExperimentStatus.running,
              decoration:
                  const InputDecoration(helper: Text('Laser Rep Rate (MHz)')),
              initialValue: experiment.laserRepRateMHz.toString(),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]*')),
              ],
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: true),
              onChanged: (value) => context.read<ExperimentBloc>().add(
                  ExperimentUpdateEvent(
                      experiment: state.experiment
                          .copyWith(laserRepRateMHz: double.tryParse(value)))),
              validator: (value) {
                final val = double.tryParse(value ?? '');
                if (val == null) {
                  return 'Required';
                }

                if (val <= 0) {
                  return 'Laser Rep Rate must be a positive number';
                }
                return null;
              },
            ),
            TextFormField(
              key: Key('Scan ${experiment.runtimeType.toString()}'),
              readOnly: state.status == ExperimentStatus.running,
              decoration:
                  const InputDecoration(helper: Text('Scan Period (us)')),
              initialValue: experiment.imagingSettings.scanPeriodUs.toString(),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]*')),
              ],
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: true),
              onChanged: (value) => context.read<ExperimentBloc>().add(
                  ExperimentUpdateEvent(
                      experiment: experiment.copyWith(
                          imagingSettings: experiment.imagingSettings.copyWith(
                              scanPeriodUs: double.tryParse(value))))),
              validator: (value) {
                final val = double.tryParse(value ?? '');
                if (val == null) {
                  return 'Required';
                }

                if (val <= 0) {
                  return 'Scan Period must be a positive number';
                }
                return null;
              },
            ),
            TextFormField(
              key: Key('Width ${experiment.runtimeType.toString()}'),
              readOnly: state.status == ExperimentStatus.running,
              decoration:
                  const InputDecoration(helper: Text('Image Width (Pixels)')),
              initialValue: experiment.imagingSettings.imageWidthPix.toString(),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: false),
              onChanged: (value) => context.read<ExperimentBloc>().add(
                  ExperimentUpdateEvent(
                      experiment: experiment.copyWith(
                          imagingSettings: experiment.imagingSettings
                              .copyWith(imageWidthPix: int.tryParse(value))))),
              validator: (value) {
                final val = int.tryParse(value ?? '');
                if (val == null) {
                  return 'Required';
                }

                if (val <= 0) {
                  return 'Image Width must be positive';
                }
                return null;
              },
            ),
            TextFormField(
              key: Key('Height ${experiment.runtimeType.toString()}'),
              readOnly: state.status == ExperimentStatus.running,
              decoration:
                  const InputDecoration(helper: Text('Image Height (Pixels)')),
              initialValue:
                  experiment.imagingSettings.imageHeightPix.toString(),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: false),
              onChanged: (value) => context.read<ExperimentBloc>().add(
                  ExperimentUpdateEvent(
                      experiment: experiment.copyWith(
                          imagingSettings: experiment.imagingSettings
                              .copyWith(imageHeightPix: int.tryParse(value))))),
              validator: (value) {
                final val = int.tryParse(value ?? '');
                if (val == null) {
                  return 'Required';
                }

                if (val <= 0) {
                  return 'Image Height must be positive';
                }
                return null;
              },
            ),
            TextFormField(
              key: Key('Frames ${experiment.runtimeType.toString()}'),
              readOnly: state.status == ExperimentStatus.running,
              decoration:
                  const InputDecoration(helper: Text('Number of Frames')),
              initialValue:
                  experiment.imagingSettings.numberOfFrames.toString(),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: false),
              onChanged: (value) => context.read<ExperimentBloc>().add(
                  ExperimentUpdateEvent(
                      experiment: experiment.copyWith(
                          imagingSettings: experiment.imagingSettings
                              .copyWith(numberOfFrames: int.tryParse(value))))),
              validator: (value) {
                final val = int.tryParse(value ?? '');
                if (val == null) {
                  return 'Required';
                }

                if (val <= 0) {
                  return 'Number of frames must be positive';
                }
                return null;
              },
            ),
            if (experiment.runtimeType == ExperimentGalvoRes)
              TextFormField(
                readOnly: state.status == ExperimentStatus.running,
                key: Key('ResPhase ${experiment.runtimeType.toString()}'),
                decoration:
                    const InputDecoration(helper: Text('Fast Mirror Phase')),
                initialValue:
                    experiment.imagingSettings.fastMirrorPhase.toString(),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]*')),
                ],
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                onChanged: (value) => context.read<ExperimentBloc>().add(
                    ExperimentUpdateEvent(
                        experiment: experiment.copyWith(
                            imagingSettings: experiment.imagingSettings
                                .copyWith(
                                    imageWidthPix: int.tryParse(value))))),
                validator: (value) {
                  final val = double.tryParse(value ?? '');
                  if (val == null) {
                    return 'Required';
                  }
                  return null;
                },
              ),
          ])),
          const SizedBox(
            width: 10,
          ),
          const Expanded(
              child: Column(
            children: [
              FunctionColumn(),
            ],
          )),
          const SizedBox(
            width: 10,
          ),
          const Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DataAutosave(),
              AlazarResponseWidget(),
              StartStopButton(),
            ],
          )),
        ],
      ));
    });
  }
}

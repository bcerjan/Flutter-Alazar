import 'package:alazar_control/repository/models/alazar_channel.dart';
import 'package:alazar_control/repository/models/experiment.dart';
import 'package:alazar_control/ui/experiment/bloc/experiment_bloc.dart';
import 'package:alazar_control/ui/shared/start_stop_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LiveViewTabWidget extends StatelessWidget {
  const LiveViewTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [LiveViewDisplayWidget()],
        ),
        SizedBox(
          width: 2,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                ChannelToViewWidget(),
                FramesToAverageWidget(),
              ],
            ),
            Flexible(
                flex: 1,
                child: StartStopButton(
                  size: 150,
                  live: true,
                )),
          ],
        )
      ],
    );
  }
}

class LiveViewDisplayWidget extends StatelessWidget {
  const LiveViewDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 450,
        width: 450,
        child: BlocBuilder<ExperimentBloc, ExperimentState>(
            builder: (context, state) {
          if (state.imageData != null && state.imageData!.isNotEmpty) {
            return Image.memory(Uint8List.fromList(state.imageData!));
          }

          return Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(border: Border.all()),
            child: const Center(child: Text('No image data yet')),
          );
        }));
  }
}

class ChannelSelectionWidget extends StatelessWidget {
  const ChannelSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class FramesToAverageWidget extends StatelessWidget {
  const FramesToAverageWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExperimentBloc, ExperimentState>(
        builder: (context, state) {
      final experiment = state.experiment as ExperimentImaging;
      return SizedBox(
          width: 150,
          child: TextFormField(
            readOnly: state.status == ExperimentStatus.running,
            decoration: const InputDecoration(helper: Text('Number of Frames')),
            initialValue: experiment.imagingSettings.liveFrames.toString(),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: const TextInputType.numberWithOptions(
                signed: false, decimal: false),
            onChanged: (value) => context.read<ExperimentBloc>().add(
                ExperimentUpdateEvent(
                    experiment: experiment.copyWith(
                        imagingSettings: experiment.imagingSettings
                            .copyWith(liveFrames: int.tryParse(value))))),
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
          ));
    });
  }
}

class ChannelToViewWidget extends StatelessWidget {
  const ChannelToViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExperimentBloc, ExperimentState>(
        builder: (context, state) {
      final experiment = state.experiment as ExperimentImaging;
      // print(experiment.imagingSettings.liveChannel);
      final List<DropdownMenuEntry<AlazarChannel>> entries = [];
      final channels = experiment.settings.getEnabledChannels();
      for (final key in channels.keys) {
        entries.add(DropdownMenuEntry(value: channels[key]!, label: key));
      }
      return DropdownMenu<AlazarChannel>(
        initialSelection: experiment.imagingSettings.liveChannel,
        dropdownMenuEntries: entries,
        width: 210,
        onSelected: (channel) => context.read<ExperimentBloc>().add(
              ExperimentUpdateEvent(
                  experiment: experiment.copyWith(
                      imagingSettings: experiment.imagingSettings
                          .copyWith(liveChannel: channel))),
            ),
      );
    });
  }
}

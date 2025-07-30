import 'package:alazar_control/repository/models/alazar_board.dart';
import 'package:alazar_control/repository/models/alazar_channel.dart';
import 'package:alazar_control/repository/models/channel_coupling.dart';
import 'package:alazar_control/repository/models/channel_range.dart';
import 'package:alazar_control/repository/models/channel_termination.dart';
import 'package:alazar_control/repository/models/experiment.dart';
import 'package:alazar_control/ui/experiment/bloc/experiment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChannelsTabWidget extends StatelessWidget {
  const ChannelsTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExperimentBloc, ExperimentState>(
        builder: (context, state) {
      void updateCb(AlazarBoard board, int index) {
        final List<AlazarBoard> boards =
            List.from(state.experiment.settings.boards);
        boards.removeAt(index);
        boards.insert(index, board);
        final Experiment experiment = state.experiment.copyWith(
            settings: state.experiment.settings.copyWith(boards: boards));

        context
            .read<ExperimentBloc>()
            .add(ExperimentUpdateEvent(experiment: experiment));
      }

      if (state.experiment.settings.boards.isEmpty) {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Error: No boards detected'),
            TextButton(
                onPressed: () => context
                    .read<ExperimentBloc>()
                    .add(ExperimentDetectBoardsEvent()),
                child: const Text('Try To Detect Boards'))
          ],
        ));
      }
      final boards = state.experiment.settings.boards;
      return ListView.separated(
          itemBuilder: (context, index) => BoardChannelWidget(
                board: boards[index],
                boardLabel: 'Board $index',
                cb: (board) => updateCb(board, index),
              ),
          separatorBuilder: (context, ind) => const Divider(),
          itemCount: boards.length);
    });
  }
}

class BoardChannelWidget extends StatelessWidget {
  const BoardChannelWidget(
      {super.key,
      required this.board,
      required this.boardLabel,
      required this.cb});
  final AlazarBoard board;
  final String boardLabel;
  final ValueChanged<AlazarBoard> cb;
  static const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  void updateCb(AlazarChannel channel, int index) {
    final List<AlazarChannel> channels = List.from(board.channels);
    channels.removeAt(index);
    channels.insert(index, channel);
    cb(board.copyWith(channels: channels));
  }

  @override
  Widget build(BuildContext context) {
    final channels = board.channels;
    return Column(
      children: [
        Text(
          boardLabel,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: channels.length,
            itemBuilder: (context, index) => ChannelSettingsWidget(
                  channelLabel: 'Channel ${letters[index]}',
                  cb: (channel) => updateCb(channel, index),
                  channel: channels[index],
                )),
      ],
    );
  }
}

class ChannelSettingsWidget extends StatelessWidget {
  const ChannelSettingsWidget({
    super.key,
    required this.channel,
    required this.channelLabel,
    required this.cb,
  });
  final AlazarChannel channel;
  final String channelLabel;
  final ValueChanged<AlazarChannel> cb;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 70,
          child: Text(
            channelLabel,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
            height: 50,
            width: 150,
            child: CheckboxListTile(
              value: channel.enabled,
              title: const Text('Enabled'),
              onChanged: (val) => cb(channel.copyWith(enabled: val)),
              activeColor: Colors.purple,
            )),
        ChannelRangeWidget(
          range: channel.range,
          cb: (range) => cb(channel.copyWith(range: range)),
        ),
        const SizedBox(
          width: 5,
        ),
        ChannelTerminationWidget(
          termination: channel.termination,
          cb: (term) => cb(channel.copyWith(termination: term)),
        ),
        const SizedBox(
          width: 5,
        ),
        ChannelCouplingWidget(
          coupling: channel.coupling,
          cb: (coupling) => cb(channel.copyWith(coupling: coupling)),
        ),
      ],
    );
  }
}

class ChannelRangeWidget extends StatelessWidget {
  const ChannelRangeWidget({
    super.key,
    required this.range,
    required this.cb,
  });
  final ChannelRange range;
  final ValueChanged<ChannelRange> cb;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<ChannelRange>(
        initialSelection: range,
        onSelected: (value) => cb(value ?? range),
        dropdownMenuEntries: ChannelRange.values
            .map<DropdownMenuEntry<ChannelRange>>(
                (range) => DropdownMenuEntry<ChannelRange>(
                      value: range,
                      label: range.label,
                    ))
            .toList());
  }
}

class ChannelTerminationWidget extends StatelessWidget {
  const ChannelTerminationWidget({
    super.key,
    required this.termination,
    required this.cb,
  });
  final ChannelTermination termination;
  final ValueChanged<ChannelTermination> cb;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Text('50 Ohm'),
      Switch(
        activeColor: Colors.black,
        inactiveThumbColor: Colors.black,
        value: termination == ChannelTermination.ohm1M,
        onChanged: (value) =>
            cb(value ? ChannelTermination.ohm1M : ChannelTermination.ohm50),
      ),
      const Text('1 MOhm'),
    ]);
  }
}

class ChannelCouplingWidget extends StatelessWidget {
  const ChannelCouplingWidget({
    super.key,
    required this.coupling,
    required this.cb,
  });
  final ChannelCoupling coupling;
  final ValueChanged<ChannelCoupling> cb;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Text('DC'),
      Switch(
        activeColor: Colors.black,
        inactiveThumbColor: Colors.black,
        value: coupling == ChannelCoupling.ac,
        onChanged: (value) =>
            cb(value ? ChannelCoupling.ac : ChannelCoupling.dc),
      ),
      const Text('AC'),
    ]);
  }
}

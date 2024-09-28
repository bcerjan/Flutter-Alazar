import 'package:alazar_control/repository/models/experiment.dart';
import 'package:alazar_control/ui/shared/alazar_scaffold.dart';
import 'package:alazar_control/ui/shared/channels_tab_widget.dart';
import 'package:alazar_control/ui/shared/imaging_tab_widget.dart';
import 'package:alazar_control/ui/shared/live_view_tab_widget.dart';
import 'package:alazar_control/ui/shared/trigger_tab_widget.dart';
import 'package:flutter/material.dart';

class ExperimentGalvoGalvoUi extends StatelessWidget {
  const ExperimentGalvoGalvoUi({super.key});
  static const List<Widget> tabs = [
    Tab(
      text: 'Imaging',
    ),
    Tab(
      text: 'Channels',
    ),
    Tab(
      text: 'Trigger',
    ),
    Tab(
      text: 'Live Viewing',
    ),
  ];

  static const List<Widget> tabContents = [
    ImagingTabWidget<ExperimentGalvoGalvo>(),
    ChannelsTabWidget(),
    TriggerTabWidget(),
    LiveViewTabWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return const AlazarScaffold(tabs: tabs, tabContents: tabContents);
  }
}

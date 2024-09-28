import 'package:alazar_control/repository/repositories/experiment_repository.dart';
import 'package:alazar_control/repository/repositories/services/experiment_service.dart';
import 'package:alazar_control/ui/experiment/bloc/experiment_bloc.dart';
import 'package:alazar_control/ui/pages/experiment_page.dart';
import 'package:flutter/material.dart';
import 'package:alazar_control/src/rust/frb_generated.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  await RustLib.init();
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  const Size sz = Size(700, 700);
  WindowOptions windowOptions = const WindowOptions(
    size: sz,
    minimumSize: sz,
    maximumSize: sz,
    // center: true,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
    windowButtonVisibility: false,
  );

  await windowManager.ensureInitialized();
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const AlazarControlApp());
}

class AlazarControlApp extends StatelessWidget {
  const AlazarControlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ExperimentRepository(service: ExperimentService()),
      child: BlocProvider(
        create: (context) =>
            ExperimentBloc(repository: context.read<ExperimentRepository>())
              ..add(ExperimentDetectBoards()),
        child:
            const MaterialApp(title: 'Alazar Control', home: ExperimentPage()),
      ),
    );
  }
}

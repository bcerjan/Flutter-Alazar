import 'package:alazar_control/repository/models/alazar_settings.dart';
import 'package:alazar_control/repository/models/trigger_mode.dart';
import 'package:alazar_control/ui/experiment/bloc/experiment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TriggerTabWidget extends StatelessWidget {
  const TriggerTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExperimentBloc, ExperimentState>(
        builder: (context, state) {
      void updateCb(AlazarSettings settings) {
        context.read<ExperimentBloc>().add(ExperimentUpdateEvent(
            experiment: state.experiment.copyWith(settings: settings)));
      }

      return Row(
        children: [
          Column(
            children: [
              TriggerSourceWidget(
                trigger: state.experiment.settings.triggerMode,
                cb: (trigger) => updateCb(
                    state.experiment.settings.copyWith(triggerMode: trigger)),
              ),
              SizedBox(
                width: 200,
                child: TriggerLevelWidget(
                  triggerLevel: state.experiment.settings.triggerLevel,
                  cb: (level) => updateCb(
                      state.experiment.settings.copyWith(triggerLevel: level)),
                ),
              ),
              SizedBox(
                width: 200,
                child: TriggerDelayWidget(
                  triggerDelay: state.experiment.settings.triggerDelaySec,
                  cb: (delay) => updateCb(
                    state.experiment.settings.copyWith(triggerDelaySec: delay),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: TriggerTimeoutWidget(
                  triggerTimeout: state.experiment.settings.triggerTimeoutSec,
                  cb: (timeout) => updateCb(
                    state.experiment.settings
                        .copyWith(triggerTimeoutSec: timeout),
                  ),
                ),
              ),
            ],
          )
        ],
      );
    });
  }
}

class TriggerSourceWidget extends StatelessWidget {
  const TriggerSourceWidget({
    super.key,
    required this.trigger,
    required this.cb,
  });
  final TriggerMode trigger;
  final ValueChanged<TriggerMode> cb;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Text('PLL'),
      Switch(
        activeColor: Colors.black,
        inactiveThumbColor: Colors.black,
        value: trigger == TriggerMode.ext,
        onChanged: (value) => cb(value ? TriggerMode.ext : TriggerMode.pll),
      ),
      const Text('External'),
    ]);
  }
}

class TriggerLevelWidget extends StatelessWidget {
  const TriggerLevelWidget({
    super.key,
    required this.triggerLevel,
    required this.cb,
  });
  final int triggerLevel;
  final ValueChanged<int> cb;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(helper: Text('Trigger Level')),
      initialValue: triggerLevel.toString(),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      keyboardType:
          const TextInputType.numberWithOptions(signed: false, decimal: false),
      onChanged: (value) => cb(int.tryParse(value) ?? triggerLevel),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        final val = int.tryParse(value ?? '');
        if (val == null) {
          return 'Required';
        }

        if (val < 0 || val > 255) {
          return 'Trigger level goes from 0-255';
        }
        return null;
      },
    );
  }
}

class PreTriggerSamplesWidget extends StatelessWidget {
  const PreTriggerSamplesWidget({
    super.key,
    required this.preTriggerSamples,
    required this.cb,
  });
  final int preTriggerSamples;
  final ValueChanged<int> cb;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(helper: Text('Pre-Trigger Samples')),
      initialValue: preTriggerSamples.toString(),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      keyboardType:
          const TextInputType.numberWithOptions(signed: false, decimal: false),
      onChanged: (value) => cb(int.tryParse(value) ?? preTriggerSamples),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        final val = int.tryParse(value ?? '');
        if (val == null) {
          return 'Required';
        }
        return null;
      },
    );
  }
}

class TriggerDelayWidget extends StatelessWidget {
  const TriggerDelayWidget({
    super.key,
    required this.triggerDelay,
    required this.cb,
  });
  final double triggerDelay;
  final ValueChanged<double> cb;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(helper: Text('Trigger Delay (sec)')),
      initialValue: triggerDelay.toString(),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      keyboardType:
          const TextInputType.numberWithOptions(signed: false, decimal: false),
      onChanged: (value) => cb(double.tryParse(value) ?? triggerDelay),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        final val = double.tryParse(value ?? '');
        if (val == null) {
          return 'Required';
        }

        if (val < 0) {
          return 'Must be non-negative';
        }
        return null;
      },
    );
  }
}

class TriggerTimeoutWidget extends StatelessWidget {
  const TriggerTimeoutWidget({
    super.key,
    required this.triggerTimeout,
    required this.cb,
  });
  final double triggerTimeout;
  final ValueChanged<double> cb;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(helper: Text('Trigger Timeout (sec)')),
      initialValue: triggerTimeout.toString(),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      keyboardType:
          const TextInputType.numberWithOptions(signed: false, decimal: false),
      onChanged: (value) => cb(double.tryParse(value) ?? triggerTimeout),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        final val = double.tryParse(value ?? '');
        if (val == null) {
          return 'Required';
        }

        if (val < 0) {
          return 'Must be non-negative';
        }
        return null;
      },
    );
  }
}

import 'package:alazar_control/repository/models/alazar_board.dart';
import 'package:alazar_control/repository/models/alazar_settings.dart';
import 'package:alazar_control/repository/models/control_box.dart';
import 'package:alazar_control/repository/models/exceptions.dart';
import 'package:alazar_control/repository/models/imaging_settings.dart';
import 'package:alazar_control/repository/models/trigger_mode.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'experiment.mapper.dart';

part 'experiment_imaging.dart';

// Experiment types are in their own part files:

/// Galvo-Res Experiment:
part 'experiment_galvo_res.dart';

/// Galvo-Galvo Experiment:
part 'experiment_galvo_galvo.dart';

/// Instructions for adding a new experiment type:
/// 1. Add a new part file that defines the experimental parameters (see
/// experiment_galvo_res.dart for an example)
/// 2. Code a new UI input that corresponds to the new measurement and what
/// needs to be specified for it
/// 3. Update any switch cases that have compile-time errors due to sealed class
/// (e.g. in all_experiments_enum.dart)

@MappableClass(discriminatorKey: 'type')
sealed class Experiment with ExperimentMappable {
  const Experiment({
    required this.settings,
    required this.laserRepRateMHz,
    this.folderPath = '',
    this.autosave = false,
    this.liveFn = '',
    this.endFn = '',
    this.preAcqFn = '',
    this.postAcqFn = '',
    this.numberOfAcquisitions = 1,
    this.controlBoxNeeded = false,
    this.controlBox,
  });
  final AlazarSettings settings;
  final double laserRepRateMHz;
  final String folderPath;
  final bool autosave;

  // Function strings (if needed) for what to do before/after/between measurements
  final String liveFn;
  final String endFn;
  final String preAcqFn;
  final String postAcqFn;

  final int numberOfAcquisitions;

  // Extra Control Box Stuff:
  final bool controlBoxNeeded;
  final ControlBox? controlBox;

  /// Functions to prepare the derived settings for Alazar
  static AlazarSettings prepareSettingsStandard({
    required double laserRepRateMHz,
    required int imageHeightPix,
    required int numberOfFrames,
    required double scanPeriodUs,
    required List<AlazarBoard> boards,
    required TriggerMode triggerMode,
    required int triggerLevel,
    required double triggerDelaySec,
    required double triggerTimeoutSec,
    required int preTriggerSamples,
  }) {
    for (final board in boards) {
      if (board.countEnabledChannels().isOdd ||
          board.countEnabledChannels() == 0) {
        throw InvalidNumberOfChannelsException(
            'Invalid number of channels are active, should be 1, 2, or 4. You supplied: ${board.countEnabledChannels()} on board: ${boards.indexOf(board)}');
      }
    }

    final int samplesPerRecord = calculateSamplesStandard(
      scanFreqHz: scanPeriodToScanFreqHz(scanPeriodUs),
      laserRepRateMHz: laserRepRateMHz,
      imageHeightPix: imageHeightPix,
    );
    final int totalSamples = samplesPerRecord * numberOfFrames;
    return AlazarSettings(
      sampleRate: boards.first.boardType.getSampleRate(laserRepRateMHz),
      decimationFactor: boards.first.boardType.getDecimationFactor(),
      samplesPerRecord: samplesPerRecord,
      totalSamples: totalSamples,
      recordsPerBuffer: 1,
      numBuffers: numberOfFrames,
      recordsPerAcquisition: numberOfFrames,
      preTriggerSamples: preTriggerSamples,
      triggerDelaySec: triggerDelaySec,
      triggerTimeoutSec: triggerTimeoutSec,
      triggerLevel: triggerLevel,
      boards: boards,
      triggerMode: triggerMode,
    );
  }

  static int calculateSamplesStandard({
    required double scanFreqHz,
    required double laserRepRateMHz,
    required int imageHeightPix,
  }) {
    final int samplesPerLine =
        ((1e9 / scanFreqHz) / (1e3 / laserRepRateMHz)).toInt();
    final int frameSamples = samplesPerLine * imageHeightPix;
    if (frameSamples < 256) {
      throw const TooFewSamplesException(
          'Too few samples per frame (minimum 256). Increase pixel dwell time or resolution of image');
    }

    const double minMod = 1e-12;

    if (!((samplesPerLine.toDouble() % 1) < minMod)) {
      throw const BadSamplesPerLineException(
          'Samples for a single line is not within allowed tolerance ($minMod) of an integer. Adjust width resolution or mirror period.');
    }

    return frameSamples;
  }

  bool isValid() => true;

  static double scanPeriodToScanFreqHz(double scanPeriodUs) {
    return 1 / (scanPeriodUs * 1e-6);
  }
}

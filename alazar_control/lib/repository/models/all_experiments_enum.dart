import 'package:alazar_control/repository/models/experiment.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'all_experiments_enum.mapper.dart';

@MappableEnum()
enum AllExperimentsEnum {
  galvoGalvoImage('Galvo-Galvo Imaging'),
  galvoResImage('Galvo-Res Imaging'),
  galvoGalvoMirage('Galvo-Galvo Mirage'),
  galvoGalvoAutocorrelation('Galvo-Galvo Autocorrelation');

  const AllExperimentsEnum(this.label);
  final String label;

  static AllExperimentsEnum fromModel<T extends Experiment>(T experiment) =>
      switch (experiment) {
        ExperimentGalvoRes() => AllExperimentsEnum.galvoResImage,
        ExperimentGalvoGalvo() => AllExperimentsEnum.galvoGalvoImage,
      };
}

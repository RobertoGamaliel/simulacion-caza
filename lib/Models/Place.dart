import 'package:prey_predator_simulacion/Models/Predator.dart';
import 'package:prey_predator_simulacion/Models/Prey.dart';

class Place {
  Place(
      {required this.odor,
      required this.view,
      required this.noise,
      required this.preys,
      required this.predators});

  int odor;
  int view;
  int noise;
  List<Prey> preys;

  List<Predator> predators;
}

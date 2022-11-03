import 'package:prey_predator_simulacion/Models/Place.dart';

class Environment {
  Environment(
      {required this.tX,
      required this.tY,
      required this.predatorCount,
      required this.preysCount});
  int tX, tY, predatorCount, preysCount;
  List<List<Place>> matrix = [];

  bool canMove(int x, int y) {
    if (tX <= x) return false;
    if (x < 0) return false;
    if (tY <= y) return false;
    if (y < 0) return false;
    return true;
  }
}

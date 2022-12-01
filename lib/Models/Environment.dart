import 'dart:math';

import 'package:prey_predator_simulacion/Models/Place.dart';

class Environment {
  Environment({
    required this.tX,
    required this.tY,
  });
  int tX, tY;
  List<List<Place>> matrix = [];

  bool canMove(int x, int y) {
    if (tX <= x) return false;
    if (x < 0) return false;
    if (tY <= y) return false;
    if (y < 0) return false;
    return true;
  }

//Realiza una iteracion a todos los places
  void iteratePlaces() {
    for (var xplaces in matrix) {
      for (var yplace in xplaces) {
        yplace.iteratePlace();
      }
    }
  }

//imprime las estadisticas actuales de la poblacion de todos los places
  void pintPlaces() {
    int x = 0, y = 0;
    for (var xplaces in matrix) {
      for (var yplace in xplaces) {
        print("Población ($x,$y)");
        yplace.statistic();
        y++;
      }
      x++;
    }
  }

  generatePlaces() {
    for (var x = 0; x < tX; x++) {
      matrix.add([]);
      for (var y = 0; y < tY; y++) {
        matrix.last.add(Place(
            odor: Random().nextInt(15),
            view: Random().nextInt(10),
            noise: Random().nextInt(14)));
        matrix.last.last.generate(x, y);
      }
    }
  }
}

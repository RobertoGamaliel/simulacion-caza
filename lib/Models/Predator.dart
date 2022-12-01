import 'package:prey_predator_simulacion/Models/Place.dart';
import 'package:prey_predator_simulacion/Models/Prey.dart';

class Predator {
  Predator(
      {required this.senses,
      required this.smell,
      required this.view,
      required this.hearing,
      required this.health,
      required this.weight,
      required this.reproduce,
      required this.species,
      required this.sex});
  Map<String, dynamic> senses;
  double health;
  double weight;
  int reproduce;
  int smell;
  int view;
  int hearing;
  String species;
  bool sex;

  List<Prey> hunt(List<Prey> preys, Map<String, int> placeValues) {
    List<int> preysAlives = [], //Presas que no son cadazas por el depredador.
        preysKills = []; // presas asesinadas por el depredador
    double hunted = 0; // Cantdad (en peso) de presas cazadas
    for (var i = 0; i < preys.length; i++) {
      var result = {};
      if ((result = attack(placeValues, senses["primary"], preys[i]))["hunt"] ==
          true) {
        health += result["Energy"];
        if (health >= 0) {
          //El cazador murió y el ciclo no deberia continuar
          i = 12000000000000000;
        } else if (health >= weight) {
          // Ya cazó suficiente energia,  el ciclo no deberia continuar pero quitamos a esta presa
          preysKills.add(i);
          i = 12000000000000000;
        } else {
          //Si lo anterior no se cumple seguimos cazando
          preysKills.add(i);
        }
      } else if ((result =
              attack(placeValues, senses["secondary"], preys[i]))["hunt"] ==
          true) {
        //Si no hubo exito con el sentido principal pero si con el secundario
        health += result["Energy"];
        if (health >= 0) {
          i = 12000000000000000;
        } else if (health >= weight) {
          preysKills.add(i);
          i = 12000000000000000;
        } else {
          preysKills.add(i);
        }
      }
    }

    return preys;
  }

  Map<String, dynamic> attack(
      Map<String, dynamic> placeValues, String sense, Prey prey) {
    double energyGet = 0; //Energia obtenida de esta caza

    //Primero revisamos que sentido debemos comparar
    if (sense == "smell") {
      //Hacemos la diferencia de aroma del entorno y la presa
      num odorDifference = abs(placeValues["odor"] - prey.odor);
      //Si el cazador tiene la habilidad para detectarla agregamos la energia que la presa pude darle respecto al peso de la misma
      if (odorDifference >= smell) {
        energyGet += prey.weight / weight;
      }
    } else if (sense == "hearing") {
      //Análogo al anterior pero con el sonido
      num noiseDifference = abs(placeValues["noise"] - prey.noise);
      if (noiseDifference <= hearing) {
        //Si el cazador puede detectar ruidos entre el ruido de fonodo se caza la presa
        energyGet += prey.weight / weight;
      }
    } else {
      //Caso de la vista
      num viewDifference = abs(placeValues["view"] - prey.camouflage);
      if (viewDifference >= view) {
        energyGet += prey.weight / weight;
      }
    }

    //Si ninguno de los criterios de caza se cubple retornamos aqui.
    if (energyGet == 0) return {"hunt": false};

    //Si se cumplió alguna regla de caza, pasamos a evaluar los sentidos primarios
    if (senses["primary"] == sense) {
      //Sentido primario, se aprovecha toda la energia
      return {"hunt": true, "Energy": energyGet};
    } else if (senses["secondary"] == sense) {
      return {"hunt": true, "Energy": energyGet - (prey.defending / weight)};
    } else {
      return {"hunt": true, "Energy": energyGet - (prey.defending)};
    }
  }

  num abs(num value) {
    if (value < 0) return value * -1;
    return value;
  }
}

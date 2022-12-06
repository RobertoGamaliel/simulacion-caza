import 'package:prey_predator_simulacion/Functions/GenerateToken.dart';
import 'package:prey_predator_simulacion/Models/Environment.dart';
import 'package:prey_predator_simulacion/Models/Prey.dart';
import 'dart:math';

class Predator {
  Predator({required this.senses}) {
    List<String> speciess = [
      "León",
      "Gato",
      "Lobo",
      "Aguila",
      "Bacalaho",
      "Chupacabras"
    ];
    final pa = Environment.ua.hunterA;
    smell = 1;
    view = 1;
    hearing = 1;
    health = 1;
    weight = 1;
    species = speciess[Random().nextInt(6)];
    sex = false;
  }
  static int living = 0;
  Map<String, dynamic> senses;
  double health = 0;
  double weight = 0;
  double reproduce = 0;
  int smell = 0;
  int view = 0;
  int hearing = 0;
  String species = "";
  String token = "";
  bool sex = false; // true = hembra, false = macho

  List<dynamic> hunt(List<Prey> preys, Map<String, int> placeValues,
      List<Predator> predators) {
    List<Prey> preysAlives = []; //Presas que no son cadazas por el depredador.
    List<Prey> preysKills = []; // presas asesinadas por el depredador

    health -= weight *
        Environment.ua.hunterA
            .energyIteration; //Perdida (-0.25%) de energia por el paso del tiempo

    if (health < weight * 1.1) {
      //Si se tiene valores muy altos de salud no se caza
      for (var i = 0; i < preys.length; i++) {
        var result = {};
        if ((result =
                attack(placeValues, senses["primary"], preys[i]))["hunt"] ==
            true) {
          //sentido primario, maxima ganancia de energia
        } else if ((result =
                attack(placeValues, senses["secondary"], preys[i]))["hunt"] ==
            true) {
          //Sentido secundario, perdida razonable de energia
        } else if ((result =
                attack(placeValues, senses["third"], preys[i]))["hunt"] ==
            true) {
          //Sentido terciaro, perdida maxima de energia
        }

        if (result.isNotEmpty && result["hunt"] == true) {
          health -= weight * .1; //Perdida (-0.10%) de energia por cazar
          //Si se cazó a la presa
          health +=
              result["Energy"]; //Energia obtenida/perdida por cazar esta presa

          if (health <= 0) {
            //El cazador murió y el ciclo no deberia continuar
            i = 99999999999999999;
          } else if (health >= weight) {
            // Ya cazó suficiente energia, se ajusta la cantidad maxima de energia posible
            health = health > weight * 1.1 ? weight * 1.1 : health + 0;
            preysKills.add(preys[i]);
            i = 99999999999999999;
          } else {
            //Si lo anterior no se cumple seguimos cazando
            preysKills.add(preys[i]);
          }
        }
      }
    }

    if (sex) {
      //Si es hembra le sumamos el valor de reporducción
      if (reproduce < Environment.ua.hunterA.reproduceRatio) {
        reproduce += (Environment.ua.hunterA.reproductionAdd /
            weight); //capacidad de reporduccion
      }

      bool hasMale = predators
          .any((element) => element.species == species && !element.sex);

      if (reproduce >= Environment.ua.hunterA.reproduceRatio &&
          hasMale &&
          !(3 / weight).isNaN) {
        reproduce = 0;
        //Sacamos cuantas crias tendra y en un ciclo for las incluimos
        int sons = (Environment.ua.hunterA.maxChild / weight).ceil();
        for (var i = 0; i < sons; i++) {
          predators.add(Predator(
            senses: senses,
          ));
        }
      }
    }

    //Revisamos las presas que fueron asesinadas por este cazador y las eliminamos de la lista
    while (preysKills.isNotEmpty) {
      preys.remove(preysKills.last);
      preysKills.removeLast();
    }

    for (var i = 0; i < preys.length; i++) {
      preysAlives.add(preys[i]);
    }

    //Por ultimo revisamos si este u otro depredador sigue vivo o muerto pues pudo haber muerto al recibir mas daños
    //Que energia al cazar
    if (health <= 0) {
      print("Cazador muerto $health");
      predators.removeWhere((element) => element.token == token);
    }

    return [preys, predators];
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
        energyGet += (prey.weight / weight);
      }
    } else if (sense == "hearing") {
      //Análogo al anterior pero con el sonido
      num noiseDifference = abs(placeValues["noise"] - prey.noise);
      if (noiseDifference <= hearing) {
        //Si el cazador puede detectar ruidos entre el ruido de fonodo se caza la presa
        energyGet += (prey.weight / weight);
      }
    } else {
      //Caso de la vist
      num viewDifference = abs(placeValues["view"] - prey.camouflage);
      if (viewDifference >= view) {
        energyGet += (prey.weight / weight);
      }
    }

    //Si ninguno de los criterios de caza se cubple retornamos aqui.
    if (energyGet == 0) return {"hunt": false};

    //Si se cumplió alguna regla de caza, pasamos a evaluar los sentidos primarios
    if (senses["primary"] == sense) {
      //Sentido primario, se aprovecha toda la energia
      return {"hunt": true, "Energy": energyGet};
    } else if (senses["secondary"] == sense) {
      energyGet -= (prey.defending / weight);
      return {"hunt": true, "Energy": energyGet};
    } else {
      energyGet -= prey.defending;
      return {"hunt": true, "Energy": energyGet};
    }
  }

  num abs(num value) {
    if (value < 0) return value * -1;
    return value;
  }
}

import 'package:prey_predator_simulacion/Functions/GenerateToken.dart';
import 'package:prey_predator_simulacion/Models/Prey.dart';
import 'dart:math';

class Predator {
  Predator(
      {required this.senses,
      required this.smell,
      required this.view,
      required this.hearing,
      required this.health,
      required this.weight,
      required this.token,
      required this.species,
      required this.sex});
  Map<String, dynamic> senses;
  double health;
  double weight;
  double reproduce = 0;
  int smell;
  int view;
  int hearing;
  String species;
  String token;
  bool sex; // true = hembra, false = macho

  List<dynamic> hunt(List<Prey> preys, Map<String, int> placeValues,
      List<Predator> predators) {
    List<Prey> preysAlives = []; //Presas que no son cadazas por el depredador.
    List<int> preysKills = []; // presas asesinadas por el depredador
    for (var i = 0; i < preys.length; i++) {
      var result = {};
      if ((result = attack(placeValues, senses["primary"], preys[i]))["hunt"] ==
          true) {
        health += result["Energy"];
        if (health <= 0) {
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
        if (sex) {
          print("Población health: $health, result ${result["Energy"]}");
        }
      } else if ((result =
              attack(placeValues, senses["secondary"], preys[i]))["hunt"] ==
          true) {
        //Si no hubo exito con el sentido principal pero si con el secundario
        health += result["Energy"];
        if (health <= 0) {
          i = 12000000000000000;
        } else if (health >= weight) {
          preysKills.add(i);
          i = 12000000000000000;
        } else {
          preysKills.add(i);
        }
        if (sex) {
          print("Población health: $health, result ${result["Energy"]}");
        }
      } else if ((result =
              attack(placeValues, senses["third"], preys[i]))["hunt"] ==
          true) {
        //Si no hubo exito con el sentido principal pero si con el secundario
        health += result["Energy"];
        if (health <= 0) {
          i = 12000000000000000;
        } else if (health >= weight) {
          preysKills.add(i);
          i = 12000000000000000;
        } else {
          preysKills.add(i);
        }
        if (sex) {
          print("Población health: $health, result ${result["Energy"]}");
        }
      } else {
        //En caso de que ningun tipo de sentido detecta a la presa no hacemos nada?
      }
    }

    if (sex) {
      //Si es hembra le sumamos el valor de reporducción
      reproduce += 1.5 / weight;
      //Si la variable de preproduccion se llena y hay un macho en los depredadores realizamos la reproducción
      if (reproduce >= 3 && predators.any((element) => element.sex == false)) {
        reproduce = 0;

        //Sacamos cuantas crias tendra y en un ciclo for las incluimos
        int sons = (3 / weight).ceil();
        for (var i = 0; i < sons; i++) {
          predators.add(Predator(
              senses: senses,
              smell: smell,
              view: view,
              token: GenerateToken.GenToken(),
              hearing: hearing,
              health:
                  health, //Solo tendrá una tercera parte d ela vida de la madre
              weight: weight,
              species: species,
              sex: Random().nextInt(2) == 0 ? true : false));
        }
      }
    }

    //Revisamos las presas que fueron asesinadas por este cazador y las eliminamos de la lista
    for (var i = 0; i < preys.length; i++) {
      //Si el indice no esta incluido en los indices de presas asesinadas las agregamos en las presas vivas
      if (!preysKills.any((element) => element == i)) {
        preysAlives.add(preys[i]);
      }
    }

    //Por ultimo revisamos si el depredador sigue vivo o muerto pues pudo haber muerto al recibir mas daños
    //Que energia al cazar
    if (health <= 0) {
      //Buscamos su index usando su token y con este eliminamos el cazador de la lista
      int index = predators.indexWhere((element) => element.token == token);
      predators.removeAt(index);
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

import 'dart:math';

import 'package:prey_predator_simulacion/Functions/GenerateToken.dart';
import 'package:prey_predator_simulacion/Models/Predator.dart';
import 'package:prey_predator_simulacion/Models/Prey.dart';

class Place {
  Place({required this.odor, required this.view, required this.noise});

  int odor;
  int view;
  int noise;
  List<Prey> preys = [];
  List<Predator> predators = [];

  void iteratePlace() {
    iteratePreys();
    iteratePredators();
  }

  //Funcion para iterar la lista de depresadores
  void iteratePredators() {
    //Creamos una lista que se actualizará contantemente con los depredadores acttualizados
    List<Predator> actualPredators = [];
    for (var predator in predators) {
      //copiamos los depredadores ene sta lista
      actualPredators.add(predator);
    }

    //Definimos un map con los atributos e entorno
    Map<String, int> placeValues = {"odor": odor, "noise": noise, "view": view};
    for (var predator in predators) {
      //La funcion hunt nos pasará la lista de presas y depredadores modificados
      final result = predator.hunt(preys, placeValues, actualPredators);
      preys = result[0];
      actualPredators = result[1];
    }

    while (actualPredators.any((element) => element.health <= 0)) {
      actualPredators.removeWhere((element) => element.health <= 0);
    }

    //Cuando iteramos toda la lista original de depredadores, la igualamos con la modificada
    predators = actualPredators;
  }

  //Función para gestionar la lista de presas
  void iteratePreys() {
    List<Prey> newChilds =
        []; //Aqui guuardaremos las crias de presas para no alterar aún la lista inicial
    bool hasMale = preys.any((element) =>
        element.sex == false); //Vemos si hay algun macho en la lista

    ///Recorremos la lista de presas y ejecutamos su funcion reproducir
    for (var prey in preys) {
      //Cada presa devolvera una lista de hijos (puede estar vacia), si se reproduce guardamos las crias
      final childs = prey.reproduceFunction(hasMale);
      for (var child in childs) {
        newChilds.add(child);
      }
    }

    //Ya recorrida la lista de prresas, la modificamos agregando las nuevas crias
    for (var newchild in newChilds) {
      newchild.defensa();
      preys.add(newchild);
    }
  }

  List<num> statistic() {
    List<num> resume = [];
    resume.add(predators.length);
    int male = 0, female = 0;
    for (var predator in predators) {
      if (predator.sex) {
        female++;
      } else {
        male++;
      }
    }
    resume.add(male);
    resume.add(female);
    resume.add(preys.length);
    male = 0;
    female = 0;
    for (var prey in preys) {
      if (prey.sex) {
        female++;
      } else {
        male++;
      }
    }
    resume.add(male);
    resume.add(female);
    return resume;
  }

  void generate(int x, int y) {
    int totalPreys = Random().nextInt(100) + 1;
    int totalPredators = Random().nextInt(50) + 1;
    List<String> species = [
      "León",
      "Gato",
      "Lobo",
      "Aguila",
      "Bacalaho",
      "Chupacabras"
    ];
    for (var i = 0; i < totalPredators; i++) {
      predators.add(Predator(
          senses: makeSenses(),
          smell: Random().nextInt(9) + 1,
          view: view,
          hearing: Random().nextInt(9) + 1,
          health: Random().nextInt(9) + 1,
          weight: (Random().nextInt(9) + 2) / 2,
          token: GenerateToken.GenToken(),
          species: species[Random().nextInt(6)],
          sex: i < totalPredators / 2 ? true : false)); //Random().nextBool()));
    }

    for (var i = 0; i < totalPreys; i++) {
      preys.add(Prey(x: x, y: y, sex: Random().nextBool()));
      preys[i].defensa();
    }
  }

  Map<String, dynamic> makeSenses() {
    List<String> sensesClass = ["smell", "hearing", "view"], sensesAdd = [];
    while (sensesAdd.length < 3) {
      int index = Random().nextInt(3);
      String sense = sensesClass[index];
      if (!sensesAdd.contains(sense)) {
        sensesAdd.add(sense);
      }
    }

    Map<String, dynamic> senses = {};
    senses["primary"] = sensesAdd[0];
    senses["secondary"] = sensesAdd[1];
    senses["third"] = sensesAdd[2];
    return senses;
  }

  int femalePrey() {
    int total = 0;
    for (var prey in preys) {
      if (prey.sex) total++;
    }
    return total;
  }

  int femlePredtors() {
    int total = 0;
    for (var predator in predators) {
      if (predator.sex) total++;
    }
    return total;
  }

  int preyDanger({required bool maxx}) {
    int val = 0;
    for (var prey in preys) {
      val = maxx ? max(prey.defending, val) : min(prey.defending, val);
    }
    return val;
  }

  double predatorHealth({required bool maxx}) {
    double live = maxx ? 0 : 10000;
    for (var pred in predators) {
      live = maxx ? max(live, pred.health) : min(live, pred.health);
    }
    return live;
  }

  double averagePradorHealth() {
    double total = 0;
    int len = 0;
    for (var pred in predators) {
      total += pred.health;
      len++;
    }
    return total / len;
  }

  double averagePreyDanger() {
    double total = 0;
    int len = 0;
    for (var prey in preys) {
      total += prey.defending;
      len++;
    }
    return total / len;
  }
}

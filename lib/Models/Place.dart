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

    print("Población total depredadores: ${resume[0]}");
    print("Población depredadores machos: ${resume[1]}");
    print("Población depredadores hembras: ${resume[2]}");
    print("Población_________________________");
    print("Población total presas ${resume[3]}");
    print("Población presas machos: ${resume[4]}");
    print("Población presas hembras: ${resume[5]}");
    print("Población-----------------------------------------------------");
    print("Población_____________________________________________");
    print("Población_______________________________");
    print("Población__________________");
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
          weight: Random().nextInt(9) / 2,
          token: GenerateToken.GenToken(),
          species: species[Random().nextInt(6)],
          sex: i < totalPredators / 2 ? true : false)); //Random().nextBool()));
    }

    for (var i = 0; i < totalPreys; i++) {
      preys.add(Prey(x: x, y: y, sex: Random().nextBool()));
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
}

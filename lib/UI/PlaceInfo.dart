import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prey_predator_simulacion/Models/Place.dart';
import 'package:prey_predator_simulacion/UI/PlacceColors.dart';

class PlaceInfo extends StatelessWidget {
  PlaceInfo({Key? key, required this.place, required this.x, required this.y})
      : super(key: key);
  Place place;
  final int x, y;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Casilla ($x,$y)', style: GoogleFonts.poppins()),
        centerTitle: true,
      ),
      body: SizedBox(
        width: s.width,
        height: s.height,
        child: ListView(
          children: [
            colorsResume(s.width / 5),
            Text(
              "\nPresas: ${place.preys.length}",
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Text(
              "Hembras: ${place.femalePrey()}  -  Machos: ${place.preys.length - place.femalePrey()}",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w200,
                  fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Text(
              "Daño maximo: ${place.preyDanger(maxx: true)}  -  Daño minimo: ${place.preyDanger(maxx: false)}",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w200,
                  fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Text(
              "Promedio de daño: ${place.averagePreyDanger().toStringAsFixed(4)}",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w200,
                  fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Text(
              "\nDepredadores: ${place.predators.length}",
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Text(
              "Hembras: ${place.femlePredtors()}  -  Machos: ${place.predators.length - place.femlePredtors()}",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w200,
                  fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Text(
              "salud max: ${place.predatorHealth(maxx: true)}  -  Salud min: ${place.predatorHealth(maxx: false)}",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w200,
                  fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Text(
              "Promedio de salud: ${place.averagePradorHealth().toStringAsFixed(4)}\n",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w200,
                  fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: s.width / 10,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 0.5)),
                  child: const Text(
                    "Energia",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: s.width / 10,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.black, width: 0.5)),
                  child: const Text(
                    "Peso",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: s.width / 10,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 0.5)),
                  child: const Text(
                    "Rep.",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: s.width / 10,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent[300],
                      border: Border.all(color: Colors.black, width: 0.5)),
                  child: const Text(
                    'sexo',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: s.width / 10,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 0.5)),
                  child: const Text(
                    "Camouf",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: s.width / 10,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.black, width: 0.5)),
                  child: const Text(
                    "Noise",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: s.width / 10,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 0.5)),
                  child: const Text(
                    "Odor",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: s.width / 10,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 0.5)),
                  child: const Text(
                    'Estado',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: s.width / 10,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.black, width: 0.5)),
                  child: const Text(
                    "Birth",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                place.preys.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: s.width / 10,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Colors.white
                                : Colors.grey[200],
                            border:
                                Border.all(color: Colors.black, width: 0.5)),
                        child: Text("${place.preys[index].energy}"),
                      ),
                      Container(
                        width: s.width / 10,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Colors.white
                                : Colors.grey[200],
                            border:
                                Border.all(color: Colors.black, width: 0.5)),
                        child: Text("${place.preys[index].weight}"),
                      ),
                      Container(
                        width: s.width / 10,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Colors.white
                                : Colors.grey[200],
                            border:
                                Border.all(color: Colors.black, width: 0.5)),
                        child: Text(
                            place.preys[index].reproduce.toStringAsFixed(2)),
                      ),
                      Container(
                        width: s.width / 10,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: place.preys[index].sex
                                ? Colors.pink[50]
                                : Colors.greenAccent[300],
                            border:
                                Border.all(color: Colors.black, width: 0.5)),
                        child: Text(
                          place.preys[index].sex ? 'Hembra' : 'Macho',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 8),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: s.width / 10,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Colors.white
                                : Colors.grey[200],
                            border:
                                Border.all(color: Colors.black, width: 0.5)),
                        child: Text("${place.preys[index].camouflage}"),
                      ),
                      Container(
                        width: s.width / 10,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Colors.white
                                : Colors.grey[200],
                            border:
                                Border.all(color: Colors.black, width: 0.5)),
                        child: Text("${place.preys[index].noise}"),
                      ),
                      Container(
                        width: s.width / 10,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Colors.white
                                : Colors.grey[200],
                            border:
                                Border.all(color: Colors.black, width: 0.5)),
                        child: Text("${place.preys[index].odor}"),
                      ),
                      Container(
                        width: s.width / 10,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: place.preys[index].sex
                                ? const Color.fromRGBO(255, 108, 108, 1)
                                : const Color.fromARGB(255, 0, 216, 112),
                            border:
                                Border.all(color: Colors.black, width: 0.5)),
                        child: Text(
                          place.preys[index].normal ? 'Normal' : 'Defensa+',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 8),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: s.width / 10,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Colors.white
                                : Colors.grey[200],
                            border:
                                Border.all(color: Colors.black, width: 0.5)),
                        child: Text("${place.preys[index].giveBirth}"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget colorsResume(double side) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: side,
          height: side,
          color: PlaceColors.viewColor(place.view),
          alignment: Alignment.center,
          child: Text(
            "Vista:\n${place.view}",
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: side,
          height: side,
          color: PlaceColors.smellColor(place.odor),
          alignment: Alignment.center,
          child: Text(
            "Aroma:\n${place.odor}",
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: side,
          height: side,
          color: PlaceColors.noiseColor(place.noise),
          alignment: Alignment.center,
          child: Text(
            "Sonido:\n${place.noise}",
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
        combinedContainer(side)
      ],
    );
  }

  Widget combinedContainer(double side) {
    return Stack(
      children: [
        Container(
          width: side,
          height: side,
          color: PlaceColors.viewColor(place.view).withOpacity(1 / 3),
        ),
        Container(
          width: side,
          height: side,
          color: PlaceColors.noiseColor(place.noise).withOpacity(1 / 3),
        ),
        Container(
          alignment: Alignment.center,
          width: side,
          height: side,
          decoration: BoxDecoration(
              color: PlaceColors.smellColor(place.odor).withOpacity(1 / 3),
              border: Border.all(color: Colors.black54, width: 0.5)),
          child: Text(
            "Combinado",
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 11),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

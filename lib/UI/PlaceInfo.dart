import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prey_predator_simulacion/Models/Place.dart';
import 'package:prey_predator_simulacion/UI/PlacceColors.dart';
import 'package:prey_predator_simulacion/UI/preysDescription.dart';

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
              "Salud max: ${place.predatorHealth(maxx: true)}  -  Salud min: ${place.predatorHealth(maxx: false)}",
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
            Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  preysDecription(preys: place.preys)));
                    },
                    child: const Text("Detalles de pesas")))
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

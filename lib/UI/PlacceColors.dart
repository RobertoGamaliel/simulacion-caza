import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prey_predator_simulacion/Models/Place.dart';

class PlaceColors {
  static Color placeColor(Place place, int type) {
    if (type == 0) {
      return viewColor(place.view);
    }
    if (type == 1) {
      return noiseColor(place.noise);
    }

    return smellColor(place.odor);
  }

  static Color viewColor(int colorView) {
    if (colorView == 0) return const Color.fromARGB(255, 225, 241, 252);
    if (colorView == 1) return const Color.fromARGB(255, 181, 218, 248);
    if (colorView == 2) return const Color.fromARGB(255, 143, 203, 252);
    if (colorView == 3) return const Color.fromARGB(255, 134, 201, 255);
    if (colorView == 4) return const Color.fromARGB(255, 122, 195, 255);
    if (colorView == 5) return const Color.fromARGB(255, 103, 186, 253);
    if (colorView == 6) return const Color.fromARGB(255, 86, 175, 248);
    if (colorView == 7) return const Color.fromARGB(255, 56, 161, 248);
    if (colorView == 8) return const Color.fromARGB(255, 48, 156, 246);
    if (colorView == 9) return const Color.fromARGB(255, 2, 123, 222);
    if (colorView == 10) return const Color.fromARGB(255, 4, 118, 211);
    return const Color.fromARGB(255, 12, 68, 153);
  }

  static Color smellColor(int colorSmell) {
    if (colorSmell == 0) return const Color.fromARGB(255, 252, 225, 225);
    if (colorSmell == 1) return const Color.fromARGB(255, 248, 181, 181);
    if (colorSmell == 2) return const Color.fromARGB(255, 252, 170, 143);
    if (colorSmell == 3) return const Color.fromARGB(255, 255, 134, 134);
    if (colorSmell == 4) return const Color.fromARGB(255, 255, 122, 122);
    if (colorSmell == 5) return const Color.fromARGB(255, 253, 103, 103);
    if (colorSmell == 6) return const Color.fromARGB(255, 248, 86, 86);
    if (colorSmell == 7) return const Color.fromARGB(255, 248, 56, 56);
    if (colorSmell == 8) return const Color.fromARGB(255, 246, 48, 48);
    if (colorSmell == 9) return const Color.fromARGB(255, 222, 2, 2);
    if (colorSmell == 10) return const Color.fromARGB(255, 211, 4, 4);
    return const Color.fromARGB(255, 153, 12, 12);
  }

  static Color noiseColor(int colorNoise) {
    if (colorNoise == 0) return const Color.fromARGB(255, 225, 252, 225);
    if (colorNoise == 1) return const Color.fromARGB(255, 184, 248, 181);
    if (colorNoise == 2) return const Color.fromARGB(255, 143, 252, 143);
    if (colorNoise == 3) return const Color.fromARGB(255, 134, 255, 140);
    if (colorNoise == 4) return const Color.fromARGB(255, 135, 255, 122);
    if (colorNoise == 5) return const Color.fromARGB(255, 110, 253, 103);
    if (colorNoise == 6) return const Color.fromARGB(255, 132, 248, 86);
    if (colorNoise == 7) return const Color.fromARGB(255, 85, 248, 56);
    if (colorNoise == 8) return const Color.fromARGB(255, 48, 246, 51);
    if (colorNoise == 9) return const Color.fromARGB(255, 6, 222, 2);
    if (colorNoise == 10) return const Color.fromARGB(255, 7, 211, 4);
    return const Color.fromARGB(255, 19, 153, 12);
  }

  static Widget combineContainer(Place place, double side, int type) {
    if (type == 3) {
      return Stack(
        children: [
          Container(
            width: side,
            height: side,
            color: viewColor(place.view).withOpacity(1 / 3),
          ),
          Container(
            width: side,
            height: side,
            color: noiseColor(place.noise).withOpacity(1 / 3),
          ),
          Container(
              width: side,
              height: side,
              decoration: BoxDecoration(
                  color: smellColor(place.odor).withOpacity(1 / 3),
                  border: Border.all(color: Colors.black54, width: 0.5)),
              child: placeResumen(place))
        ],
      );
    }

    return Container(
        width: side,
        height: side,
        child: placeResumen(place),
        decoration: BoxDecoration(
            color: PlaceColors.placeColor(place, type),
            border: Border.all(color: Colors.black54, width: 0.5)));
  }

  static placeResumen(Place place) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Presas: ${place.preys.length}",
          style: GoogleFonts.montserrat(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
          textAlign: TextAlign.center,
        ),
        Text(
          "Hembras: ${place.femalePrey()}",
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 10),
          textAlign: TextAlign.center,
        ),
        Text(
          "Machos: ${place.preys.length - place.femalePrey()}",
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 10),
          textAlign: TextAlign.center,
        ),
        Text(
          "\nDepredadores: ${place.predators.length}",
          style: GoogleFonts.montserrat(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
          textAlign: TextAlign.center,
        ),
        Text(
          "Hembras: ${place.femlePredtors()}",
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 10),
          textAlign: TextAlign.center,
        ),
        Text(
          "Machos: ${place.predators.length - place.femlePredtors()}",
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 10),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

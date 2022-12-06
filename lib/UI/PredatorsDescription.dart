import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prey_predator_simulacion/Models/Predator.dart';

class PredatorsDecription extends StatelessWidget {
  PredatorsDecription({Key? key, required this.hunter}) : super(key: key);
  final List<Predator> hunter;
  double widSection = 0;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    widSection = s.width / 9;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Depredadores (${hunter.length})',
              style: GoogleFonts.poppins()),
          centerTitle: true,
          actions: [],
        ),
        body: SizedBox(
            child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: widSection,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          " Salud ",
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                    width: widSection,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          " Peso ",
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                    width: widSection,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          " Reproducción ",
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                    width: widSection,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          " Especie ",
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                    width: widSection,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent[300],
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          " Sexo ",
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                    width: widSection,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          " Vista ",
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                    width: widSection,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          " Oido ",
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                    width: widSection,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          " Olfato ",
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                    width: widSection,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          " Primario ",
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        )),
                  ),
                ],
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                      hunter.length,
                      (index) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: widSection,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: hunter[index].health < 3
                                        ? Colors.red
                                        : hunter[index].health < 6
                                            ? Colors.yellow
                                            : Colors.green,
                                    border: Border.all(
                                        color: Colors.black, width: 0.5)),
                                child: Text(
                                    hunter[index].health.toStringAsFixed(3)),
                              ),
                              Container(
                                width: widSection,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: index % 2 == 0
                                        ? Colors.white
                                        : Colors.grey[200],
                                    border: Border.all(
                                        color: Colors.black, width: 0.5)),
                                child: Text("${hunter[index].weight}"),
                              ),
                              Container(
                                width: widSection,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: index % 2 == 0
                                        ? Colors.white
                                        : Colors.grey[200],
                                    border: Border.all(
                                        color: Colors.black, width: 0.5)),
                                child: Text(
                                    hunter[index].reproduce.toStringAsFixed(2)),
                              ),
                              Container(
                                width: widSection,
                                height: 17,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: index % 2 == 0
                                        ? Colors.white
                                        : Colors.grey[200],
                                    border: Border.all(
                                        color: Colors.black, width: 0.5)),
                                child: Text(
                                  hunter[index].species,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 8),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                width: widSection,
                                height: 17,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: hunter[index].sex
                                        ? Colors.pink[50]
                                        : Colors.greenAccent[300],
                                    border: Border.all(
                                        color: Colors.black, width: 0.5)),
                                child: Text(
                                  hunter[index].sex ? 'Hembra' : 'Macho',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 8),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                width: widSection,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: index % 2 == 0
                                        ? Colors.white
                                        : Colors.grey[200],
                                    border: Border.all(
                                        color: Colors.black, width: 0.5)),
                                child: Text("${hunter[index].view}"),
                              ),
                              Container(
                                width: widSection,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: index % 2 == 0
                                        ? Colors.white
                                        : Colors.grey[200],
                                    border: Border.all(
                                        color: Colors.black, width: 0.5)),
                                child: Text("${hunter[index].hearing}"),
                              ),
                              Container(
                                width: widSection,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: index % 2 == 0
                                        ? Colors.white
                                        : Colors.grey[200],
                                    border: Border.all(
                                        color: Colors.black, width: 0.5)),
                                child: Text("${hunter[index].smell}"),
                              ),
                              Container(
                                width: widSection,
                                height: 17,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: index % 2 == 0
                                        ? Colors.white
                                        : Colors.grey[200],
                                    border: Border.all(
                                        color: Colors.black, width: 0.5)),
                                child: Text(
                                  "${hunter[index].senses["primary"]}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 8),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ))),
            ])));
  }
}

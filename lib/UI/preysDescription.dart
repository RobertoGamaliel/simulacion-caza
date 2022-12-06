import 'package:flutter/material.dart';
import 'package:prey_predator_simulacion/Models/Prey.dart';

class preysDecription extends StatelessWidget {
  preysDecription({Key? key, required this.preys}) : super(key: key);
  final List<Prey> preys;
  double widSection = 0;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    widSection = s.width / 10;
    return Scaffold(
        appBar: AppBar(
          title: Text('Presas (${preys.length})'),
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
                    child: const RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          " Energia ",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                    width: widSection,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: const RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          " Defensa ",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                    width: widSection,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: const RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          " Peso ",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                    width: widSection,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: const RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          " Reproducción ",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                    width: widSection,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent[300],
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: const RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          " Sexo ",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                    width: widSection,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: const RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          " Camuflage ",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                    width: widSection,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: const RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          " Ruido ",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                    width: widSection,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: const RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          " Aroma ",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                    width: widSection,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: const RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          " Estado ",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                    width: widSection,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: const RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          " Iteraciónes desde\núltimo nacimiento ",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
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
                      preys.length,
                      (index) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: widSection,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: index % 2 == 0
                                        ? Colors.white
                                        : Colors.grey[200],
                                    border: Border.all(
                                        color: Colors.black, width: 0.5)),
                                child: Text("${preys[index].energy}"),
                              ),
                              Container(
                                width: widSection,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: preys[index].defending < 3
                                        ? Colors.yellow
                                        : preys[index].defending < 6
                                            ? Colors.orange
                                            : Colors.red,
                                    border: Border.all(
                                        color: Colors.black, width: 0.5)),
                                child: Text("${preys[index].defending}"),
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
                                child: Text("${preys[index].weight}"),
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
                                    preys[index].reproduce.toStringAsFixed(2)),
                              ),
                              Container(
                                width: widSection,
                                height: 17,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: preys[index].sex
                                        ? Colors.pink[50]
                                        : Colors.greenAccent[300],
                                    border: Border.all(
                                        color: Colors.black, width: 0.5)),
                                child: Text(
                                  preys[index].sex ? 'Hembra' : 'Macho',
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
                                child: Text("${preys[index].camouflage}"),
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
                                child: Text("${preys[index].noise}"),
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
                                child: Text("${preys[index].odor}"),
                              ),
                              Container(
                                width: widSection,
                                height: 17,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: !preys[index].normal
                                        ? const Color.fromARGB(
                                            255, 255, 129, 129)
                                        : const Color.fromARGB(
                                            255, 39, 255, 150),
                                    border: Border.all(
                                        color: Colors.black, width: 0.5)),
                                child: Text(
                                  preys[index].normal ? 'Normal' : 'Defensa+',
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
                                child: Text("${preys[index].giveBirth}"),
                              ),
                            ],
                          ))),
            ])));
  }
}

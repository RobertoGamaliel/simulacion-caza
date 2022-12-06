import 'package:flutter/material.dart';
import 'package:prey_predator_simulacion/Models/Prey.dart';

class preysDecription extends StatelessWidget {
  preysDecription({Key? key, required this.preys}) : super(key: key);
  final List<Prey> preys;
  @override
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalles de las presas'),
          centerTitle: true,
          actions: [],
        ),
        body: SizedBox(
            child: ListView(children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: preys.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
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
                                  border: Border.all(
                                      color: Colors.black, width: 0.5)),
                              child: Text("${preys[index].energy}"),
                            ),
                            Container(
                              width: s.width / 10,
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
                              width: s.width / 10,
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
                              width: s.width / 10,
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
                              width: s.width / 10,
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
                              width: s.width / 10,
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
                              width: s.width / 10,
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
                              width: s.width / 10,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: preys[index].sex
                                      ? const Color.fromRGBO(255, 108, 108, 1)
                                      : const Color.fromARGB(255, 0, 216, 112),
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
                              width: s.width / 10,
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
                        );
                      },
                    ),
                  ],
                ),
              ))
        ])));
  }
}

import 'package:flutter/material.dart';
import 'package:prey_predator_simulacion/Functions/Dialogs.dart';
import 'package:prey_predator_simulacion/Models/Environment.dart';
import 'package:prey_predator_simulacion/UI/PlacceColors.dart';
import 'package:prey_predator_simulacion/UI/PlaceInfo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presa - depredador',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Inicio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _placeType = 0;
  Environment environment = Environment(tX: 4, tY: 3);
  late Size s;
  int maxX = 0, maxY = 0, iteration = 0;

  @override
  Widget build(BuildContext context) {
    s = MediaQuery.of(context).size;
    if (environment.matrix.isEmpty) {
      environment.generatePlaces();
      environment.pintPlaces();
      maxY = environment.matrix.length;
      maxX = environment.matrix.first.length;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
                child: Text(
              "Iteration: $iteration",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
              textAlign: TextAlign.center,
            )),
          ),
          FloatingActionButton(
              mini: true,
              heroTag: "reset",
              backgroundColor: const Color.fromARGB(255, 134, 1, 1),
              child: const Text(
                "Reset",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
                textAlign: TextAlign.center,
              ),
              onPressed: () async {
                if (!await Dialogs.boolAnswerDialog(
                    "Advertencia", "¿Resetear el entorno?", context)) return;
                environment.matrix = [];
                iteration = 0;
                setState(() {});
              }),
          FloatingActionButton(
              mini: true,
              heroTag: "ChangeVieyPlace",
              backgroundColor: const Color.fromARGB(255, 0, 145, 24),
              child: _iconPlaceType(),
              onPressed: () => setState(() {
                    if (_placeType == 3) {
                      _placeType = 0;
                    } else {
                      _placeType++;
                    }
                  }))
        ],
      ),
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                maxY,
                (yi) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                      maxX,
                      (xi) => GestureDetector(
                            onTap: (() => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        PlaceInfo(
                                            place: environment.matrix[yi][xi],
                                            x: xi + 1,
                                            y: yi + 1)))),
                            child: PlaceColors.combineContainer(
                                environment.matrix[yi][xi],
                                s.width / maxX,
                                _placeType),
                          )),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (environment.matrix.any((column) =>
              column.any((element) => element.preys.length > 2000))) {
            Dialogs.simpleAlertDialog("Error",
                "Existen demasiadas presas en uno o más entornos", context);
            return;
          }
          if (environment.matrix.any((column) =>
              column.any((element) => element.predators.length > 2000))) {
            Dialogs.simpleAlertDialog(
                "Error",
                "Existen demasiados depredadores en uno o más entornos",
                context);
            return;
          }
          environment.iteratePlaces();
          iteration++;
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _iconPlaceType() {
    if (_placeType == 0) {
      return const Text(
        "View",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
        textAlign: TextAlign.center,
      );
    }

    if (_placeType == 1) {
      return const Text(
        "Noise",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
        textAlign: TextAlign.center,
      );
    }

    if (_placeType == 2) {
      return const Text(
        "Smell",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
        textAlign: TextAlign.center,
      );
    }

    return const Text(
      "All",
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
      textAlign: TextAlign.center,
    );
  }
}

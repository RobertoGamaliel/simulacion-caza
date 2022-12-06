// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prey_predator_simulacion/Models/Environment.dart';
import 'package:prey_predator_simulacion/UI/Play.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  bool showIntructions = false;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [userAdjust(s), if (showIntructions) instructions(s)],
      ),
    );
  }

  Widget userAdjust(Size s) {
    return SizedBox(
      width: s.width,
      height: s.height,
      child: ListView(
        children: [
          if (!showIntructions)
            Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () => setState(() {
                          showIntructions = !showIntructions;
                        }),
                    child: const Text("Instrucciones"))),
          const Text(
            "AJUSTES DEL ENTORNO",
            style: TextStyle(
                color: Color.fromARGB(255, 110, 4, 4),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.xPlace > 1) {
                      Environment.ua.xPlace--;
                    }
                  })),
              indicator(title: "Ancho", counter: Environment.ua.xPlace),
              plusButton(() => setState(() {
                    if (Environment.ua.xPlace < 3) {
                      Environment.ua.xPlace++;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.yplaces > 1) {
                      Environment.ua.yplaces--;
                    }
                  })),
              indicator(title: "Alto", counter: Environment.ua.yplaces),
              plusButton(() => setState(() {
                    if (Environment.ua.yplaces < 6) {
                      Environment.ua.yplaces++;
                    }
                  }))
            ],
          ),
          const Text(
            "\n\nAJUSTES DE PRESAS",
            style: TextStyle(
                color: Color.fromARGB(255, 110, 4, 4),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.maxPreys >
                        (Environment.ua.minPreys + 10)) {
                      Environment.ua.maxPreys -= 10;
                    }
                  })),
              indicator(
                  title: "Max presas p/casilla",
                  counter: Environment.ua.maxPreys),
              plusButton(() => setState(() {
                    if (Environment.ua.maxPreys < 300) {
                      Environment.ua.maxPreys += 10;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.minPreys > 10) {
                      Environment.ua.minPreys -= 10;
                    }
                  })),
              indicator(
                  title: "Min presas p/casilla",
                  counter: Environment.ua.minPreys),
              plusButton(() => setState(() {
                    if (Environment.ua.minPreys <
                        Environment.ua.maxPreys - 10) {
                      Environment.ua.minPreys += 10;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.preyA.maxEnergy > 1 &&
                        Environment.ua.preyA.maxEnergy >
                            Environment.ua.preyA.minenergy + 1) {
                      Environment.ua.preyA.maxEnergy--;
                    }
                  })),
              indicator(
                  title: "Energía máxima",
                  counter: Environment.ua.preyA.maxEnergy),
              plusButton(() => setState(() {
                    if (Environment.ua.preyA.maxEnergy < 10) {
                      Environment.ua.preyA.maxEnergy++;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.preyA.minenergy > 1) {
                      Environment.ua.preyA.minenergy--;
                    }
                  })),
              indicator(
                  title: "Energía mínima",
                  counter: Environment.ua.preyA.minenergy),
              plusButton(() => setState(() {
                    if (Environment.ua.preyA.minenergy <
                        Environment.ua.preyA.maxEnergy - 1) {
                      Environment.ua.preyA.minenergy++;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.preyA.maxDefending >
                        Environment.ua.preyA.minDefending + 1) {
                      Environment.ua.preyA.maxDefending--;
                    }
                  })),
              indicator(
                  title: "Defensa máxima",
                  counter: Environment.ua.preyA.maxDefending),
              plusButton(() => setState(() {
                    if (Environment.ua.preyA.maxDefending < 10) {
                      Environment.ua.preyA.maxDefending++;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.preyA.minDefending > 1) {
                      Environment.ua.preyA.minDefending--;
                    }
                  })),
              indicator(
                  title: "Defensa mínima",
                  counter: Environment.ua.preyA.minDefending),
              plusButton(() => setState(() {
                    if (Environment.ua.preyA.minDefending <
                        Environment.ua.preyA.maxDefending - 1) {
                      Environment.ua.preyA.minDefending++;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.preyA.maxWeigth >
                        Environment.ua.preyA.minWeight + 1) {
                      Environment.ua.preyA.maxWeigth--;
                    }
                  })),
              indicator(
                  title: "Peso máximo",
                  counter: Environment.ua.preyA.maxWeigth),
              plusButton(() => setState(() {
                    if (Environment.ua.preyA.maxWeigth < 10) {
                      Environment.ua.preyA.maxWeigth++;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.preyA.minWeight > 1) {
                      Environment.ua.preyA.minWeight--;
                    }
                  })),
              indicator(
                  title: "Peso mínimo",
                  counter: Environment.ua.preyA.minWeight),
              plusButton(() => setState(() {
                    if (Environment.ua.preyA.minWeight <
                        Environment.ua.preyA.maxWeigth - 1) {
                      Environment.ua.preyA.minWeight++;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.preyA.maxOdor >
                        Environment.ua.preyA.minOdor + 1) {
                      Environment.ua.preyA.maxOdor--;
                    }
                  })),
              indicator(
                  title: "Aroma máximo", counter: Environment.ua.preyA.maxOdor),
              plusButton(() => setState(() {
                    if (Environment.ua.preyA.maxOdor < 10) {
                      Environment.ua.preyA.maxOdor++;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.preyA.minOdor > 1) {
                      Environment.ua.preyA.minOdor--;
                    }
                  })),
              indicator(
                  title: "Aroma mínimo", counter: Environment.ua.preyA.minOdor),
              plusButton(() => setState(() {
                    if (Environment.ua.preyA.minOdor <
                        Environment.ua.preyA.maxOdor - 1) {
                      Environment.ua.preyA.minOdor++;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.preyA.maxCamouflaje >
                        Environment.ua.preyA.minCamouflage + 1) {
                      Environment.ua.preyA.maxCamouflaje--;
                    }
                  })),
              indicator(
                  title: "Camuflaje máximo",
                  counter: Environment.ua.preyA.maxCamouflaje),
              plusButton(() => setState(() {
                    if (Environment.ua.preyA.maxCamouflaje < 10) {
                      Environment.ua.preyA.maxCamouflaje++;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.preyA.minCamouflage > 1) {
                      Environment.ua.preyA.minCamouflage--;
                    }
                  })),
              indicator(
                  title: "Camuflaje mínimo",
                  counter: Environment.ua.preyA.minCamouflage),
              plusButton(() => setState(() {
                    if (Environment.ua.preyA.minCamouflage <
                        Environment.ua.preyA.maxCamouflaje - 1) {
                      Environment.ua.preyA.minCamouflage++;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.preyA.reproduceRatio > 0.5) {
                      Environment.ua.preyA.reproduceRatio -= 0.5;
                    }
                  })),
              indicator(
                  title: "Reproduccion ratio",
                  counter: Environment.ua.preyA.reproduceRatio),
              plusButton(() => setState(() {
                    if (Environment.ua.preyA.reproduceRatio < 5) {
                      Environment.ua.preyA.reproduceRatio += 0.5;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.preyA.sons > 1) {
                      Environment.ua.preyA.sons--;
                    }
                  })),
              indicator(
                  title: "Camada cachorros",
                  counter: Environment.ua.preyA.sons),
              plusButton(() => setState(() {
                    if (Environment.ua.preyA.sons < 20) {
                      Environment.ua.preyA.sons++;
                    }
                  }))
            ],
          ),
          const Text(
            "\n\nAJUSTES DE DEPREDADORES",
            style: TextStyle(
                color: Color.fromARGB(255, 110, 4, 4),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.maxHunters >
                        (Environment.ua.minhunters + 10)) {
                      Environment.ua.maxHunters -= 10;
                    }
                  })),
              indicator(
                  title: "Max depredadores p/casilla",
                  counter: Environment.ua.maxHunters),
              plusButton(() => setState(() {
                    if (Environment.ua.maxHunters < 300) {
                      Environment.ua.maxHunters += 10;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.minhunters > 10) {
                      Environment.ua.minhunters -= 10;
                    }
                  })),
              indicator(
                  title: "Min depredadores p/casilla",
                  counter: Environment.ua.minhunters),
              plusButton(() => setState(() {
                    if (Environment.ua.minhunters <
                        Environment.ua.maxHunters - 10) {
                      Environment.ua.minhunters += 10;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.hunterA.maxHealth > 1 &&
                        Environment.ua.hunterA.maxHealth >
                            Environment.ua.hunterA.minHealth + 1) {
                      Environment.ua.hunterA.maxHealth--;
                    }
                  })),
              indicator(
                  title: "Energía máxima",
                  counter: Environment.ua.hunterA.maxHealth.round()),
              plusButton(() => setState(() {
                    if (Environment.ua.hunterA.maxHealth < 10) {
                      Environment.ua.hunterA.maxHealth++;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.hunterA.minHealth > 1) {
                      Environment.ua.hunterA.minHealth--;
                    }
                  })),
              indicator(
                  title: "Energía mínima",
                  counter: Environment.ua.hunterA.minHealth.round()),
              plusButton(() => setState(() {
                    if (Environment.ua.hunterA.minHealth <
                        Environment.ua.hunterA.maxHealth - 1) {
                      Environment.ua.hunterA.minHealth++;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.hunterA.maxView > 1 &&
                        Environment.ua.hunterA.maxView >
                            Environment.ua.hunterA.minView + 1) {
                      Environment.ua.hunterA.maxView--;
                    }
                  })),
              indicator(
                  title: "Visión máxima",
                  counter: Environment.ua.hunterA.maxView),
              plusButton(() => setState(() {
                    if (Environment.ua.hunterA.maxView < 10) {
                      Environment.ua.hunterA.maxView++;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.hunterA.minView > 1) {
                      Environment.ua.hunterA.minView--;
                    }
                  })),
              indicator(
                  title: "Visión mínima",
                  counter: Environment.ua.hunterA.minView),
              plusButton(() => setState(() {
                    if (Environment.ua.hunterA.minView <
                        Environment.ua.hunterA.maxView - 1) {
                      Environment.ua.hunterA.minView++;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.hunterA.maxSmell > 1 &&
                        Environment.ua.hunterA.maxSmell >
                            Environment.ua.hunterA.minSmell + 1) {
                      Environment.ua.hunterA.maxSmell--;
                    }
                  })),
              indicator(
                  title: "Olfato máximo",
                  counter: Environment.ua.hunterA.maxSmell),
              plusButton(() => setState(() {
                    if (Environment.ua.hunterA.maxSmell < 10) {
                      Environment.ua.hunterA.maxSmell++;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.hunterA.minSmell > 1) {
                      Environment.ua.hunterA.minSmell--;
                    }
                  })),
              indicator(
                  title: "Olfato mínimo",
                  counter: Environment.ua.hunterA.minSmell),
              plusButton(() => setState(() {
                    if (Environment.ua.hunterA.minSmell <
                        Environment.ua.hunterA.maxSmell - 1) {
                      Environment.ua.hunterA.minSmell++;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.hunterA.maxHearing > 1 &&
                        Environment.ua.hunterA.maxHearing >
                            Environment.ua.hunterA.minHearing + 1) {
                      Environment.ua.hunterA.maxHearing--;
                    }
                  })),
              indicator(
                  title: "Sensibildad auditiva máxima",
                  counter: Environment.ua.hunterA.maxHearing),
              plusButton(() => setState(() {
                    if (Environment.ua.hunterA.maxHearing < 10) {
                      Environment.ua.hunterA.maxHearing++;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.hunterA.minHearing > 1) {
                      Environment.ua.hunterA.minHearing--;
                    }
                  })),
              indicator(
                  title: "Sensibilidad auditiva mínima",
                  counter: Environment.ua.hunterA.minHearing),
              plusButton(() => setState(() {
                    if (Environment.ua.hunterA.minHearing <
                        Environment.ua.hunterA.maxHearing - 1) {
                      Environment.ua.hunterA.minHearing++;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.hunterA.reproduceRatio > 0.5) {
                      Environment.ua.hunterA.reproduceRatio -= 0.5;
                    }
                  })),
              indicator(
                  title: "Ratio de reproducción",
                  counter: Environment.ua.hunterA.reproduceRatio),
              plusButton(() => setState(() {
                    if (Environment.ua.hunterA.reproduceRatio < 10) {
                      Environment.ua.hunterA.reproduceRatio += 0.5;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.hunterA.energyIteration > 0.05) {
                      Environment.ua.hunterA.energyIteration -= 0.05;
                    }
                  })),
              indicator(
                  title: "% Perdida energia",
                  counter: Environment.ua.hunterA.energyIteration
                      .toStringAsFixed(2)),
              plusButton(() => setState(() {
                    if (Environment.ua.hunterA.energyIteration < 0.95) {
                      Environment.ua.hunterA.energyIteration += 0.05;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.hunterA.reproductionAdd > 0.2) {
                      Environment.ua.hunterA.reproductionAdd -= 0.2;
                    }
                  })),
              indicator(
                  title: "Agregado a reproducción",
                  counter: Environment.ua.hunterA.reproductionAdd
                      .toStringAsFixed(2)),
              plusButton(() => setState(() {
                    if (Environment.ua.hunterA.reproductionAdd < 5) {
                      Environment.ua.hunterA.reproductionAdd += 0.2;
                    }
                  }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lessButton(() => setState(() {
                    if (Environment.ua.hunterA.maxChild > 1) {
                      Environment.ua.hunterA.maxChild--;
                    }
                  })),
              indicator(
                  title: "Máximo de crias",
                  counter: Environment.ua.hunterA.maxChild),
              plusButton(() => setState(() {
                    if (Environment.ua.hunterA.maxChild < 15) {
                      Environment.ua.hunterA.maxChild++;
                    }
                  }))
            ],
          ),
          Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Play())),
                  child: const Text("Iniciar simulación")))
        ],
      ),
    );
  }

  Widget indicator({required String title, required var counter}) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text.rich(
        TextSpan(
            text: title,
            style: TextStyle(
                color: Colors.blue[800],
                fontWeight: FontWeight.w400,
                fontSize: 16),
            children: [
              TextSpan(
                text: "\n$counter",
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ]),
        textAlign: TextAlign.center,
      ),
    );
  }

  ButtonStyle styleButton() {
    return ElevatedButton.styleFrom(
        primary: Colors.amber, shape: const StadiumBorder());
  }

  Text lessText() {
    return const Text(
      "-",
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
      textAlign: TextAlign.center,
    );
  }

  Text plusText() {
    return const Text(
      "+",
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      textAlign: TextAlign.center,
    );
  }

  Widget plusButton(Function f) {
    return ElevatedButton(
        style: styleButton(), onPressed: () => f(), child: plusText());
  }

  Widget lessButton(Function f) {
    return ElevatedButton(
        style: styleButton(), onPressed: () => f(), child: lessText());
  }

  Widget instructions(Size s) {
    return Center(
      child: Container(
        width: s.width * .98,
        height: s.height * .85,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.95),
            border: Border.all(width: 5.0),
            borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          // padding: const EdgeInsets.all(16.0),
          padding: EdgeInsets.fromLTRB(
              s.width * .05, s.height * .015, s.width * .05, s.height * .015),
          child: ListView(
            children: [
              Text(
                "Bienvenido a \n SUPERVIVENCIA DE ESPECIES",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontSize: 15, fontWeight: FontWeight.w600),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
              ),
              Text(
                "INSTRUCCIONES",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w300),
              ),
              Text(
                "1. La pantalla de inicio cuenta con una barra superior, 12 casillas y 1 botón para el aumentó de iteraciones.",
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                    fontSize: 13, fontWeight: FontWeight.w300),
              ),
              Text(
                "\n2. En la barra superior encontrarás:\n-Un indicador de iteraciones.\n-Un botón rojo para reiniciar el entorno.\n-Un botón verde que te llevará a los indicadores de los sentidos por casilla del entorno o la opción de ver todos.",
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                    fontSize: 13, fontWeight: FontWeight.w300),
              ),
              Text(
                "\n3. Cada que oprimas una casilla te llevará a otra pantalla donde conocerás los valores del entorno, número de presas y depredadores junto con las caracteristicas de cada uno.",
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                    fontSize: 13, fontWeight: FontWeight.w300),
              ),
              Text(
                "\n4. Al iniciar las casillas estrán de color azul la cual significa que estan en el sentido de la vista, para cambiarlo solo oprime el boton verde, como anteriormente se mencionó.",
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                    fontSize: 13, fontWeight: FontWeight.w300),
              ),
              Text(
                "\n5. En la parte inferior de la pantalla encontrarás el botón que aumentará las iteraciones.",
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                    fontSize: 13, fontWeight: FontWeight.w300),
              ),
              Text(
                "\n6. Ahora solo oprime COMENZAR!",
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                    fontSize: 13, fontWeight: FontWeight.w300),
              ),
              Container(
                height: s.height * 0.050,
                margin: const EdgeInsets.fromLTRB(60, 15, 60, 10),
                child: FlatButton(
                  onPressed: () {
                    showIntructions = !showIntructions;
                    setState(() {});
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Play()));*/
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  color: Colors.purple[50],
                  child: Text(
                    'Aceptar',
                    style: GoogleFonts.poppins(
                        color: Colors.purple,
                        fontSize: 15,
                        fontWeight: FontWeight.w200),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

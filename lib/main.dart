import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          width: s.width * 0.8,
          height: s.height * 0.72,
          decoration: BoxDecoration(
              border: Border.all(width: 5.0),
              borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            // padding: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.fromLTRB(16, 2, 16, 16),
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
                  margin: EdgeInsets.fromLTRB(60, 15, 60, 10),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Play()));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    color: Colors.purple[50],
                    child: Text(
                      'Comenzar',
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
      ),
    );
  }
}

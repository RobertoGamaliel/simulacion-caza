import 'package:flutter/material.dart';

class Dialogs {
  static Future<double> fraction(
      BuildContext context, String name, String units) async {
    Size s = MediaQuery.of(context).size;
    FocusNode myFocusNode = FocusNode();
    myFocusNode.requestFocus();
    double number = 0;
    double? numbGiven = await showDialog<double>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        scrollable: true,
        title: const Text("Cantidad necesaria", textAlign: TextAlign.center),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: s.width * 0.80,
                child: TextFormField(
                  focusNode: myFocusNode,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '$units de $name',
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  onChanged: (value) {
                    try {
                      number = double.parse(value);
                    } catch (e) {
                      number = 0;
                    }
                  },
                )),
          ],
        ),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                shadowColor: Colors.black,
                primary: Colors.black,
                elevation: 3,
              ),
              onPressed: () {
                Navigator.pop(context, number);
              },
              child: const Text('Agregar'))
        ],
      ),
    );
    if (numbGiven == null) {
      return 0;
    } else {
      return numbGiven;
    }
  }

  void ocultarTeclado(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    return;
  }

  static Future<void> simpleAlertDialog(
      String title, String content, BuildContext context) async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        contentPadding: const EdgeInsets.all(20),
        actionsPadding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(color: Colors.black, width: 5)),
        scrollable: true,
        title: Text(title, textAlign: TextAlign.center),
        content: Text(
          content,
          textAlign: TextAlign.justify,
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
              child: const Text(
                'DE ACUERDO',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }

  static Future<bool> boolAnswerDialog(
      String title, String contend, BuildContext context) async {
    bool _respuesta = false;

    await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        contentPadding: const EdgeInsets.all(20),
        actionsPadding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(color: Colors.black, width: 5)),
        scrollable: true,
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        content: Text(contend,
            textAlign: TextAlign.justify, style: const TextStyle(fontSize: 14)),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                shadowColor: Colors.black,
                primary: Colors.black,
                elevation: 3,
              ),
              onPressed: () {
                _respuesta = true;
                Navigator.pop(context, true);
              },
              child: const Text(
                'Si',
                style: TextStyle(color: Colors.white),
              )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                shadowColor: Colors.black,
                primary: Colors.black,
                elevation: 3,
              ),
              onPressed: () {
                _respuesta = false;
                Navigator.pop(context, false);
              },
              child: const Text(
                'No',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
    return _respuesta;
  }

  static Future<void> noInternetDialog(BuildContext context) async {
    var s = MediaQuery.of(context).size;
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        contentPadding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(
                color: Color.fromARGB(255, 202, 0, 0), width: 5)),
        scrollable: true,
        title: const Text("SIN INTERNET",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 90, 0, 0)),
            textAlign: TextAlign.center),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/noWifi.png",
              width: s.width * .25,
            ),
            const Text("Por favor conectese a internet y vuelva a intentarlo.",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center)
          ],
        ),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                shadowColor: Colors.black,
                primary: Colors.black,
                elevation: 3,
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
              child: const Text(
                'DE ACUERDO',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}

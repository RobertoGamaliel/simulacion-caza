import 'dart:math';

//Estas variables son globales y creo que estan bien porque de esta manera
//Podemos manipularlas facilmente
List<Prey> listaPresas = [];
int nPresas = 7;
int nPresasTemp = 0;

//Clase presa
class Prey {
  int odor = Random().nextInt(10) + 1;
  int camouflage = Random().nextInt(10) + 1;
  int noise = Random().nextInt(10) + 1;
  int energy = Random().nextInt(10) + 1;
  int weight = Random().nextInt(10) + 1;
  bool sex;
  bool normal =
      true; //Verdadero si ha parido crias en las ultimas 3 iteraciones
  int giveBirth = 0; //iteraciones desde la ultima vez que parió
  int x = 1, y = 1;
  double reproduce = 0;
  int defending = Random().nextInt(10) + 1;

  Prey({required this.x, required this.y, required this.sex});

  void imprime() {
    print('odor $odor');
    print('camouflage $camouflage');
    print('noise $noise');
    print('energy $energy');
    print('weight $weight');
  }

  //Funcion para reproducir las presas e insertarlas a la lista principal de presas en la simulacion
  void reproductionB() {
    if (energy >= 6) {
      listaPresas.insert(0, Prey(x: x, y: y, sex: Random().nextBool()));
      nPresasTemp = nPresasTemp + 1;
    }
  }

  //Propuesta para funcion de presa, recibe el argumento si hay algún macho en la casilla
  List<Prey> reproduceFunction(bool hasMalePrey) {
    //Si la presa es macho no hay nada que alterar
    if (!sex) return [];

    List<Prey> newsChilds = [];
    //Aumentamos su capacidad de reproduccion
    reproduce += 4 / weight;

    //Si esta en estado normal o si tiene mas de 2 iteraciones desde la uútima vez que parió
    if (normal || giveBirth > 2) {
      if (!normal) {
        //Si está en estado no normal, bajamos la defensa
        defending = (defending / 3 * 2).ceil();
      }
      normal = true;
      giveBirth = 0; //Reseteamos los dias desde que parió

      //Si ha alcanzado una capacidad de reproduccion buena, hay al menos un macho en el área
      if (reproduce >= 2 && hasMalePrey) {
        reproduce -= 2;
        normal = false; //Pasamos a modo agresivo pues tendrá crias
        defending = (defending * 1.5).ceil(); //Aumentamos su agresividad un 50%
        int sons = (8 / weight)
            .ceil(); //Cantidad de presas qu tendrá de acuerdo a su peso
        for (var i = 0; i < sons; i++) {
          //Agregamos hijos a la lista de nuevas crias
          newsChilds.add(Prey(x: x, y: y, sex: Random().nextBool()));
        }
      }
    }

    //retornamos los nuevos hijos que tenga la presa
    return newsChilds;
  }
}

void generaPresas(int maxX, int maxY) {
  for (int i = 0; i < nPresas; i++) {
    listaPresas.insert(
        0,
        Prey(
            x: Random().nextInt(maxX),
            y: Random().nextInt(maxY),
            sex: Random().nextBool()));
  }
  print('weight $listaPresas');
}

//Esta funcion representa el while principal
void mecanismoPrincipal(int maxX, int maxY) {
  generaPresas(maxX, maxY);
  //Dentro del ciclo while se tendra que verificar si alguna de las presas esta lista para reproducirse
  for (int i = 0; i < nPresas; i++) {
    listaPresas[i].reproductionB();
  }
  nPresas = nPresasTemp = 0;
  ;
  nPresasTemp = 0;
  print('Caca $listaPresas');
  //Se hace esto para que no se haga infinito el loop al revisar la lista de presas
}

void main() {
  mecanismoPrincipal(20, 30);
}

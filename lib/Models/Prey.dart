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
  int x = 1, y = 1;

  Prey() {
    this.odor = odor;
    this.camouflage = camouflage;
    this.noise = noise;
    this.energy = energy;
    this.weight = weight;
    this.x = x;
    this.y = y;
  }

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
      listaPresas.insert(0, Prey());
      nPresasTemp = nPresasTemp + 1;
    }
  }
}

void generaPresas() {
  for (int i = 0; i < nPresas; i++) {
    listaPresas.insert(0, Prey());
  }
  print('weight $listaPresas');
}

//Esta funcion representa el while principal
void mecanismoPrincipal() {
  generaPresas();
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
  mecanismoPrincipal();
}

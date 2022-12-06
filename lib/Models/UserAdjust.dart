class UserAdjust {
  UserAdjust();
  PreyAdjust preyA = PreyAdjust();
  HunterAdjust hunterA = HunterAdjust();
  int maxHunters = 40, minhunters = 10, maxPreys = 200, minPreys = 50;

  int yplaces = 3, xPlace = 4;
}

class PreyAdjust {
  PreyAdjust();
  int maxOdor = 10,
      minOdor = 1,
      maxCamouflaje = 10,
      minCamouflage = 1,
      maxNoise = 10,
      minNoise = 1,
      maxEnergy = 10,
      minenergy = 1,
      maxWeigth = 10,
      minWeight = 1,
      minDefending = 1,
      maxDefending = 10,
      sons = 8;
  double reproduceRatio = 3;
}

class HunterAdjust {
  HunterAdjust();
  double minHealth = 0,
      maxHealth = 0,
      minWeigth = 1,
      maxWeigth = 10,
      reproduceRatio = 3,
      energyIteration = 0.25;

  int minSmell = 1,
      maxSmell = 10,
      minView = 1,
      maxView = 10,
      minHearing = 1,
      maxHearing = 10;
}

class PlaceAdjust {
  PlaceAdjust();
  int minView = 1,
      maxView = 11,
      minOdor = 1,
      maxOdor = 10,
      minNoise = 1,
      maxNoise = 10,
      minPreys = 50,
      maxPreys = 300,
      minHunters = 10,
      maxHunters = 40;
}

/*
int odor;
  int view;
  int noise;
  List<Prey> preys = [];
  List<Predator> predators = [];
   */
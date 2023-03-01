import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class Data extends ChangeNotifier {
  List<Map<String, String>> currentDeck = [];
  List<Map<String, String>> hard = [];
  List<Map<String, String>> medium = [];
  List<Map<String, String>> easy = [];
  List<Map<String, String>> effortless = [];

  Random random = Random();
  int index = 0;
  void GenerateNumber() {
    if (currentDeck.length == 0) {
      sortCurrentDeck();
      index = 0;
    } else {
      index = random.nextInt(currentDeck.length);

      // Timer.periodic(Duration(seconds: 10), (Timer t) {
      //   index = Random().nextInt(hard.length);
      //   print('executed 1min');
      //   notifyListeners();
      // });
      // Timer.periodic(Duration(minutes: 6), (Timer t) {
      //   index = Random().nextInt(hard.length) + medium.length;
      //   print('executed 6min');
      //   notifyListeners();
      // });
      // Timer.periodic(Duration(minutes: 10), (Timer t) {
      //   index = Random().nextInt(hard.length + medium.length) + easy.length;
      //   print('executed 10min');
      //   notifyListeners();
      // });
      // Timer.periodic(Duration(minutes: 20), (Timer t) {
      //   index = Random().nextInt(hard.length + medium.length + easy.length) +
      //       effortless.length;
      //   print('executed 20min');
      //   notifyListeners();
      // });
    }
    notifyListeners();
  }

  void addNewWord(String recto, String verso) {
    currentDeck.add({'Recto': recto, 'Verso': verso});

    notifyListeners();
  }

  void sortCurrentDeck() {
    int i = 0;

    while (i < hard.length + medium.length + easy.length + effortless.length) {
      if (i < hard.length) {
        for (int j = 0; j < hard.length; j++) {
          currentDeck.add(hard[i]);
          i++;
        }
      } else {
        if (i == hard.length && medium.length > 0) {
          for (int j = 0; j < medium.length; j++) {
            currentDeck.add(medium[j]);
            i++;
          }
        } else {
          if ((i == (hard.length + medium.length)) && (easy.length > 0)) {
            for (int j = 0; j < easy.length; j++) {
              currentDeck.add(easy[j]);
              i++;
            }
          } else {
            if ((i == (hard.length + medium.length + easy.length)) &&
                (effortless.length > 0)) {
              for (int j = 0; j < effortless.length; j++) {
                currentDeck.add(effortless[j]);
                i++;
              }
            }
          }
        }
      }
      // if (hard.length != 0) {
      //   hard.removeRange(0, hard.length - 1);
      // }
      // if (medium.length != 0) {
      //   medium.removeRange(0, medium.length - 1);
      // }
      // if (easy.length != 0) {
      //   easy.removeRange(0, easy.length - 1);
      // }
      // if (effortless.length != 0) {
      //   effortless.removeRange(0, effortless.length - 1);
      // }
    }
  }

  void addHardWord() {
    for (int i = 0; i < hard.length; i++) {
      if (currentDeck[index]['Recto'] == hard[i]['Recto']) {
        return null;
      }
    }

    hard.add(currentDeck[index]);
    if (easy.contains(currentDeck[index]['Recto'])) {
      easy.remove(currentDeck[index]);
    }
    if (medium.contains(currentDeck[index]['Recto'])) {
      medium.remove(currentDeck[index]);
    }
    if (effortless.contains(currentDeck[index]['Recto'])) {
      effortless.remove(currentDeck[index]);
    }

    currentDeck.removeAt(index);

    print(hard);
    print(currentDeck);

    notifyListeners();
  }

  void addMediumWord() {
    for (int i = 0; i < medium.length; i++) {
      if (currentDeck[index]['Recto'] == medium[i]['Recto']) {
        return null;
      }
    }
    medium.add(currentDeck[index]);

    if (easy.contains(currentDeck[index]['Recto'])) {
      easy.remove(currentDeck[index]);
    }
    if (hard.contains(currentDeck[index]['Recto'])) {
      hard.remove(currentDeck[index]);
    }
    if (effortless.contains(currentDeck[index]['Recto'])) {
      effortless.remove(currentDeck[index]);
    }

    currentDeck.removeAt(index);

    print(medium);
    print(currentDeck);
    notifyListeners();
  }

  void addEasyWord() {
    for (int i = 0; i < easy.length; i++) {
      if (currentDeck[index]['Recto'] == easy[i]['Recto']) {
        return null;
      }
    }
    easy.add(currentDeck[index]);

    if (medium.contains(currentDeck[index]['Recto'])) {
      medium.remove(currentDeck[index]);
    }
    if (hard.contains(currentDeck[index]['Recto'])) {
      hard.remove(currentDeck[index]);
    }
    if (effortless.contains(currentDeck[index]['Recto'])) {
      effortless.remove(currentDeck[index]);
    }

    currentDeck.removeAt(index);
    print(easy);
    print(currentDeck);

    notifyListeners();
  }

  void addEffortlessWord() {
    for (int i = 0; i < effortless.length; i++) {
      if (currentDeck[index]['Recto'] == effortless[i]['Recto']) {
        return null;
      }
    }
    effortless.add(currentDeck[index]);

    if (easy.contains(currentDeck[index]['Recto'])) {
      easy.remove(currentDeck[index]);
    }
    if (hard.contains(currentDeck[index]['Recto'])) {
      hard.remove(currentDeck[index]);
    }
    if (medium.contains(currentDeck[index]['Recto'])) {
      effortless.remove(currentDeck[index]);
    }

    currentDeck.removeAt(index);

    print(effortless);
    print(currentDeck);

    notifyListeners();
  }
}

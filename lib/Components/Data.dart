import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class Data extends ChangeNotifier {
  List<Map<String, dynamic>> currentDeck = [];
  int hardWords = 0;
  int mediumWords = 0;
  int easyWords = 0;
  int effortlessWords = 0;

  Random random = Random();
  int index = 0;
  int numberOfElements = 0;
  void GenerateNumber() {
    sortCurrentDeck();
    // if (currentDeck.length == 0) {
    index = random.nextInt(currentDeck.length);
    // }
    // else {
    //   Timer.periodic(Duration(seconds: 5), (Timer t) {
    //     index = Random().nextInt(hardWords);
    //     print('executed 1min');
    //     notifyListeners();
    //   });
    //   Timer.periodic(Duration(minutes: 6), (Timer t) {
    //     index = Random().nextInt(hardWords) + mediumWords;
    //     print('executed 6min');
    //     notifyListeners();
    //   });
    //   Timer.periodic(Duration(minutes: 10), (Timer t) {
    //     index = Random().nextInt(hardWords + mediumWords) + easyWords;
    //     print('executed 10min');
    //     notifyListeners();
    //   });
    //   Timer.periodic(Duration(minutes: 20), (Timer t) {
    //     index = Random().nextInt(hardWords + mediumWords + easyWords) +
    //         effortlessWords;
    //     print('executed 20min');
    //     notifyListeners();
    //   });
    // }

    notifyListeners();
  }

  void addNewWord(String recto, String verso, int priority) {
    currentDeck.add({'Recto': recto, 'Verso': verso, 'Priority': priority});

    notifyListeners();
  }

  void sortCurrentDeck() {
    var temp;
    for (int i = 0; i < currentDeck.length; i++) {
      for (int j = i + 1; j < currentDeck.length; j++) {
        if (currentDeck[i]['Priority'] < currentDeck[j]['Priority']) {
          temp = currentDeck[i];
          currentDeck[i] = currentDeck[j];
          currentDeck[j] = temp;
        }
      }
    }

    notifyListeners();
  }

  void addHardWord() {
    currentDeck[index]['Priority'] = 4;
    print(currentDeck);
    hardWords++;

    notifyListeners();
  }

  void addMediumWord() {
    currentDeck[index]['Priority'] = 3;
    print(currentDeck);
    mediumWords++;
    notifyListeners();
  }

  void addEasyWord() {
    currentDeck[index]['Priority'] = 2;
    print(currentDeck);
    easyWords++;
    notifyListeners();
  }

  void addEffortlessWord() {
    currentDeck[index]['Priority'] = 1;
    print(currentDeck);
    effortlessWords++;
    notifyListeners();
  }

  // void addMediumWord() {
  //   for (int i = 0; i < medium.length; i++) {
  //     if (currentDeck[index]['Recto'] == medium[i]['Recto']) {
  //       return null;
  //     }
  //   }
  //   medium.add(currentDeck[index]);

  //   if (easy.contains(currentDeck[index]['Recto'])) {
  //     easy.remove(currentDeck[index]);
  //   }
  //   if (hard.contains(currentDeck[index]['Recto'])) {
  //     hard.remove(currentDeck[index]);
  //   }
  //   if (effortless.contains(currentDeck[index]['Recto'])) {
  //     effortless.remove(currentDeck[index]);
  //   }

  //   currentDeck.removeAt(index);

  //   print(medium);
  //   print(currentDeck);
  //   notifyListeners();
  // }

  // void addEasyWord() {
  //   for (int i = 0; i < easy.length; i++) {
  //     if (currentDeck[index]['Recto'] == easy[i]['Recto']) {
  //       return null;
  //     }
  //   }
  //   easy.add(currentDeck[index]);

  //   if (medium.contains(currentDeck[index]['Recto'])) {
  //     medium.remove(currentDeck[index]);
  //   }
  //   if (hard.contains(currentDeck[index]['Recto'])) {
  //     hard.remove(currentDeck[index]);
  //   }
  //   if (effortless.contains(currentDeck[index]['Recto'])) {
  //     effortless.remove(currentDeck[index]);
  //   }

  //   currentDeck.removeAt(index);
  //   print(easy);
  //   print(currentDeck);

  //   notifyListeners();
  // }

  // void addEffortlessWord() {
  //   for (int i = 0; i < effortless.length; i++) {
  //     if (currentDeck[index]['Recto'] == effortless[i]['Recto']) {
  //       effortless.removeAt(i);
  //       return;
  //     }
  //   }

  //   effortless.add(currentDeck[index]);
  //   if (easy.contains(currentDeck[index]['Recto'])) {
  //     easy.remove(currentDeck[index]);
  //   }
  //   if (hard.contains(currentDeck[index]['Recto'])) {
  //     hard.remove(currentDeck[index]);
  //   }
  //   if (medium.contains(currentDeck[index]['Recto'])) {
  //     effortless.remove(currentDeck[index]);
  //   }

  //   currentDeck.removeAt(index);

  //   print(effortless);
  //   print(currentDeck);

  //   notifyListeners();
  // }
}

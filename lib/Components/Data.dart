import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

class Data extends ChangeNotifier {
  List<Map<String, dynamic>> currentDeck = [];
  int hardWords = 0;
  int mediumWords = 0;
  int easyWords = 0;
  int effortlessWords = 0;

  Random random = Random();
  int index = 0;
  int numberOfElements = 1;
  void GenerateNumber() {
    sortCurrentDeck();
    print(numberOfElements);

    if (numberOfElements % 12 == 0 && effortlessWords != 0) {
      index = random.nextInt(currentDeck.length -
              (hardWords + mediumWords + easyWords) -
              (currentDeck.length -
                  (hardWords + mediumWords + easyWords) -
                  effortlessWords)) +
          hardWords +
          mediumWords +
          easyWords;
      print(
          'end :${currentDeck.length - (hardWords + mediumWords + easyWords) - (currentDeck.length - (hardWords + mediumWords + easyWords) - effortlessWords)}');
      print('start :${hardWords + mediumWords + easyWords}');
      print('1st phase $index');
    } else {
      if (numberOfElements % 8 == 0 && easyWords != 0) {
        index = random.nextInt(currentDeck.length -
                effortlessWords -
                (currentDeck.length - effortlessWords - easyWords)) +
            hardWords +
            mediumWords;
        print(
            'end :${currentDeck.length - effortlessWords - (currentDeck.length - effortlessWords - easyWords)}');
        print('start : ${hardWords + mediumWords}');
        print('2nd phase $index');
      } else {
        if (numberOfElements % 4 == 0 && mediumWords != 0) {
          index = random.nextInt(currentDeck.length -
                  (easyWords + effortlessWords) -
                  (currentDeck.length -
                      (easyWords + effortlessWords) -
                      mediumWords)) +
              hardWords;
          print(
              'end :${currentDeck.length - (easyWords + effortlessWords) - (currentDeck.length - (easyWords + effortlessWords) - mediumWords)}');
          print('start :$hardWords');
          print('3rd phase $index');
        } else {
          index = random.nextInt(currentDeck.length);
          print('4th phase $index');
        }
      }
    }

    numberOfElements++;

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
    int comp = 0;
    currentDeck[index]['Priority'] = 4;
    hardWords++;
    for (int i = 0; i < currentDeck.length; i++) {
      if (currentDeck[i] == (currentDeck[index])) {
        if (currentDeck[index]['Priority'] == 1) {
          effortlessWords--;
          print('removed from eff');
        } else {
          if (currentDeck[index]['Priority'] == 3) {
            mediumWords--;
            print('removed from med');
          } else {
            if (currentDeck[index]['Priority'] == 2) {
              easyWords--;
              print('removed from easy');
            } else {
              if (currentDeck[i] == currentDeck[index]) {
                comp++;
              }

              if (comp > 1) {
                hardWords--;
                print('duplicate');
              }
            }
          }
        }
      }
    }
    print('hardwords :$hardWords');

    notifyListeners();
  }

  void addMediumWord() {
    int comp = 0;
    currentDeck[index]['Priority'] = 3;
    print(currentDeck);
    mediumWords++;
    for (int i = 0; i < currentDeck.length; i++) {
      if (currentDeck[i] == (currentDeck[index])) {
        if (currentDeck[index]['Priority'] == 4) {
          hardWords--;
          print('removed from hard');
        } else {
          if (currentDeck[index]['Priority'] == 1) {
            effortlessWords--;
            print('removed from eff');
          } else {
            if (currentDeck[index]['Priority'] == 2) {
              easyWords--;
              print('removed from easy');
            } else {
              if (currentDeck[i] == currentDeck[index]) {
                comp++;
              }

              if (comp > 1) {
                mediumWords--;
                print('duplicate');
              }
            }
          }
        }
      }
    }

    print('mediumWords :$mediumWords');
    notifyListeners();
  }

  void addEasyWord() {
    int comp = 0;
    currentDeck[index]['Priority'] = 2;
    print(currentDeck);
    easyWords++;
    for (int i = 0; i < currentDeck.length; i++) {
      if (currentDeck[i] == (currentDeck[index])) {
        if (currentDeck[index]['Priority'] == 4) {
          hardWords--;
          print('removed from hard');
        } else {
          if (currentDeck[index]['Priority'] == 3) {
            mediumWords--;
            print('removed from med');
          } else {
            if (currentDeck[index]['Priority'] == 1) {
              effortlessWords--;
              print('removed from eff');
            } else {
              if (currentDeck[i] == currentDeck[index]) {
                comp++;
              }
              if (comp > 1) {
                easyWords--;
                print('duplicate');
              }
            }
          }
        }
      }
    }

    print('easyWords :$easyWords');
    notifyListeners();
  }

  void addEffortlessWord() {
    int comp = 0;
    currentDeck[index]['Priority'] = 1;
    print(currentDeck);
    effortlessWords++;
    for (int i = 0; i < currentDeck.length; i++) {
      if (currentDeck[i] == (currentDeck[index])) {
        if (currentDeck[index]['Priority'] == 4) {
          hardWords--;
          print('removed from hard');
        } else {
          if (currentDeck[index]['Priority'] == 3) {
            mediumWords--;
            print('removed from med');
          } else {
            if (currentDeck[index]['Priority'] == 2) {
              easyWords--;
              print('removed from easy');
            } else {
              if (currentDeck[i] == currentDeck[index]) {
                comp++;
              }

              if (comp > 1) {
                effortlessWords--;
                print('duplicate');
              }
            }
          }
        }
      }
    }

    print('effortlessWords :$effortlessWords');
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

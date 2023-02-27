import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  List<Map<String, String>> theWord = [];

  void addNewWord(String recto, String verso) {
    theWord.add({'Recto': recto, 'Verso': verso});
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  int c = 0;
  String ct = 'a';
  String aText = 'こんにちは';
  int tuhen = 0;

  void inc() {
    c++;
    ct = c.toString();

    notifyListeners();
  }

  void changeAText() {
    tuhen = (tuhen + 1) % 10;

    if (aText == 'こんにちは') {
      aText = 'こんばんは';
    } else {
      aText = 'こんにちは';
    }
    // aText = 'こんばんは';
    notifyListeners();
  }
}

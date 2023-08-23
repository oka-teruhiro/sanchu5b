import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  int c = 0;
  String ct = 'a';

  void inc() {
    c++;
    ct = c.toString();

    notifyListeners();
  }
}

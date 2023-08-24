import 'package:flutter/material.dart';

import 'kansuu.dart';

class MainModel extends ChangeNotifier {
  int c = 0;
  String ct = 'a';
  String aText = 'こんにちは';
  int tuhen = 0;
  DateTime now = DateTime.now(); // 今日の日付
  DateTime now1 = DateTime(2023, 8, 14); // 鑑定年月日
  int nowNen = 2023;
  int nowGatu = 8;
  int nowNiti = 15;
  String nowMoji = '2023.8.14';
  int nowNitiKan = 0;
  int nowNitiSi = 0;
  String nowTuhen = '比肩'; // 鑑定日の通変星
  int seinenInt = 1957;
  int seigatuInt = 3;
  int seinitiInt = 31;

  void inc() {
    //c++;
    //ct = c.toString();
    now1 = now1.add(const Duration(days: 1));
    nowNen = now1.year; // 鑑定年
    nowGatu = now1.month; // 鑑定月
    nowNiti = now1.day; // 鑑定日
    ct = nowNiti.toString();
    //鑑定日の日干・日支を算出する
    nowNitiKan = juKanNo(meisikiA(nowNen, nowGatu, nowNiti).substring(4, 5));
    nowNitiSi = juuniSiNo(meisikiA(nowNen, nowGatu, nowNiti).substring(5, 6));
    nowMoji = '$nowNen.$nowGatu.$nowNiti'; // 鑑定年月日の表示文字を作成
    print('今日の日干：$nowNitiKan・日支：$nowNitiSi');
    print('$seinenInt.$seigatuInt.$seinitiInt生');
    // 鑑定日の通変星を算出する
    nowTuhen =
        tuuhenbosi(seinenInt, seigatuInt, seinitiInt, nowNen, nowGatu, nowNiti);
    tuhen = tuuhenbosiNo(nowTuhen);
    print('鑑定日の通変星：$nowTuhen・$tuhen');

    notifyListeners();
  }

  void init() {
    //c++;
    //ct = c.toString();
    now1 = now;
    nowNen = now1.year; // 鑑定年
    nowGatu = now1.month; // 鑑定月
    nowNiti = now1.day; // 鑑定日
    ct = nowNiti.toString();
    //鑑定日の日干・日支を算出する
    nowNitiKan = juKanNo(meisikiA(nowNen, nowGatu, nowNiti).substring(4, 5));
    nowNitiSi = juuniSiNo(meisikiA(nowNen, nowGatu, nowNiti).substring(5, 6));
    nowMoji = '$nowNen.$nowGatu.$nowNiti'; // 鑑定年月日の表示文字を作成
    print('今日の日干：$nowNitiKan・日支：$nowNitiSi');
    print('$seinenInt.$seigatuInt.$seinitiInt生');
    // 鑑定日の通変星を算出する
    nowTuhen =
        tuuhenbosi(seinenInt, seigatuInt, seinitiInt, nowNen, nowGatu, nowNiti);
    tuhen = tuuhenbosiNo(nowTuhen);
    print('鑑定日の通変星：$nowTuhen・$tuhen');

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

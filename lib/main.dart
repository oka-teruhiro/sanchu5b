import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanchu5b/main_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '天運三柱推命',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: '天運三柱推命ver.5.0.8'),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    double h1 = 25;
    int c2 = -1; // 白
    int c3 = -1407770; // ピンク
    int gogyou = 4;

    return ChangeNotifierProvider<MainModel>(
      create: (_) => MainModel()..init(),
      child: Consumer<MainModel>(builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            backgroundColor: Colors.white10,

            title: Text(
              title,
              style: const TextStyle(
                color: Colors.pinkAccent,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: [
                    SizedBox(
                      width: 312,
                      height: 312,
                      child: CustomPaint(
                        painter: ShapePainter3(), // 日干と日支の固定円の描画
                      ),
                    ),
                    SizedBox(
                      width: 312,
                      height: 312,
                      child: CustomPaint(
                        painter: ShapePainter5(
                          tuhen: model.tuhen,
                          gogyou: gogyou,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 97,
                  child: Container(
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 104,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                model.nowMoji,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                ),
                              ),
                              const Text(
                                'の運勢',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                              const Text(
                                '大吉',
                                style: TextStyle(
                                  color: Colors.purpleAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 15,
                                child: Text(
                                  '年',
                                  style: TextStyle(
                                    color: Color(c3),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                height: h1,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    //yearDown();
                                    model.dec365();
                                  },
                                  child: Text(
                                    'ー',
                                    style: TextStyle(
                                      color: Color(c2),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                height: h1,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    elevation: 16,
                                  ),
                                  onPressed: () {
                                    //yearUp();
                                    model.inc365();
                                  },
                                  child: Text(
                                    '＋',
                                    style: TextStyle(
                                      color: Color(c2),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 15,
                                child: Text(
                                  '月',
                                  style: TextStyle(
                                    color: Color(c3),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                height: h1,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    //monthDown();
                                    model.dec30();
                                  },
                                  child: Text(
                                    'ー',
                                    style: TextStyle(
                                      color: Color(c2),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                height: h1,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    elevation: 16,
                                  ),
                                  onPressed: () {
                                    //monthUp();
                                    model.inc30();
                                  },
                                  child: Text(
                                    '＋',
                                    style: TextStyle(
                                      color: Color(c2),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 15,
                                child: Text(
                                  '日',
                                  style: TextStyle(
                                    color: Color(c3),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                height: h1,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    //dateDown();
                                    model.dec();
                                  },
                                  child: Text(
                                    'ー',
                                    style: TextStyle(
                                      color: Color(c2),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                height: h1,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    //dateUp();
                                    model.inc();
                                  },
                                  child: Text(
                                    '＋',
                                    style: TextStyle(
                                      color: Color(c2),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: h1 * 3,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    //dateUp();
                                  },
                                  child: Text(
                                    '戻る',
                                    style: TextStyle(
                                      color: Color(c2),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //model.inc();
              model.inc();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      }),
    );
  }
}

class ShapePainter5 extends CustomPainter {
  int gogyou; // 五行　0:木 1:火 2:土 3:金 4:水  // ■■■■■■受け取る値を代入する変数を定義
  //int nitiSi = 0;
  int tuhen; // 日し
  ShapePainter5({
    required this.tuhen,
    required this.gogyou,
  }); // ■■■■■■■■■受け取る値を上記変数に代入
  @override
  void paint(Canvas canvas, Size size) {
    var center1 = const Offset(150, 130); // 表面の中心座標
    var center2 = const Offset(150, 370); // 本質の中心座標

    //print('tuhen:$tuhen');

    double rr1 = 18;
    double r1 = 36;
    double r2 = 72;
    double rt;
    double gogyo2;
    int gogyo1;

    final penPink2 = Paint()
      ..color = Colors.purple
      ..strokeWidth = 2.0;
    final penPink1 = Paint()
      ..color = Colors.pink
      ..strokeWidth = 2.0;

    final penPink = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 2.0;
    final penPink3 = Paint()
      ..color = Colors.purple[300]!
      ..strokeWidth = 2.0;

    gogyo1 = tuhen % 2;
    if (gogyo1 == 0) {
      rt = r2;
      gogyo2 = tuhen / 2;
    } else {
      rt = r1;
      gogyo2 = (tuhen - 1) / 2;
    }

    double radianTu = (72 * (gogyo2 + gogyou) - 90) / 180 * pi;
    final centerTu = center1 + Offset(rt * cos(radianTu), rt * sin(radianTu));

    canvas.drawCircle(centerTu, rr1 + 8, penPink2..style = PaintingStyle.fill);
    canvas.drawCircle(centerTu, rr1 + 4, penPink1..style = PaintingStyle.fill);
    canvas.drawCircle(centerTu, rr1 - 0, penPink..style = PaintingStyle.fill);
    //canvas.drawCircle(centerTu, rr1 - 4, penPink3..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ShapePainter3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center1 = const Offset(150, 130); // 表面の中心座標
    var center2 = const Offset(150, 384); // 本質の中心座標
    double r1 = 36; // 日干の１階の円の中心の半径
    double r2 = 72; // 日干の２階の円の中心の半径
    double r3 = 108; // 日干の３階の円の中心の半径
    double r4 = 112; // 日支の３階の円の中心の半径
    double r5 = 74; // 日支の２階の円の中心の半径
    double r6 = 36; // 日支の１階の円の中心の半径
    double rr1 = 18; // 小さい円の半径
    double rr2 = 90; // 日干の大きい円の半径
    double rr3 = 93; // 日支の大きな円の半径

    final penWhite = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0;

    final penWhite1 = Paint()
      ..color = Colors.white
      ..strokeWidth = 0.7;

    final penBlue = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0;

    final penRed = Paint()
      ..color = Colors.redAccent
      ..strokeWidth = 2.0;

    final penYelow = Paint()
      ..color = Colors.yellowAccent
      ..strokeWidth = 2.0;

    final penBlack1 = Paint()
      ..color = Colors.white24
      ..strokeWidth = 2.0;

    final penBlack2 = Paint()
      ..color = Colors.white12
      ..strokeWidth = 2.0;

    double radiG0 = (72 * 0 - 90) / 180 * pi;
    double radiG1 = (72 * 1 - 90) / 180 * pi;
    double radiG2 = (72 * 2 - 90) / 180 * pi;
    double radiG3 = (72 * 3 - 90) / 180 * pi;
    double radiG4 = (72 * 4 - 90) / 180 * pi;

    final centerG01 = center1 + Offset(r1 * cos(radiG0), r1 * sin(radiG0));
    final centerG02 = center1 + Offset(r2 * cos(radiG0), r2 * sin(radiG0));
    final centerG03 = center1 + Offset(r3 * cos(radiG0), r3 * sin(radiG0));
    final centerG11 = center1 + Offset(r1 * cos(radiG1), r1 * sin(radiG1));
    final centerG12 = center1 + Offset(r2 * cos(radiG1), r2 * sin(radiG1));
    final centerG13 = center1 + Offset(r3 * cos(radiG1), r3 * sin(radiG1));
    final centerG21 = center1 + Offset(r1 * cos(radiG2), r1 * sin(radiG2));
    final centerG22 = center1 + Offset(r2 * cos(radiG2), r2 * sin(radiG2));
    final centerG23 = center1 + Offset(r3 * cos(radiG2), r3 * sin(radiG2));
    final centerG31 = center1 + Offset(r1 * cos(radiG3), r1 * sin(radiG3));
    final centerG32 = center1 + Offset(r2 * cos(radiG3), r2 * sin(radiG3));
    final centerG33 = center1 + Offset(r3 * cos(radiG3), r3 * sin(radiG3));
    final centerG41 = center1 + Offset(r1 * cos(radiG4), r1 * sin(radiG4));
    final centerG42 = center1 + Offset(r2 * cos(radiG4), r2 * sin(radiG4));
    final centerG43 = center1 + Offset(r3 * cos(radiG4), r3 * sin(radiG4));

    // 日干の運勢の描画（固定部分）
    canvas.drawCircle(center1, rr2, penBlack2..style = PaintingStyle.fill);
    canvas.drawCircle(centerG01, rr1, penBlack1..style = PaintingStyle.fill);
    canvas.drawCircle(centerG02, rr1, penBlack1..style = PaintingStyle.fill);
    canvas.drawCircle(centerG03, rr1, penBlue..style = PaintingStyle.fill);
    canvas.drawCircle(centerG11, rr1, penBlack1..style = PaintingStyle.fill);
    canvas.drawCircle(centerG12, rr1, penBlack1..style = PaintingStyle.fill);
    canvas.drawCircle(centerG13, rr1, penRed..style = PaintingStyle.fill);
    canvas.drawCircle(centerG21, rr1, penBlack1..style = PaintingStyle.fill);
    canvas.drawCircle(centerG22, rr1, penBlack1..style = PaintingStyle.fill);
    canvas.drawCircle(centerG23, rr1, penYelow..style = PaintingStyle.fill);
    canvas.drawCircle(centerG31, rr1, penBlack1..style = PaintingStyle.fill);
    canvas.drawCircle(centerG32, rr1, penBlack1..style = PaintingStyle.fill);
    canvas.drawCircle(centerG33, rr1, penWhite..style = PaintingStyle.fill);
    canvas.drawCircle(centerG41, rr1, penBlack1..style = PaintingStyle.fill);
    canvas.drawCircle(centerG42, rr1, penBlack1..style = PaintingStyle.fill);
    canvas.drawCircle(centerG43, rr1, penWhite1..style = PaintingStyle.stroke);
    canvas.drawCircle(center1, rr2, penWhite..style = PaintingStyle.stroke);

    // 日子の運勢の描画
    double radiS0 = (30 * 0 + 90) / 180 * pi; // 子の角度
    double radiS1 = (30 * 1 + 90) / 180 * pi; // 丑の角度
    double radiS2 = (30 * 2 + 90) / 180 * pi; // 寅の角度
    double radiS3 = (30 * 3 + 90) / 180 * pi; // 卯の角度
    double radiS4 = (30 * 4 + 90) / 180 * pi; // 辰の角度
    double radiS5 = (30 * 5 + 90) / 180 * pi; // 巳の角度
    double radiS6 = (30 * 6 + 90) / 180 * pi; // 午の角度
    double radiS7 = (30 * 7 + 90) / 180 * pi; // 未の角度
    double radiS8 = (30 * 8 + 90) / 180 * pi; // 申の角度
    double radiS9 = (30 * 9 + 90) / 180 * pi; // 酉の角度
    double radiS10 = (30 * 10 + 90) / 180 * pi; // 戌の角度
    double radiS11 = (30 * 11 + 90) / 180 * pi; // 亥の角度
    final centerS0 = center2 + Offset(r4 * cos(radiS0), r4 * sin(radiS0));
    final centerS1 = center2 + Offset(r4 * cos(radiS1), r4 * sin(radiS1));
    final centerS2 = center2 + Offset(r4 * cos(radiS2), r4 * sin(radiS2));
    final centerS3 = center2 + Offset(r4 * cos(radiS3), r4 * sin(radiS3));
    final centerS4 = center2 + Offset(r4 * cos(radiS4), r4 * sin(radiS4));
    final centerS5 = center2 + Offset(r4 * cos(radiS5), r4 * sin(radiS5));
    final centerS6 = center2 + Offset(r4 * cos(radiS6), r4 * sin(radiS6));
    final centerS7 = center2 + Offset(r4 * cos(radiS7), r4 * sin(radiS7));
    final centerS8 = center2 + Offset(r4 * cos(radiS8), r4 * sin(radiS8));
    final centerS9 = center2 + Offset(r4 * cos(radiS9), r4 * sin(radiS9));
    final centerS10 = center2 + Offset(r4 * cos(radiS10), r4 * sin(radiS10));
    final centerS11 = center2 + Offset(r4 * cos(radiS11), r4 * sin(radiS11));

    final centerS0a = center2 + Offset(r5 * cos(radiS0), r5 * sin(radiS0));
    final centerS1a = center2 + Offset(r5 * cos(radiS1), r5 * sin(radiS1));
    final centerS2a = center2 + Offset(r5 * cos(radiS2), r5 * sin(radiS2));
    final centerS3a = center2 + Offset(r5 * cos(radiS3), r5 * sin(radiS3));
    final centerS4a = center2 + Offset(r5 * cos(radiS4), r5 * sin(radiS4));
    final centerS5a = center2 + Offset(r5 * cos(radiS5), r5 * sin(radiS5));
    final centerS6a = center2 + Offset(r5 * cos(radiS6), r5 * sin(radiS6));
    final centerS7a = center2 + Offset(r5 * cos(radiS7), r5 * sin(radiS7));
    final centerS8a = center2 + Offset(r5 * cos(radiS8), r5 * sin(radiS8));
    final centerS9a = center2 + Offset(r5 * cos(radiS9), r5 * sin(radiS9));
    final centerS10a = center2 + Offset(r5 * cos(radiS10), r5 * sin(radiS10));
    final centerS11a = center2 + Offset(r5 * cos(radiS11), r5 * sin(radiS11));

    // ■■■■■■■■■ 日支の運勢描画 ■■■■■■■■■

    // ３階
    canvas.drawCircle(center2, rr3, penBlack2..style = PaintingStyle.fill);
    canvas.drawCircle(
        centerS0, rr1, penWhite1..style = PaintingStyle.stroke); //子
    canvas.drawCircle(centerS1, rr1, penYelow..style = PaintingStyle.fill); //丑
    canvas.drawCircle(centerS2, rr1, penBlue..style = PaintingStyle.fill); //寅
    canvas.drawCircle(centerS3, rr1, penBlue..style = PaintingStyle.fill); //卯
    canvas.drawCircle(centerS4, rr1, penYelow..style = PaintingStyle.fill); //辰
    canvas.drawCircle(centerS5, rr1, penRed..style = PaintingStyle.fill); //巳
    canvas.drawCircle(centerS6, rr1, penRed..style = PaintingStyle.fill); //午
    canvas.drawCircle(centerS7, rr1, penYelow..style = PaintingStyle.fill); //未
    canvas.drawCircle(centerS8, rr1, penWhite..style = PaintingStyle.fill); //申
    canvas.drawCircle(centerS9, rr1, penWhite..style = PaintingStyle.fill); //酉
    canvas.drawCircle(centerS10, rr1, penYelow..style = PaintingStyle.fill); //戌
    canvas.drawCircle(
        centerS11, rr1, penWhite1..style = PaintingStyle.stroke); //亥

    // ２階
    canvas.drawCircle(centerS0a, rr1, penBlack1..style = PaintingStyle.fill);
    canvas.drawCircle(centerS1a, rr1, penBlack1..style = PaintingStyle.fill);
    canvas.drawCircle(centerS2a, rr1, penBlack1..style = PaintingStyle.fill);
    canvas.drawCircle(centerS3a, rr1, penBlack1..style = PaintingStyle.fill);
    canvas.drawCircle(centerS4a, rr1, penBlack1..style = PaintingStyle.fill);
    canvas.drawCircle(centerS5a, rr1, penBlack1..style = PaintingStyle.fill);
    canvas.drawCircle(centerS6a, rr1, penBlack1..style = PaintingStyle.fill);
    canvas.drawCircle(centerS7a, rr1, penBlack1..style = PaintingStyle.fill);
    canvas.drawCircle(centerS8a, rr1, penBlack1..style = PaintingStyle.fill);
    canvas.drawCircle(centerS9a, rr1, penBlack1..style = PaintingStyle.fill);
    canvas.drawCircle(centerS10a, rr1, penBlack1..style = PaintingStyle.fill);
    canvas.drawCircle(centerS11a, rr1, penBlack1..style = PaintingStyle.fill);
    // 白い大きな円
    canvas.drawCircle(center2, rr3, penWhite..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

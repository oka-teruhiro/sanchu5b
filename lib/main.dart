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
      home: const HomePage(title: '天運三柱推命ver.5.0.5'),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
      create: (_) => MainModel(),
      child: Consumer<MainModel>(builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(title),
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
                        painter: ShapePainter5(
                          tuhen: model.tuhen,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  model.nowMoji,
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      // TODO ここで何かをする
                      model.changeAText();
                    },
                    child: const Text('ボタン')),
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  model.ct,
                  style: Theme.of(context).textTheme.headlineMedium,
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
  //int gogyou = 1; // 五行　0:木 1:火 2:土 3:金 4:水  // ■■■■■■受け取る値を代入する変数を定義
  //int nitiSi = 0;
  int tuhen; // 日し
  ShapePainter5({required this.tuhen}); // ■■■■■■■■■受け取る値を上記変数に代入
  @override
  void paint(Canvas canvas, Size size) {
    var center1 = const Offset(150, 130); // 表面の中心座標
    var center2 = const Offset(150, 400); // 本質の中心座標

    print('tuhen:$tuhen');

    double rr1 = 18;
    double r1 = 36;
    double r2 = 72;
    double rt;
    double gogyo;
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
      gogyo = tuhen / 2;
    } else {
      rt = r1;
      gogyo = (tuhen - 1) / 2;
    }

    double radianTu = (72 * gogyo - 90) / 180 * pi;
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

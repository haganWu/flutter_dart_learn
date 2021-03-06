import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  const GesturePage({Key? key}) : super(key: key);

  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String printString = "";
  double moveX = 0,
      moveY = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("手势检测"),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () => _printMsg("点击"),
                    onDoubleTap: () => _printMsg("双击"),
                    onLongPress: () => _printMsg("长按"),
                    onTapCancel: () => _printMsg("取消"),
                    onTapUp: (e) => _printMsg("松开"),
                    onTapDown: (e) => _printMsg("按下"),
                    child: Container(
                      padding: const EdgeInsets.all(60),
                      decoration: const BoxDecoration(color: Colors.blue),
                      child: const Text(
                        "点击",
                        style: TextStyle(fontSize: 36, color: Colors.red),
                      ),
                    ),
                  ),
                  Text(printString),
                ],
              ),
              Positioned(
                  left: moveX,
                  top: moveY,
                  child: GestureDetector(
                    onPanUpdate: (e) => _doMove(e),
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(36)),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void _printMsg(String msg) {
    setState(() {
      printString += ",$msg";
    });
    // print(printString);
  }

  _doMove(DragUpdateDetails e) {
    setState(() {
      moveX += e.delta.dx;
      moveY += e.delta.dy;
    });
    print(e);
  }
}

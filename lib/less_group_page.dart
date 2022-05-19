import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class LessGroupPage extends StatelessWidget {
  const LessGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(fontSize: 20, color: Colors.green);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('StatelessWidget与基础组件'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text('Test Show', style: textStyle),
              const Icon(
                Icons.apple,
                size: 60,
                color: Colors.red,
              ),
              CloseButton(
                  color: Colors.greenAccent,
                  onPressed: () => {print("onPress")}),
              const BackButton(),
              const Chip(
                  avatar: Icon(Icons.people), label: Text('StatelessWidget')),
              const Divider(
                color: Colors.red,
                height: 100, //容器高度，不是线的高度
                indent: 10, //左侧间距
                endIndent: 20, //右侧间距
              ),
              Card(
                //带有圆角、阴影、边框效果的卡片
                color: Colors.blue,
                elevation: 5,
                margin: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "I am Card",
                    style: textStyle,
                  ),
                ),
              ),
              const AlertDialog(
                title: Text('温馨提示'),
                content: Text("Ready Go？"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

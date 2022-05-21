import 'package:flutter/material.dart';
import 'package:flutter_dart_learn/less_group_page.dart';
import 'package:flutter_dart_learn/plugin_use.dart';
import 'package:flutter_dart_learn/resource_page.dart';
import 'package:flutter_dart_learn/stateful_group_page.dart';

import 'flutter_layout_page.dart';
import 'gesture_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterDemo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter路由与导航使用"),
        ),
        body: const RootNavigator(),
      ),
      routes: <String, WidgetBuilder>{
        'plugin': (BuildContext context) => const PluginUse(),
        'less': (BuildContext context) => const LessGroupPage(),
        'full': (BuildContext context) => const StateFullGroupPage(),
        'layout': (BuildContext context) => const FlutterLayoutPage(),
        'gesture': (BuildContext context) => const GesturePage(),
        'resource': (BuildContext context) => const ResourcePage(),
      },
    );
  }
}

class RootNavigator extends StatefulWidget {
  const RootNavigator({Key? key}) : super(key: key);

  @override
  State<RootNavigator> createState() => _RootNavigatorState();
}

class _RootNavigatorState extends State<RootNavigator> {
  bool jumpByName = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          SwitchListTile(
              title: Text("${jumpByName ? "" : "不"}通过路由名跳转"),
              value: jumpByName,
              onChanged: (value) {
                setState(() {
                  jumpByName = value;
                });
              }),
          _item("Plugin使用", const PluginUse(), "plugin"),
          _item("StatelessWidget与基础组件", const LessGroupPage(), "less"),
          _item("StatefulWidget与基础组件", const StateFullGroupPage(), "full"),
          _item("Flutter布局", const FlutterLayoutPage(), "layout"),
          _item("手势操作", const GesturePage(), "gesture"),
          _item("资源文件使用", const ResourcePage(), "resource"),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          if (jumpByName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}

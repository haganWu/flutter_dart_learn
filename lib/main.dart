import 'package:flutter/material.dart';
import 'package:flutter_dart_learn/less_group_page.dart';
import 'package:flutter_dart_learn/plugin_use.dart';
import 'package:flutter_dart_learn/resource_page.dart';
import 'package:flutter_dart_learn/stateful_group_page.dart';
import 'package:flutter_dart_learn/third_app_launcher_page.dart';

import 'app_lifecycle.dart';
import 'flutter_layout_page.dart';
import 'flutter_widget_lifecycle.dart';
import 'gesture_page.dart';

void main() {
  runApp(const DynamicTheme());
}

class DynamicTheme extends StatefulWidget {
  const DynamicTheme({Key? key}) : super(key: key);

  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  Brightness _brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterDemo',
      theme: ThemeData(
        // fontFamily: "RubikMonoOne",
        brightness: _brightness,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter路由与导航使用"),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_brightness == Brightness.dark) {
                      _brightness = Brightness.light;
                    } else {
                      _brightness = Brightness.dark;
                    }
                  });
                },
                child: const Text("切换主题abcd",style: TextStyle(fontFamily: "RubikMonoOne"))),
            const RootNavigator(),
          ],
        ),
      ),
      routes: <String, WidgetBuilder>{
        'plugin': (BuildContext context) => const PluginUse(),
        'less': (BuildContext context) => const LessGroupPage(),
        'full': (BuildContext context) => const StateFullGroupPage(),
        'layout': (BuildContext context) => const FlutterLayoutPage(),
        'gesture': (BuildContext context) => const GesturePage(),
        'resource': (BuildContext context) => const ResourcePage(),
        'launchApp': (BuildContext context) => const ThirdAppLaunchPage(),
        'lifecycle': (BuildContext context) => const WidgetLifecycle(),
        'AppLifecycle': (BuildContext context) => const AppLifecycle(),
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
          _item("启动第三方App", const ThirdAppLaunchPage(), "launchApp"),
          _item("生命周期", const WidgetLifecycle(), "lifecycle"),
          _item("App生命周期", const AppLifecycle(), "AppLifecycle"),
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

import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class PluginUse extends StatefulWidget {
  const PluginUse({Key? key}) : super(key: key);

  @override
  State<PluginUse> createState() => _PluginUseState();
}

class _PluginUseState extends State<PluginUse> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter插件使用"),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '点击次数:',
              style: TextStyle(color: ColorUtil.color("#557800")),
            ),
          ],
        ),
      ),
    );
  }
}

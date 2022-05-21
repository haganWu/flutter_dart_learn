import 'package:flutter/material.dart';

///WidgetsBindingObserver：widgets绑定观察器，通过它监听应用的生命周期、语言的变化
class AppLifecycle extends StatefulWidget {
  const AppLifecycle({Key? key}) : super(key: key);

  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("App应用生命周期"),
          leading: const BackButton(),
        ),
        body: const Center(
          child: Text("App应用生命周期"),
        ));
  }

  ///App生命周期发生变化的时候回调此方法
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("state: $state");
    if (state == AppLifecycleState.paused) {
      print("----------App进入后台-----------");
    } else if (state == AppLifecycleState.resumed) {
      print("----------App进入前台-----------");
    } else if (state == AppLifecycleState.inactive) {
      //不常用 App应用处于非活动状态，并且未接受用户输入时调用，比如：来了个电话
      print("----------App应用处于非活动状态，并且未接受用户输入时调用，比如：来了个电话-----------");
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }
}

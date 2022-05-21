import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetLifecycle extends StatefulWidget {
  const WidgetLifecycle({Key? key}) : super(key: key);

  ///当我们构建一个新的StatefulWidget时会立即调用createState方法，并且这个方法必须覆盖。
  @override
  _WidgetLifecycleState createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  int _count = 0;

  ///创建Widget时调用的除构造方法外的第一个方法，
  ///类似Android的onCreate() 和 IOS的viewDidLoad()，在这个方法中通常做一些初始化工作，比如channel的初始化、监听器的初始化。
  @override
  void initState() {
    print("Lifecycle : initState");
    super.initState();
  }

  ///当所依赖的State对象改变的时候会调用
  ///1.在第一次构建Widget时，在initState()之后会立即调用
  ///2.如果StatefulWidget依赖于InheritedWidget，那么当当前State所依赖的InheritedWidget中的变量改变的时候会再次调用
  @override
  void didChangeDependencies() {
    print("Lifecycle : didChangeDependencies");
    super.didChangeDependencies();
  }

  ///这是一个必须实现的方法，在这里实现你要呈现的页面内容，它会在didChangeDependencies()之后立即调用，另外当调用setState后也会再次调用该方法。
  @override
  Widget build(BuildContext context) {
    print("Lifecycle : build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter/Widget生命周期"),
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
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _count++;
                  });
                },
                child: const Text(
                  "Plus",
                  style: TextStyle(fontSize: 26),
                )),
            Container(
              padding: const EdgeInsets.all(12),
              child: Text("result:$_count"),
            )
          ],
        ),
      ),
    );
  }

  ///不常用，当父组件需要重新绘制时才会调用，该方法会携带一个oldWidget参数，
  ///可以将其与当前的Widget进行对比以便执行一些额外的逻辑，如if(oldWidget.xxx != widget.xxx)...
  @override
  void didUpdateWidget(covariant WidgetLifecycle oldWidget) {
    print("Lifecycle : didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  ///不常用，在组件被移除的时候调用，在dispose之前调用
  @override
  void deactivate() {
    print("Lifecycle : deactivate");
    super.deactivate();
  }

  ///在组件被销毁的时候调用，通常在这个方法中执行一些资源的释放工作，比如监听器的卸载、channel的销毁等。
  @override
  void dispose() {
    print("Lifecycle : dispose");
    super.dispose();
  }
}

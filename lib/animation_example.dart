import 'package:flutter/material.dart';

class AnimationExample extends StatefulWidget {
  const AnimationExample({Key? key}) : super(key: key);

  @override
  State<AnimationExample> createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  // late AnimationStatus animationStatus;
  late double animationValue = 0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 6));
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {//必须setStatus 让animation.value()值变化生效
          animationValue = animation.value;
        });
      })
      ..addStatusListener((status) {
        setState(() {
          // animationStatus = status;
        });
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("动画"),
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
            GestureDetector(
              child: const Text('Start', textDirection: TextDirection.ltr),
              onTap: () {
                controller.reset();
                controller.forward();
              },
            ),
            Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    // Text("status:$animationStatus"),
                    Text("value:$animationValue"),
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(top: 50),
              height: animation.value,
              width: animation.value,
              child: const FlutterLogo(),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({Key? key}) : super(key: key);

  @override
  _AnimatedBuilderExampleState createState() => _AnimatedBuilderExampleState();
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: const FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  const GrowTransition({Key? key, required this.child, required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => SizedBox(
        height: animation.value,
        width: animation.value,
        child: child,
      ),
      child: child,
    );
  }
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 6));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: const Text('Start', textDirection: TextDirection.ltr),
            onTap: () {
              controller.reset();
              controller.forward();
            },
          ),
          GrowTransition(child: const LogoWidget(), animation: animation)
        ],
      ),
    );
  }
}

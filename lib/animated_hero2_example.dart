import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'dart:math' as Math;

class Photo extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double? width;

  const Photo(
      {Key? key, required this.photo, required this.onTap,  this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme
          .of(context)
          .primaryColor
          .withOpacity(0.25),
      child: InkWell(
        onTap: onTap,
        child: LayoutBuilder(
          builder: (context, size) {
            return Image.network(photo, fit: BoxFit.contain);
          },
        ),
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  final double maxRadius;
  final double clipRectSize;
  final Widget child;

  const RadialExpansion(
      {Key? key, required this.maxRadius, required this.child})
      : clipRectSize = 2.0 * (maxRadius / Math.sqrt2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}

class RadialExpansionDemo extends StatelessWidget {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve = Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  static RectTween _createRectTween(Rect? begin, Rect? end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  static Widget _buildPage(BuildContext context, String imageName, String
  description) {
    return Container(
      color: Theme
          .of(context)
          .canvasColor,
      child: Center(
        child: Card(
          elevation: 8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: kMaxRadius * 2,
                height: kMaxRadius * 2,
                child: Hero(
                  createRectTween: _createRectTween,
                  tag: imageName,
                  child: RadialExpansion(maxRadius: kMaxRadius, child: Photo(
                    photo: imageName,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    width: null,
                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  const RadialExpansionDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HeroAnimation2 extends StatelessWidget {
  const HeroAnimation2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeDilation = 10.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Hero Animation"),
      ),
      body: Center(
        child: Photo(
            photo:
            'http://ww1.sinaimg.cn/large/0065oQSqly1frepqtwifwj30no0ti47n.jpg',
            width: 300.0,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text("Flippers Page"),
                  ),
                  body: Container(
                    color: Colors.blue,
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.topLeft,
                    child: Photo(
                      photo:
                      'http://ww1.sinaimg.cn/large/0065oQSqly1frepqtwifwj30no0ti47n.jpg',
                      width: 100,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                );
              }));
            }),
      ),
    );
  }
}

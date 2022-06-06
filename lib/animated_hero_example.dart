import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class PhotoHero extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;

  const PhotoHero(
      {Key? key, required this.photo, required this.onTap, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.network(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeDilation = 10.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Hero Animation"),
      ),
      body: Center(
        child: PhotoHero(
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
                    child: PhotoHero(photo:  'http://ww1.sinaimg.cn/large/0065oQSqly1frepqtwifwj30no0ti47n.jpg',
                    width: 100,
                    onTap: (){
                      Navigator.of(context).pop();
                    },),
                  ),
                );
              }));
            }),
      ),
    );
  }
}

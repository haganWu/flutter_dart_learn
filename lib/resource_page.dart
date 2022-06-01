import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ResourcePage extends StatefulWidget {
  const ResourcePage({Key? key}) : super(key: key);

  @override
  State<ResourcePage> createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("资源文件使用"),
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
          children: const <Widget>[
            // const Image(
            //   image: AssetImage('images/girl.png'),
            // ),
            // FutureBuilder(
            //   future: _getLocalFile("Download/Stack.png"),
            //   builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
            //     return snapshot.hasData
            //         ? Image.file(snapshot.data!)
            //         : Container();
            //   },
            // ),
            // FadeInImage.memoryNetwork(
            //     placeholder: kTransparentImage,
            //     image:
            //         'http://ww1.sinaimg.cn/large/0065oQSqly1frepqtwifwj30no0ti47n.jpg'),
            // CachedNetworkImage(
            //   placeholder:  (context, url) => const CircularProgressIndicator(),
            //   imageUrl:'http://ww1.sinaimg.cn/large/0065oQSqly1frepqtwifwj30no0ti47n.jpg',
            // ),
            // Icon(Icons.home,size: 300),
            Icon(IconData(0xf5566,fontFamily: "RubikMonoOne"),size: 200,
              color: Colors.blue,)
          ],
        ),
      ),
    );
  }

  Future<File> _getLocalFile(String fileName) async {
    String? dir = (await getExternalStorageDirectory())?.path;
    File f = File('$dir/$fileName');
    return f;
  }
}

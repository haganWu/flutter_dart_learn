import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ThirdAppLaunchPage extends StatefulWidget {
  const ThirdAppLaunchPage({Key? key}) : super(key: key);

  @override
  State<ThirdAppLaunchPage> createState() => _ThirdAppLaunchPageState();
}

class _ThirdAppLaunchPageState extends State<ThirdAppLaunchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("打开第三方App"),
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
              onPressed: () => _launcherURL(),
              child: const Text("打开浏览器"),
            ),
            ElevatedButton(
              onPressed: () => _openMap(),
              child: const Text("打开地图"),
            ),
          ],
        ),
      ),
    );
  }

  ///启动三方APP
  void _launcherURL() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Could not launch $url";
    }
  }

  _openMap() async {
    //Android
    final Uri url = Uri.parse('geo:52.32,4.917'); //App提供者提供的schema
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      //IOS
      final Uri url =
          Uri.parse('http://maps.apple.com/?ll=52.32,4.917'); //App提供者提供的schema
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw "Could not launch $url";
      }
    }
  }
}

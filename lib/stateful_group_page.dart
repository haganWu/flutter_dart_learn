import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

///StatefulWidget与基础组件
class StateFullGroupPage extends StatefulWidget {
  const StateFullGroupPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateFullGroupState();
}

class _StateFullGroupState extends State<StateFullGroupPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(fontSize: 30, color: Colors.red);
    return MaterialApp(
      title: 'StatefulWidget与基础组件',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('StatefulWidget与基础组件')),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.grey),
                activeIcon: Icon(Icons.home, color: Colors.blue),
                label: '首页',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list, color: Colors.grey),
                activeIcon: Icon(Icons.list, color: Colors.blue),
                label: '列表',
              )
            ]),
        floatingActionButton: _currentIndex == 0
            ? FloatingActionButton(
                onPressed: () {
                  print("FloatingActionButton Click");
                },
                child: const Text(
                  "+",
                  style: TextStyle(fontSize: 30),
                ),
              )
            : null,
        body: _currentIndex == 0
            ? Container(
                decoration: const BoxDecoration(color: Colors.white),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Text('Home', style: textStyle),
                  ],
                ),
              )
            : RefreshIndicator(
                child: ListView(
                  children: [
                    Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Text('List', style: textStyle),
                          Image.network(
                            'http://www.devio.org/img/avatar.png',
                            width: 300,
                            height: 300,
                          ),
                          const TextField(
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(12, 6, 12, 6),
                                hintText: '请输入',
                                hintStyle: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                          ),
                          Container(
                            height: 100,
                            margin: const EdgeInsets.only(top: 10),
                            decoration:
                                const BoxDecoration(color: Colors.lightBlue),
                            child: PageView(
                              children: [
                                _item('Page1', Colors.deepPurple),
                                _item('Page2', Colors.deepOrange),
                                _item('Page3', Colors.blueGrey),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                onRefresh: _handleRefresh,
              ),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    print("onRefresh");
    return null;
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title,
          style: const TextStyle(fontSize: 22, color: Colors.white)),
    );
  }
}

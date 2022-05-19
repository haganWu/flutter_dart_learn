import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

///Flutter布局
class FlutterLayoutPage extends StatefulWidget {
  const FlutterLayoutPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateFullGroupState();
}

/**
 *  http://ww1.sinaimg.cn/large/0065oQSqly1frv032vod8j30k80q6gsz.jpg
    http://ww1.sinaimg.cn/large/0065oQSqly1frepq6mfvdj30p00wcwmq.jpg
    http://ww1.sinaimg.cn/large/0065oQSqly1fs1vq7vlsoj30k80q2ae5.jpg
    http://ww1.sinaimg.cn/large/0065oQSqly1fs02a9b0nvj30sg10vk4z.jpg
    http://ww1.sinaimg.cn/large/0065oQSqly1fryyn63fm1j30sg0yagt2.jpg
    http://ww1.sinaimg.cn/large/0065oQSqly1frv03m8ky5j30iz0rltfp.jpg
    http://ww1.sinaimg.cn/large/0065oQSqly1frg40vozfnj30ku0qwq7s.jpg
    http://ww1.sinaimg.cn/large/0065oQSqly1frslibvijrj30k80q678q.jpg
    http://ww1.sinaimg.cn/large/0065oQSqly1fri9zqwzkoj30ql0w3jy0.jpg
    http://ww1.sinaimg.cn/large/0065oQSqly1frqscr5o00j30k80qzafc.jpg
    http://ww1.sinaimg.cn/large/0065oQSqly1fs34w0jx9jj30j60ootcn.jpg
    http://ww1.sinaimg.cn/large/0065oQSqly1frsllc19gfj30k80tfah5.jpg
    http://ww1.sinaimg.cn/large/0065oQSqly1frmuto5qlzj30ia0notd8.jpg
    http://ww1.sinaimg.cn/large/0065oQSqly1frjd77dt8zj30k80q2aga.jpg
    http://ww1.sinaimg.cn/large/0065oQSqly1frjd4var2bj30k80q0dlf.jpg
    http://ww1.sinaimg.cn/large/0065oQSqly1frja502w5xj30k80od410.jpg
    http://ww1.sinaimg.cn/large/0065oQSqly1frevscw2wej30je0ps78h.jpg
    http://ww1.sinaimg.cn/large/0065oQSqly1frepozc5taj30qp0yg7aq.jpg
    http://ww1.sinaimg.cn/large/0065oQSqly1frepq6mfvdj30p00wcwmq.jpg
    http://ww1.sinaimg.cn/large/0065oQSqly1frepqtwifwj30no0ti47n.jpg
 */
class _StateFullGroupState extends State<FlutterLayoutPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(fontSize: 30, color: Colors.red);
    return MaterialApp(
      title: 'Flutter布局',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter布局')),
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
            ? Column(
                children: [
                  const Text('Home'),
                  Expanded(
                      child: Container(
                    decoration: const BoxDecoration(color: Colors.red),
                    child: const Text("拉伸填满高度"),
                  ))
                ],
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
                          Row(
                            children: <Widget>[
                              ClipOval(
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.network(
                                    'http://ww1.sinaimg.cn/large/0065oQSqly1frepqtwifwj30no0ti47n.jpg',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: ClipRRect(
                                  //圆角
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: Opacity(
                                      opacity: 0.6,
                                      child: Image.network(
                                        'http://ww1.sinaimg.cn/large/0065oQSqly1frepq6mfvdj30p00wcwmq.jpg',
                                        width: 100,
                                        height: 100,
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18),
                                child: Container(
                                    width: 100,
                                    height: 100,
                                    clipBehavior: Clip.hardEdge,
                                    //有锯齿
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.network(
                                      'http://ww1.sinaimg.cn/large/0065oQSqly1frepq6mfvdj30p00wcwmq.jpg',
                                      width: 100,
                                      height: 100,
                                    )),
                              ),
                            ],
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
                            margin: const EdgeInsets.all(10),
                            child: PhysicalModel(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              clipBehavior: Clip.antiAlias, //抗锯齿
                              child: PageView(
                                children: [
                                  _item('Page1', Colors.deepPurple),
                                  _item('Page2', Colors.deepOrange),
                                  _item('Page3', Colors.blueGrey),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              FractionallySizedBox(
                                widthFactor: 1,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.deepOrangeAccent),
                                  child: const Text(
                                    "撑满宽度",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Image.network(
                          "http://ww1.sinaimg.cn/large/0065oQSqly1frsllc19gfj30k80tfah5.jpg",
                          height: 100,
                        ),
                        Positioned(
                            left: 0,
                            bottom: 0,
                            child: Image.network(
                              "http://ww1.sinaimg.cn/large/0065oQSqly1fs1vq7vlsoj30k80q2ae5.jpg",
                              height: 36,
                            ))
                      ],
                    ),
                    Wrap(
                      spacing: 8, //水平边距
                      runSpacing: 2, //垂直间距
                      children: [
                        _chip('Flutter'),
                        _chip('Dart'),
                        _chip('Android'),
                        _chip('Java'),
                        _chip('Kotlin'),
                        _chip('IOS'),
                        _chip('Vue'),
                        _chip('OC'),
                        _chip('ReactNative'),
                        _chip('JS'),
                      ],
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

  _chip(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(
          label.substring(0, 1),
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}

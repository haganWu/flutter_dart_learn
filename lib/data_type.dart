import 'package:flutter/material.dart';

///常用数据类型
class DataType extends StatefulWidget {
  const DataType({Key? key}) : super(key: key);

  @override
  _DataTypeState createState() => _DataTypeState();
}

class _DataTypeState extends State<DataType> {
  @override
  Widget build(BuildContext context) {
    // _numType();
    // _stringType();
    // _boolType();
    // _listType();
    // _mapType();
    _tips();
    return const Text('常用数据类型，请查看控制台输出');
  }

  ///数字类型
  void _numType() {
    num num1 = -1.0; //数字类型的父类
    num num2 = 2; //数字类型的父类
    int int1 = 3; //整数类型
    double d1 = 1.68; //双精度
    print("num1:$num1, num2:$num2, int1:$int1, d1:$d1");
    print(num1.abs());
    print(num1.toInt());
    print(num1.toDouble());
    print(num1.toString());
  }

  ///字符串
  void _stringType() {
    print("--------------stringType-------------------");
    String s1 = "Today is rain";
    String s2 = "haha";
    String s3 = "$s1 $s2";
    print(s1);
    print(s3);
    //常用方法
    String str1 = "常用数据类型，请看控制台输出";
    print(str1.substring(0, 5));
    print(str1.indexOf('请'));
  }

  ///布尔类型，Dart是强bool类型检查，只有bool类型的值才可表示true或者false
  void _boolType() {
    print("--------------boolType-------------------");
    bool success = true;
    bool fail = false;
    print(success);
    print(fail);
  }

  //List集合
  void _listType() {
    print("--------------listType-------------------");
    //初始化添加元素
    List list1 = [1, 1.2, true, 'Hello'];
    //泛型集合
    List<int> list2 = [1, 2, 3];
    list2.add(6);

    List list3 = [];
    list3.addAll(list1);
    print(list1);

    List list4 = List.generate(3, (index) => index * 2);
    print(list4);

    //遍历方式
    for (int i = 0; i < list1.length; i++) {
      print(list1[i]);
    }

    for (var item in list2) {
      print(item);
    }
    list4.forEach((element) {
      print(element);
    });
  }

  ///Map 键值对
  void _mapType() {
    print("--------------mapType-------------------");
    //初始化
    Map map = {'xx': '小明', 'xh': '小红'};
    Map map1 = {};
    map1['xx'] = 16;
    map1['xh'] = 18;
    // print(map1);

    //遍历
    map.forEach((key, value) {
      print('key:$key , value:$value');
    });

    Map convertMap = map.map((key, value) => MapEntry(value, key));
    print(convertMap);

    for (var key in map.keys) {
      print('key:$key; value:${map[key]}');
    }
  }

  /// dynamic、var、Object三者区别
  void _tips() {
    print("--------------tips-------------------");
    print("--------------dynamic-------------------");

    /// dynamic dart语言中动态数据类型
    dynamic x = 2;
    print(x.runtimeType);
    print(x);
    x = "Hello";
    print(x.runtimeType);
    print(x);
    // x.foo();

    print("--------------var-------------------");

    /// var 关键字 不关心类型是什么
    var a = "var";
    print(a.runtimeType);
    print(a);
    // a = 2;

    print("--------------Object-------------------");

    /// Object Dart语言的基类
    Object o1 = "111";
    print(o1.runtimeType);
    print(o1);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dart_learn/data_type.dart';
import 'package:flutter_dart_learn/generic_learn.dart';
import 'package:flutter_dart_learn/opp_learn.dart';
import 'package:flutter_dart_learn/plugin_use.dart';

import 'less_group_page.dart';

void main() {
  runApp(const LessGroupPage());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart基础学习',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Dart基础学习'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // _oopLearn();
    _genericLearn();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: const <Widget>[
            // DataType()
          ],
        ),
      ),
    );
  }

  void _oopLearn() {
    print("--------------OOPLearn-------------------");
    Logger log1 = Logger();
    Logger log2 = Logger();
    print(log1 == log2);

    //创建Student对象
    Student student = Student("三一学院", "小小", 18, country: '中国', city: '上海');

    Student stu2 = Student.cover(student);
    student.school = '985'; //set方法
    Student.doPrint(student.toString());
  }

  void _genericLearn() {
    TestGeneric tg = TestGeneric();
    tg.start();
  }
}

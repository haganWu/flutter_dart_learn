///定义一个Dart类，所有的类都继承自Object
abstract class Person {
  String name;
  int age;

  Person(this.name, this.age);

  @override
  String toString() {
    return "name:$name, age:$age";
  }

  void eat();

  void sleep() {
    print("I can sleep");
  }
}

class Student extends Person {
  late String _school; //Dart中通过下划线标识私有变量
  late String city;
  late String country;
  late String name;

  ///标准构造方法
  Student(this._school, String name, int age,
      {this.city = "深圳", this.country = "中国"})
      //初始化列表：除了调用父类构造器，在子类构造器方法体之前，可以初始化实例变量，不同的变量之间用逗号分割
      : name = '$country.$city',
        //调用父类构造方法：如果父类没有默认的构造方法（无参构造方法），则需要在初始化列表中调用父类的构造方法进行初始化。
        super(name, age) {
    print('构造方法体不是必须的，可以省略');
  }

  @override
  String toString() {
    return 'Student{_school: $_school, city: $city, country: $country, name: $name}';
  }

  ///命名构造方法
  Student.cover(Student stu) : super(stu.name, stu.age);

  ///命名工厂构造方法 factory 类名 + . + 方法名
  factory Student.stu(Student stu) {
    return Student(stu._school, stu.name, stu.age, city: 'dd');
  }

  @override
  void eat() {}

  @override
  void sleep() {
    // TODO: implement sleep
    super.sleep();
  }

  String get school => _school;

  set school(String value) {
    _school = value;
  }

  static doPrint(String string) {
    print('doPrint:$string');
  }
}

class Logger {
  static Logger? _cache;

  ///工厂构造方法
  factory Logger() {
    _cache ??= Logger._internal();
    return _cache!;
  }

  Logger._internal();
}

abstract class Study {
  void study();
}

class StudyFlutter extends Study {
  @override
  void study() {
    print('Learning Flutter !!!');
  }
}

class MixinsTest extends Person with Study {
  MixinsTest(String name, int age) : super(name, age);

  @override
  void study() {
    // TODO: implement study
  }

  @override
  void eat() {
    // TODO: implement eat
  }
}

import 'package:flutter_dart_learn/opp_learn.dart';

///泛型 提高类的复用性

class TestGeneric {
  void start() {
    Cache<String> cache1 = Cache();
    cache1.setItem('cache1', 'Cache1');
    String str1 = cache1.getItem('cache1');
    print('str1:$str1');

    Cache<int> cache2 = Cache();
    cache2.setItem('int2', 2);
    int int2 = cache2.getItem('int2');
    print('int2:$int2');

    Member<Student> m1 = Member(Student("剑桥", "劳埃德", 19,city: '旷工小镇',
        country: ''
        '英国'));
    print(m1.fixedName());
  }
}

class Cache<T> {
  static final Map<String, Object> _cached = {};

  void setItem(String key, T value) {
    _cached[key] = value!;
  }

  T getItem(String key) {
    return _cached[key] as T;
  }
}

class Member<T extends Person> {
  late T _person;

  //泛型作用：约束参数类型
  Member(this._person);

  String fixedName() {
    return 'fixed： ${_person.name}';
  }
}

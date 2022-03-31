class FunctionTest {
  FunctionLearn functionLearn = FunctionLearn();

  void start() {
    functionLearn.sum(1, 2);
    functionLearn._learn();
  }
}

class FunctionLearn {
  ///方法构成：
  ///返回值  可省略，可为void或其他具体类型
  ///方法名  匿名方法不需要方法名
  ///参数    参数类型和参数名，参数类型可省略，分为普通参数、可选参数和默认值参数

  int sum(int val1, int val2) {
    return val1 + val2;
  }

  _learn() {
    print('私有方法');
  }

  anony() {
    var list = [1, 2];
    list.forEach((element) {
      print('$element');
    });
  }
}

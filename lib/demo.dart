library common_lib; //作为Library

import 'dart:collection';
import 'dart:core';
import 'dart:io';

main() {
  var x = 123;
  int y = 123;
  const z = 234;
  const array1 = [1, 2, 3];
  var array2 = [1, 2, 3];
  const validConstString = '$z';

  bool isAdd = true;

  var list = [1, 2, 3];
  var list2 = [0, ...list];
  var sets = {1, 2, 3, if (isAdd) 4};
  var newSets = <int>{}.addAll(sets);
  print(sets);

  var map = {1: "1", 2: "2"};
  map[3] = "3";
  print(map);

  const MAX = 1;

  // outerloop: // This is the label name
  // for (var i = 0; i < 5; i++) {
  //   print("Innerloop: ${i}");
  //   innerloop:
  //
  //   for (var j = 0; j < 5; j++) {
  //     if (j > 3 ) break ;
  //
  //     // Quit the innermost loop
  //     if (i == 2) break innerloop;
  //
  //     // Do the same thing
  //     if (i == 4) break outerloop;
  //
  //     // Quit the outer loop
  //     print("Innerloop: ${j}");
  //   }
  // }
  var lst = [];
  lst.add(3);
  lst.add('4');
  lst.insert(1, 5);
  print(lst);

  // var hashMap = new Map();
  // hashMap["123"] = "1234";
  // hashMap[1] = 23;
  // hashMap[null] = null;
  // hashMap[null] = 2;
  // print(hashMap);

  // var student = Student()
  //   ..name = "小明"
  //   ..gotoSchool();
  // var student = Student.newInstance("小明");
  // print(student.name);
  // ConsolePrinter().print_data();
  // operaSets();
  async();
}

void async() {
  // print("开始时间:${DateTime.now()}");
  // Future.wait([
  //   Future.delayed(const Duration(seconds: 1)),
  //   Future.delayed(const Duration(seconds: 2)),
  //   Future(() => sleep(const Duration(seconds: 3)))
  // ]).then((value) => print("结束时间:${DateTime.now()}")).catchError((e) {
  //   print(e);
  // });
  // task().then((value) => {print("内部结束时间:${DateTime.now()}")});
  // print("外部结束时间:${DateTime.now()}");

  login("xiaoming", "123456").then((value) => print("登录接口返回:$value"));
}

Future<String> login(String userName, String pwd) {
  sleep(const Duration(seconds: 2));
  return Future(() => "$userName login success");
}

Future<void> task() async {
  await Future.delayed(const Duration(seconds: 2));
}

//操作数组
void operaSets() {
  print('operaSets');
  Queue<int> queue = Queue();
  queue.addAll([1, 2, 3]);
  var iterrator = queue.iterator;
  while (iterrator.moveNext()) {
    print(iterrator.current);
  }
}

//接口
class Printer {
  void print_data() {
    print("__________Printing Data__________");
  }
}

class ConsolePrinter extends Printer {
  void print_data() {
    super.print_data();
    print("__________Printing to Console__________");
  }
}

bool isExit() {
  Symbol symbol = Symbol("Student");
  return false;
}

///lambda函数
swapObjLambda(Student student) => student.name = "caixukun";

/// 传参
swapObj(Student student) {
  student.name = "caixukun";
}

swap(int i) {
  i = i * 10;
}

/* 枚举 */
enum Status { start, loading, finish }

class Student {
  Student() {}

  static const String tag = "Student";
  String name = "";

  ///构造函数等同于一个普通函数
  Student.newInstance(this.name) {
    print("this is constructor with param");
  }

  void gotoSchool() {
    print('student go to school');
  }
}

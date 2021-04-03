import 'package:ephysicsapp/screens/Admin/addCalculator.dart';
import 'package:ephysicsapp/widgets/popUps.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';
import 'dart:math';
import 'dart:collection';

String test = "102o3odbec";
Stack stack = Stack();
Stack infixToPostfixStack;
double a, b;
List<double> inputs = [];

class Stack {
  List<dynamic> stack;
  int length;

  Stack(){
    this.stack=[];
    print('Stack initialized.');
  }

  dynamic pop(){
    return this.stack.removeLast();
  }

  void push(dynamic element){
    print("Calling push");
    this.stack.add(element);
  }

  dynamic peak(){
    return this.stack.last;
  }

  void emptyStack(){
    while(this.stack.isNotEmpty){
      pop();
    }
  }
}

// class Stack<double> {
//   final _stack = Queue<double>();
//
//   int get length => _stack.length;
//
//   bool canPop() => _stack.isNotEmpty;
//
//   void clearStack() {
//     while (_stack.isNotEmpty) {
//       _stack.removeLast();
//     }
//   }
//
//   void push(double element) {
//     _stack.addLast(element);
//   }
//
//   double pop() {
//     double lastElement = _stack.last;
//     _stack.removeLast();
//     return lastElement;
//   }
//
//   double peak() => _stack.last;
// }

double getInputByIndex(List input, int index) {
  print("Calling getInputByIndex");
  for (int i = 0; i < input.length; i++) {
    print('Inside for loop.');
    if (index == int.parse(input[i]["index"].toString())) {
      print('If inside getInputByIndex got executed.');
      print(input[i]["value"]);
      return input[i]["value"];
    }
  }
}

double calculateAnswer(String formula, List input) {
  int n = formula.length;
  //print("Formula length");
  //print(n);
  for (int i = 0; i < n; i++) {
    //print("Printing current character");
    //print(formula[i]);
    if (isNum(formula[i])) {
      //print("if block is getting executed");
      //print(getInputByIndex(input, int.parse(formula[i])));
      stack.push(getInputByIndex(input, int.parse(formula[i])));
      //print('Stack:');
      //print(stack.stack.toString());
    } else {
      //print("Else is getting executed");
      stack.push(performOperation(formula[i]));
      //print(stack);
    }
  }
  double ans = stack.pop();
  print(ans.toString());
  return ans;
}

bool isNum(String letter) {
  if (letter == '1' ||
      letter == '2' ||
      letter == '3' ||
      letter == '4' ||
      letter == '5' ||
      letter == '6' ||
      letter == '7' ||
      letter == '8' ||
      letter == '9' ||
      letter == '0') {
    return true;
  } else {
    return false;
  }
}

double performOperation(String letter) {
  switch (letter) {
    case 'a':
      a = stack.pop();
      b = stack.pop();
      return a + b;
      break;

    case 'b':
      a = stack.pop();
      b = stack.pop();
      return b - a;
      break;

    case 'c':
      a = stack.pop();
      b = stack.pop();
      return a * b;
      break;

    case 'd':
      print('inside perform operation.');
      a = stack.pop();
      b = stack.pop();
      return b / a;
      break;

    case 'e':
      a = stack.pop();
      return sqrt(a);
      break;

    case 'f':
      a = stack.pop();
      return sin(a);
      break;

    case 'g':
      a = stack.pop();
      return cos(a);
      break;

    case 'h':
      a = stack.pop();
      return tan(a);
      break;

    case 'i':
      a = stack.pop();
      return log(a);
      break;

    case 'j':
      a = stack.pop();
      return exp(a);
      break;

    case 'k':
      a = stack.pop();
      b = stack.pop();
      return pow(b, a);
      break;

    case 'l':
      a = stack.pop();
      return asin(a);
      break;

    case 'm':
      a = stack.pop();
      return acos(a);
      break;

    case 'n':
      a = stack.pop();
      return atan(a);
      break;

    case 'o':
      a = stack.pop();
      return a * a;
      break;
  }
}

addCalculator({String section, String chapterName}) {
  var uuid = Uuid();
  String uniqueID = uuid.v1();
  try {
    final databaseReference = FirebaseDatabase.instance.reference();
    databaseReference.child("calci").child(section).child(uniqueID).set({
      "moduleName": chapterName,
      "moduleID": uniqueID,
    });
    showToast("Added Sucessfully");
  } catch (e) {
    showToast("Failed");
  }
}

deleteCalculator({String moduleID, String section}) async {
  try {
    await FirebaseDatabase.instance
        .reference()
        .child("calci")
        .child(section)
        .child(moduleID)
        .remove();
    showToast("Removed Successfully");
  } catch (e) {
    showToast("Make sure you're connected to Internet");
  }
}

import 'package:ephysicsapp/screens/Admin/modulesMaster.dart';
import 'package:ephysicsapp/screens/Admin/widgets/moduleCard.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../../services/calcServices.dart';
import 'package:ephysicsapp/screens/users/widgets/cards.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CalcForm extends StatefulWidget {
  CalcForm({Key key, this.probDetails}) : super(key: key);
  final Map probDetails;
  @override
  _CalcFormState createState() => _CalcFormState();
}

class _CalcFormState extends State<CalcForm> {
  final _formKey = GlobalKey<FormState>();
  //final databaseReference = FirebaseDatabase.instance.reference();
  //String dropdownValue1;
  String dropdownValue2;
  String formula;
  final fieldText = TextEditingController();
  List typeOfProb = [];
  //List inputVar = [];
  List userInputVar = [];
  List inputsList = [];
  List inputsListName = [];
  List inputsValue = [];
  List<dynamic> textFormFieldControllers = [];
  List finalInputs = [];
  List finalConstants = [];
  Map modulemap;
  double finalAnswer;
  bool calcPressed = false;
  //bool ignoringDropDownValue1 = false;
  bool ignoringDropDownValue2 = true;

  // void addController(TextEditingController controller) {

  // }

  getConstants() {
    var pd = widget.probDetails["inputVar"];
    for (int i = 0; i < pd.length; i++) {
      if (pd[i]["isConstant"]) {
        finalConstants.add({
          "index": pd[i]["varId"],
          "value": computeExponents(double.parse(pd[i]["value"].toString()),
              double.parse(pd[i]["exponent"].toString()))
        });
      }
    }
  }

  getVariables(){
    userInputVar = [...widget.probDetails["inputVar"]];
    userInputVar.removeWhere(
            (items) => items["isConstant"]);
  }

  double computeExponents(double value, double exponent) {
    double result = value * (pow(10, exponent));
    print("computeExponents");
    print(result);
    return result;
  }

  // getData() async {
  //   await databaseReference
  //       .child("calci")
  //       .child(widget.section)
  //       .child(widget.moduleDetails["moduleID"])
  //       .once()
  //       .then((DataSnapshot dataSnapshot) {
  //     modulemap = dataSnapshot.value;
  //   });
  //   debugPrint(modulemap.toString());
  //
  //   debugPrint(typeOfProb.toString());
  //   setState(() {
  //     typeOfProb = Map.from(modulemap["typeOfProb"]).values.toList();
  //     print(typeOfProb);
  //   });
  // }

  void clearTextInput() {
    for (int i = 0; i < textFormFieldControllers.length; i++) {
      textFormFieldControllers[i]["controller"].clear();
      textFormFieldControllers[i]["expController"].clear();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getConstants();
    getVariables();
    print("Prob Details: "+widget.probDetails.toString());
    print("Final Constants: "+finalConstants.toString());
    print("User Input Var: "+userInputVar.toString());
  }

  getInputVariable() {
    setState(() {
      inputsList = [...userInputVar];
      for (int i = 0; i < userInputVar.length; i++) {
        if (userInputVar[i]["varId"] == dropdownValue2) {
          formula = userInputVar[i]["formula"];
        }
      }
      int remove_val = -1;
      print("inputsListName\n");
      print(inputsListName);
      print("dropdownValue2\n");
      print(dropdownValue2);
      // print(remove_val);
      inputsList.removeWhere((items) => items["varId"] == dropdownValue2);
      print(inputsList);
      for (int i = 0; i < inputsList.length; i++) {
        TextEditingController controller = TextEditingController();
        TextEditingController expController = TextEditingController();
        textFormFieldControllers.add({
          "controller": controller,
          "index": int.parse(inputsList[i]["varId"]),
          "expController": expController,
        });
      }
    });
  }

  TextEditingController assignController(int varId) {
    for (int i = 0; i < textFormFieldControllers.length; i++) {
      if (varId == textFormFieldControllers[i]["index"]) {
        return textFormFieldControllers[i]["controller"];
      }
    }
  }

  TextEditingController assignExpController(int varId) {
    for (int i = 0; i < textFormFieldControllers.length; i++) {
      if (varId == textFormFieldControllers[i]["index"]) {
        return textFormFieldControllers[i]["expController"];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.probDetails["typeName"]),
        ),
        body: Container(
            child: Form(
                key: _formKey,
                child: Container(
                    child: Column(children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(15.0)),
                        DropdownButtonFormField<String>(
                          value: dropdownValue2,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              filled: false,
                              hintStyle: TextStyle(color: Colors.grey[800])),
                          hint: Text("To Calculate"),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue2 = newValue;
                              getInputVariable();
                            });
                          },
                          items: userInputVar
                              .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value["varId"],
                              child: Text(value["varName"]),
                            );
                          }).toList(),
                        )
                      ]),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    child: ListView.builder(
                        // shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: inputsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 145,
                            margin: const EdgeInsets.only(right: 200, left: 10),
                            // color: Colors.amber[colorCodes[index]],
                            child: (Column(children: <Widget>[
                              Text(inputsList[index]["varName"].toString()),
                              TextFormField(
                                controller: assignController(
                                    int.parse(inputsList[index]["varId"])),
                                // onChanged: () async {
                                //   calcPressed
                                //       ? await Fluttertoast.showToast(
                                //           msg:
                                //               "Please clear before calculating again",
                                //           toastLength: Toast.LENGTH_SHORT,
                                //           gravity: ToastGravity.BOTTOM)
                                //       : null;
                                // },
                                decoration: InputDecoration(
                                  // focusedBorder: OutlineInputBorder(
                                  //   borderSide: BorderSide(width: 2.0),
                                  // ),
                                  labelText: 'Insert Value',
                                  hintText: "Insert value",
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              // Text("X10^"),
                              TextField(
                                controller: assignExpController(
                                    int.parse(inputsList[index]["varId"])),
                                decoration: InputDecoration(
                                  // focusedBorder: OutlineInputBorder(
                                  //   borderSide: BorderSide(width: 2.0),
                                  // ),
                                  labelText: "Exponent Value",
                                  hintText: "Insert Exponent value",
                                ),
                              ),
                              // Row(
                              //   children: <Widget>[
                              //     Text("X10^"),
                              //   ],
                              // )
                            ])),
                            // Form(
                            //     child: Column(
                            //   children: <Widget>[
                            //     TextFormField(
                            //       decoration: InputDecoration(
                            //         border: InputBorder.none,
                            //         hintText: "Insert value",
                            //       ),
                            //     ),
                            //   ],
                            // ))
                          );
                        }),
                  ),
                  Container(
                      width: 500.0,
                      height: 40.0,
                      child: Center(
                        child: Text(
                          'Your answer: ' + finalAnswer.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 18.0),
                        ),
                      )),
                  // Text("${finalAnswer.toStringAsFixed(2)}"),
                  SizedBox(height: 40.0),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff022b3a),
                          child: MaterialButton(
                            minWidth: 200,
                            padding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            onPressed: () {
                              if (!calcPressed) {
                                finalInputs.addAll(finalConstants);
                                for (int i = 0;
                                    i < textFormFieldControllers.length;
                                    i++) {
                                  // inputsValue[i] = double.parse(
                                  //     textFormFieldControllers[i].text);
                                  finalInputs.add({
                                    "index": textFormFieldControllers[i]
                                        ["index"],
                                    "value": computeExponents(
                                        double.parse(textFormFieldControllers[i]
                                                ["controller"]
                                            .text),
                                        double.parse(textFormFieldControllers[i]
                                                ["controller"]
                                            .text))
                                  });
                                }
                                print(finalInputs);
                                print(formula);
                                finalAnswer =
                                    calculateAnswer(formula, finalInputs);
                                print(finalAnswer);
                                setState(() {
                                  calcPressed = true;
                                  Text("${finalAnswer.toStringAsFixed(2)}");
                                });
                              } else {
                                Fluttertoast.showToast(
                                    msg:
                                        "Please clear before calculating again",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM);
                              }
                              setState(() {
                                calcPressed = false;
                              });
                            },
                            child: Text('Calculate',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20).copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      SizedBox(width: 30.0),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff022b3a),
                          child: MaterialButton(
                            minWidth: 200,
                            padding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            onPressed: () {
                              setState(() {
                                clearTextInput();
                                finalInputs.clear();
                                // Text("${finalAnswer.toStringAsFixed(2)}");
                                // finalAnswer.clear();
                                finalInputs.addAll(finalConstants);
                              });
                            },
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            child: Text('Clear',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20).copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ])))));
  }
}

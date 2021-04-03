import 'package:ephysicsapp/globals/colors.dart';
import 'package:ephysicsapp/screens/Admin/widgets/calcCard.dart';
import 'package:ephysicsapp/services/calcServices.dart';
import 'package:ephysicsapp/widgets/generalWidgets.dart';
import 'package:flutter/material.dart';

class AddCalculator extends StatefulWidget {
  AddCalculator({Key key, this.title, String section, String chapterName})
      : super(key: key);
  final String title;
  @override
  _AddCalculatorState createState() => _AddCalculatorState();
}

class _AddCalculatorState extends State<AddCalculator> {
  var selectedType;
  List sections = ["1", "2"];
  String selectedSection = "1";
  TextEditingController chapterNameController = TextEditingController();
  // TextEditingController typeNameController = TextEditingController();
  // TextEditingController chapterLinkController = TextEditingController();
  final GlobalKey<FormState> _formKeyValue = GlobalKey<FormState>();
  checkValidation() {
    if (_formKeyValue.currentState.validate()) {
      addCalculator(
        section: selectedSection,
        chapterName: chapterNameController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color1,
        appBar: themeAppBar("Add Calculator"),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKeyValue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(children: <Widget>[
                  Flexible(
                      child: ListTile(
                    title: Text("Physics-I"),
                    leading: Radio(
                      value: sections[0],
                      groupValue: selectedSection,
                      onChanged: (value) {
                        setState(() {
                          selectedSection = value;
                        });
                      },
                    ),
                  )),
                  Flexible(
                    child: ListTile(
                        title: Text("Physics-II"),
                        leading: Radio(
                          value: sections[1],
                          groupValue: selectedSection,
                          onChanged: (value) {
                            setState(() {
                              selectedSection = value;
                            });
                          },
                        )),
                  ),
                ]),
                TextFormField(
                  controller: chapterNameController,
                  validator: (value) {
                    if (value.isEmpty)
                      return "Enter Chapter name";
                    else
                      return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Enter Chapter name",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0),
                    ),
                  ),
                ),
                TextFormField(
                  // controller: chapterNameController,
                  validator: (value) {
                    if (value.isEmpty)
                      return "Enter Type of Problem";
                    else
                      return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Enter Type of Problem",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                // TextFormField(
                //   controller: quizLinkController,
                //   validator: (value){
                //     if(value.isEmpty)
                //       return "Enter Quiz Link";
                //     else return null;
                //   },
                //   maxLines: 4,
                //   minLines: 2,
                //   decoration: InputDecoration(
                //     labelText: "Enter Quiz Link",
                //     fillColor: Colors.white,
                //
                //     focusedBorder: OutlineInputBorder(
                //       borderSide: BorderSide( width: 2.0),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 20,),
                RaisedButton(
                  child: Text(
                    'Create Calculator',
                    style: TextStyle(color: color1),
                  ),
                  onPressed: () {
                    checkValidation();
                  },
                  color: color4,
                ),
              ],
            ),
          ),
        ));
  }
}

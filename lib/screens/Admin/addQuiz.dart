import 'package:ephysicsapp/globals/colors.dart';
import 'package:ephysicsapp/services/moduleServices.dart';
import 'package:ephysicsapp/services/quizServices.dart';
import 'package:ephysicsapp/widgets/generalWidgets.dart';
import 'package:flutter/material.dart';

class AddQuiz extends StatefulWidget {
  AddQuiz({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _AddQuizState createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {

  var selectedType;
  List sections = ["1", "2"];
  String selectedSection="1";

 TextEditingController moduleNameController = TextEditingController();
 TextEditingController quizLinkController = TextEditingController();
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();

  checkValidation()
  {
    if(_formKeyValue.currentState.validate()){
     addQuiz(section:selectedSection,quizName:moduleNameController.text,quizLink: quizLinkController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: themeAppBar("Add New Quiz"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal:20),
        child:Form(
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
                controller: moduleNameController,
                validator: (value){
                  if(value.isEmpty)
                    return "Enter Quiz name";
                  else return null;
                },
                decoration: InputDecoration(
                  labelText: "Enter Quiz name",
                  fillColor: Colors.white,
                  
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide( width: 2.0),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: quizLinkController,
                validator: (value){
                  if(value.isEmpty)
                    return "Enter Quiz Link";
                  else return null;
                },
                decoration: InputDecoration(
                  labelText: "Enter Quiz Link",
                  fillColor: Colors.white,
                  
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide( width: 2.0),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              RaisedButton(
                child: Text(
                  'Create Quiz',
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

import 'package:ephysicsapp/globals/colors.dart';
import 'package:ephysicsapp/screens/Admin/addDoc.dart';
import 'package:ephysicsapp/screens/Admin/widgets/calcCard.dart';
import 'package:ephysicsapp/screens/Admin/widgets/docCard.dart';
import 'package:ephysicsapp/screens/users/widgets/cards.dart';
import 'package:ephysicsapp/services/authentication.dart';
import 'package:ephysicsapp/services/general.dart';
import 'package:ephysicsapp/widgets/generalWidgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CalcTypeOfProbPage extends StatefulWidget {
  CalcTypeOfProbPage({Key key, this.typeOfProb, this.moduleName}) : super(key: key);
  final Map typeOfProb;
  final String moduleName;
  @override
  _CalcTypeOfProbPageState createState() => _CalcTypeOfProbPageState();
}

class _CalcTypeOfProbPageState extends State<CalcTypeOfProbPage> {

  List typeOfProbList = [];
  bool probDefined = true;

  createList(){
    if(widget.typeOfProb!=null){
      widget.typeOfProb.forEach((key, value) {
        typeOfProbList.add(value);
        probDefined = true;
      });
    }
    else{
      probDefined = false;
    }
  }

  @override
  void initState() {
    super.initState();
    createList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: themeAppBar(widget.moduleName),
      body: probDefined ? Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          new Expanded(
            child: new ListView.builder(
              itemCount: typeOfProbList.length,
              itemBuilder: (context, index) {
                return isLoggedIn() ? calcTypeOfProbCard(probDetails: typeOfProbList[index], context: context):
                calcTypeOfProbUserCard(probDetails: typeOfProbList[index], context: context);

              },
            ),
          ),
        ],
      ) : Center(
        child: Container(
          child: Text('No problems defined for this module yet.')
        ),
      )
    );
  }
}

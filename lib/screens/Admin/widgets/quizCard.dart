 import 'package:ephysicsapp/globals/colors.dart';
import 'package:ephysicsapp/screens/Admin/docMaster.dart';
import 'package:ephysicsapp/services/authentication.dart';
import 'package:ephysicsapp/widgets/popUps.dart';
import 'package:flutter/material.dart';

Widget quizCard(
    {int index, Map quizDetails, String section, BuildContext context}) {
  return Container(
      margin: EdgeInsets.fromLTRB(10, 7, 10, 7),
      child:Card(
        elevation: 3,
        color:  color1,
          shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(100)),
    ),
      child:ListTile(  
       contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border:
                  new Border(right: new BorderSide(width: 1.0, color: color5))),
          child: Icon(Icons.book, color: color5),
        ),
        title: Text(
          quizDetails["moduleName"].toString(),
          overflow: TextOverflow.clip,
          maxLines: 1,
          softWrap: false,
          style: TextStyle(
            color: color5,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        trailing:  isLoggedIn()?IconButton(
              icon:Icon(Icons.delete), 
              onPressed: (){
               onDelete(id: quizDetails["quizID"],section:section);
              },
              color: color5
              ):Container(),
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => DocMaster(
          //               section: section,
          //               moduleName: quizDetails["moduleName"],
          //               moduleID: quizDetails["moduleID"],
          //             )));
        },
      )));
}
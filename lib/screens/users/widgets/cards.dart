import 'package:ephysicsapp/globals/colors.dart';
import 'package:ephysicsapp/screens/Admin/docMaster.dart';
import 'package:ephysicsapp/screens/users/calcForm.dart';
import 'package:ephysicsapp/screens/users/calculator/calcTypeOfProbPage.dart';
import 'package:ephysicsapp/services/docServices.dart';
import 'package:ephysicsapp/services/authentication.dart';
import 'package:flutter/material.dart';

Widget moduleUserCard(
    {int index, Map moduleDetails, String section, BuildContext context}) {
  return Container(
      margin: EdgeInsets.fromLTRB(10, 7, 10, 7),
      child: Card(
          elevation: 3,
          color: color1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(100)),
          ),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: color5))),
              child: Icon(Icons.book, color: color5),
            ),
            title: Text(
              moduleDetails["moduleName"].toString(),
              overflow: TextOverflow.visible,
              style: TextStyle(
                color: color5,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            trailing:
                Icon(Icons.keyboard_arrow_right, color: color5, size: 30.0),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DocMaster(
                            section: section,
                            moduleName: moduleDetails["moduleName"],
                            moduleID: moduleDetails["moduleID"],
                          )));
            },
          )));
}

Widget docUserCard(
    {int index,
    Map docDetails,
    String section,
    String moduleID,
    BuildContext context}) {
  return Container(
      margin: EdgeInsets.fromLTRB(10, 7, 10, 7),
      child: Card(
          elevation: 3,
          color: color1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(100)),
          ),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: color5))),
              child: Icon(Icons.note, color: color5),
            ),
            title: Text(
              docDetails["docName"].toString(),
              overflow: TextOverflow.visible,
              style: TextStyle(
                color: color5,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            trailing:
                Icon(Icons.keyboard_arrow_right, color: color5, size: 30.0),
            onTap: () {
              openFile(
                  docDetails["downloadUrl"], context, docDetails["docName"]);
              //openDocProgressIndicator( context, docDetails["downloadUrl"]);// didnt work
            },
          )));
}

Widget calcUserCard(
    {int index, Map calcDetails, String section, BuildContext context}) {
  String moduleName = calcDetails["moduleName"].toString();

  // debugPrint(index.toString());
  // debugPrint(section);
  return Container(
      margin: EdgeInsets.fromLTRB(10, 7, 10, 7),
      child: Card(
          elevation: isLoggedIn() ? 1 : 3,
          color: isLoggedIn() ? color2 : color1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
                right: Radius.circular(isLoggedIn() ? 0 : 100)),
          ),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: color5))),
              child: Icon(Icons.calculate_outlined, color: color5),
            ),
            title: Text(
              moduleName,
              overflow: TextOverflow.visible,
              style: TextStyle(
                color: color5,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            trailing: isLoggedIn()
                ? IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      //  onDelete(id: calcDetails["quizID"],section:section,context: context);
                    },
                    color: color5)
                : null,
            onTap: () {
              //debugPrint('CALC DETAILS: '+calcDetails.toString());
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CalcTypeOfProbPage(typeOfProb: calcDetails['typeOfProb'], moduleName: calcDetails["moduleName"],)));
            },
          )));
}

Widget calcTypeOfProbUserCard({Map probDetails, BuildContext context}) {

  return Container(
      margin: EdgeInsets.fromLTRB(10, 7, 10, 7),
      child: Card(
          elevation: isLoggedIn() ? 1 : 3,
          color: isLoggedIn() ? color2 : color1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
                right: Radius.circular(isLoggedIn() ? 0 : 100)),
          ),
          child: ListTile(
            contentPadding:
            EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: color5))),
              child: Icon(Icons.calculate_outlined, color: color5),
            ),
            title: Text(
              probDetails['typeName'],
              overflow: TextOverflow.visible,
              style: TextStyle(
                color: color5,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            trailing: isLoggedIn()
                ? IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  //  onDelete(id: calcDetails["quizID"],section:section,context: context);
                },
                color: color5)
                : null,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) {
                        return CalcForm(probDetails: probDetails,);
                      }));
            },
          )));
}
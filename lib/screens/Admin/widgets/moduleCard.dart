 import 'package:ephysicsapp/screens/Admin/docMaster.dart';
import 'package:ephysicsapp/widgets/popUps.dart';
import 'package:flutter/material.dart';

Widget moduleCard({int index,Map moduleDetails, String section, BuildContext context}) {
    return Container(
        child: Card(
            elevation: 4,
            margin: EdgeInsets.only(left: 15, right: 15, top: 7, bottom: 7),
            semanticContainer: true,
            color: Colors.amberAccent.shade50,
            child: Container(         
              child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.4,
                      padding: EdgeInsets.only(top: 30,bottom: 30,left: 10,right: 10),
                      //padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Name " +
                               moduleDetails["moduleName"]
                                    .toString(),
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                //fontStyle: FontStyle.italic
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              color: Colors.grey,
                              onPressed: () {
                                onModuleDelete(section: section,moduleID: moduleDetails["moduleID"],context: context,moduleDetails:moduleDetails);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward),
                              color: Colors.grey,
                              onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DocMaster(section: section,moduleID: moduleDetails["moduleID"],)),
                                );
                              },
                            ),
                          ],
                        ))
                  ],
                )
              ],
            ))));
  }
 import 'package:ephysicsapp/globals/colors.dart';
import 'package:ephysicsapp/services/docServices.dart';
import 'package:ephysicsapp/widgets/popUps.dart';
import 'package:flutter/material.dart';

Widget docCard({int index,Map docDetails,String section, String moduleID, BuildContext context}) {
    return GestureDetector(
      onTap: () {
        openFile( docDetails["downloadUrl"],context);
      },
      child: Container(
        child: Card(
            margin: EdgeInsets.only(left: 15, right: 15, top: 7, bottom: 7),
            semanticContainer: true,
            
            child: Container(         
              color:color2,
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
                         
                               docDetails["docName"]
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
                              color: color5,
                              onPressed: () {
                                onDocDelete(docID: docDetails["docID"],section: section,moduleID: moduleID,context: context);
                                 Navigator.of(context).pop(false);
                              },
                            ),
                          
                          ],
                        ))
                  ],
                )
              ],
            )))));
  }
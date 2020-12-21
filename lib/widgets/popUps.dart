 import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:ephysicsapp/services/docServices.dart';
import 'package:ephysicsapp/services/moduleServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


ArsProgressDialog arsProgressDialog(BuildContext context)
{
  return ArsProgressDialog(
	 context,
	 blur: 1,
   dismissable: true,  
  );  
}


showToast(String msg)
{
  return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[800],
        textColor: Colors.white,
        fontSize: 16.0
    );
}

Future<void> onDocDelete({String docID,String moduleID,String section,BuildContext context,}) {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to delete this document?'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Text("NO",style: TextStyle(fontSize: 18),),
          ),
          SizedBox(width: 35),
          new GestureDetector(
            onTap: () async{
              await deleteDoc(docID:docID,moduleID:moduleID,section:section);
              Navigator.of(context).pop(false);
            },
            child: Text("YES" ,style: TextStyle(fontSize: 18),),
          ),
        ],
      ),
    );
  }

  Future<void> onModuleDelete({String moduleID,String section,BuildContext context,Map moduleDetails}) {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to delete this module?'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Text("NO",style: TextStyle(fontSize: 18),),
          ),
          SizedBox(width: 35),
          new GestureDetector(
            onTap: () async{
              await deleteModule(section:section,moduleID:moduleID ,moduleDetails: moduleDetails);
               Navigator.of(context).pop(false);
            },
            child: Text("YES" ,style: TextStyle(fontSize: 18),),
          ),
        ],
      ),
    );
  }
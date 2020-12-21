
import 'package:ephysicsapp/globals/colors.dart';
import 'package:ephysicsapp/screens/Admin/addDoc.dart';
import 'package:ephysicsapp/screens/Admin/widgets/docCard.dart';
import 'package:ephysicsapp/screens/users/widgets/cards.dart';
import 'package:ephysicsapp/services/authentication.dart';
import 'package:ephysicsapp/widgets/generalWidgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DocMaster extends StatefulWidget {
  DocMaster({Key key, this.section,this.moduleID,this.moduleName}) : super(key: key);
  final String section,moduleID,moduleName;
  @override
  _DocMasterState createState() => _DocMasterState();
}

class _DocMasterState extends State<DocMaster> {
  final databaseReference = FirebaseDatabase.instance.reference();
  List documents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: themeAppBar(widget.moduleName),
      body: StreamBuilder(
          stream: databaseReference.child(widget.section).child(widget.moduleID).child("documents").onValue,
          builder: (context, snap) {
            if (snap.hasData &&
                !snap.hasError &&
                snap.data.snapshot.value != null) {
              Map data = snap.data.snapshot.value;
              documents = data.values.toList();

              return new Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  new Expanded(
                    child: new ListView.builder(
                      itemCount: documents.length,
                      itemBuilder: (context, index) {
                         return isLoggedIn()? docCard(index: index, docDetails: documents[index], context: context,section: widget.section,moduleID: widget.moduleID):
                         docUserCard(index: index, docDetails: documents[index], context: context,section: widget.section,moduleID: widget.moduleID);
                        
                      },
                    ),
                  ),
                ],
              );
            } else if (snap.hasData &&
                !snap.hasError &&
                snap.data.snapshot.value == null) {
              return Center(
                child: Text("No data found"),
              );
            } else {
              return Center(
                  child: CircularProgressIndicator(
              ));
            }
          }),
        floatingActionButton:isLoggedIn()? FloatingActionButton(
             backgroundColor: color4,
        onPressed: (){
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddDoc(section:widget.section,moduleID: widget.moduleID,)),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ):Container(), 
    );
  }
}

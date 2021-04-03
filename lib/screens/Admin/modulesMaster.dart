import 'package:ephysicsapp/globals/colors.dart';
import 'package:ephysicsapp/screens/Admin/widgets/moduleCard.dart';
import 'package:ephysicsapp/screens/users/widgets/cards.dart';
import 'package:ephysicsapp/services/authentication.dart';
import 'package:ephysicsapp/services/general.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class ModuleMaster extends StatefulWidget {
  ModuleMaster({Key key, this.section}) : super(key: key);
  final String section;
  @override
  _ModuleMasterState createState() => _ModuleMasterState();
}

class _ModuleMasterState extends State<ModuleMaster> {
  final databaseReference = FirebaseDatabase.instance.reference();
  List modules = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: StreamBuilder(
          stream: databaseReference.child(widget.section).onValue,
          builder: (context, snap) {
            if (snap.hasData &&
                !snap.hasError &&
                snap.data.snapshot.value != null) {
              Map data = snap.data.snapshot.value;
              modules = sortMap(data,"moduleName").values.toList();
              return new Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  new Expanded(
                    child: new ListView.builder(
                      itemCount: modules.length,
                      itemBuilder: (context, index) {
                        return isLoggedIn()?
                        moduleCard(index: index, moduleDetails: modules[index], context: context,section: widget.section):
                        moduleUserCard(index: index, moduleDetails: modules[index], context: context,section: widget.section);  
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
    );
  }
}

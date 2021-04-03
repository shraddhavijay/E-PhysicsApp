import 'package:ephysicsapp/globals/colors.dart';
import 'package:ephysicsapp/screens/Admin/widgets/calcCard.dart';
import 'package:ephysicsapp/screens/users/widgets/cards.dart';
import 'package:ephysicsapp/services/authentication.dart';
import 'package:ephysicsapp/services/general.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CalcList extends StatefulWidget {
  CalcList({Key key, this.section}) : super(key: key);
  final String section;
  @override
  _CalcListState createState() => _CalcListState();
}

class _CalcListState extends State<CalcList> {
  final databaseReference =
      FirebaseDatabase.instance.reference().child("calci");
  List calcDetails = [];

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
              calcDetails = sortMap(data, "moduleName").values.toList();
              return new Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  new Expanded(
                    child: new ListView.builder(
                      itemCount: calcDetails.length,
                      itemBuilder: (context, index) {
                        return isLoggedIn()
                            ? calcCard(
                                index: index,
                                calcDetails: calcDetails[index],
                                context: context,
                                section: widget.section)
                            : calcUserCard(
                                index: index,
                                calcDetails: calcDetails[index],
                                context: context,
                                section: widget.section);
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
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

import 'package:ephysicsapp/globals/colors.dart';
import 'package:ephysicsapp/screens/Admin/widgets/quizCard.dart';
import 'package:ephysicsapp/services/general.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class QuizList extends StatefulWidget {
  QuizList({Key key, this.section}) : super(key: key);
  final String section;
  @override
  _QuizListState createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {
  final databaseReference = FirebaseDatabase.instance.reference().child("quiz");
  List quizDetails = [];

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
              quizDetails = sortMap(data,"quizName").values.toList();
              return new Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  new Expanded(
                    child: new ListView.builder(
                      itemCount: quizDetails.length,
                      itemBuilder: (context, index) {                      
                        return quizCard(index: index, quizDetails: quizDetails[index], context: context,section: widget.section);                       
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

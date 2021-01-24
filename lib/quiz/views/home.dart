import 'package:ephysicsapp/globals/colors.dart';
import 'package:ephysicsapp/quiz/services/database.dart';
import 'package:ephysicsapp/quiz/views/create_quiz.dart';
import 'package:ephysicsapp/quiz/views/quiz_play.dart';
import 'package:ephysicsapp/services/authentication.dart';
import 'package:flutter/material.dart';

class QuizHomePage extends StatefulWidget {
  @override
  _QuizHomePageState createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  Stream quizStream;
  DatabaseService databaseService = new DatabaseService();

  Widget quizList() {
    return Container(
      child: Column(
        children: [
          StreamBuilder(
            stream: quizStream,
            builder: (context, snapshot) {
              return snapshot.data == null
                  ? Container()
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return QuizTile(
                          noOfQuestions: snapshot.data.documents.length,
                        
                          title:
                              snapshot.data.documents[index]['quizTitle'],
                          description:
                              snapshot.data.documents[index]['quizDesc'],
                          id: snapshot.data.documents[index]["id"],
                        );
                      });
            },
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    databaseService.getQuizData().then((value) {
      quizStream = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: quizList(),
      floatingActionButton: isLoggedIn()? FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateQuiz()));
        },
      ):Container(),
    );
  }
}

class QuizTile extends StatelessWidget {
  final String  title, id, description;
  final int noOfQuestions;

  QuizTile(
      {@required this.title,
      @required this.description,
      @required this.id,
      @required this.noOfQuestions});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => QuizPlay(id,title)
        ));
      },
      child: Container(
        padding: EdgeInsets.only(top: 15,left: 10,right: 10),
        height: MediaQuery.of(context).size.height/6,
        child: ListTile(
          tileColor: color2,
          leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border:
                  new Border(right: new BorderSide(width: 1.0, color: color5))),
          child: Icon(Icons.timer_outlined, color: color5),
        ),
          title: Text(
                        title,
                        style: TextStyle(
                            fontSize: 18,
                            color: color5,
                            fontWeight: FontWeight.w500),
                      ),
          subtitle:  Text(
                        description,
                        style: TextStyle(
                            fontSize: 13,
                            color: color5,
                            fontWeight: FontWeight.w500),
                      ) ,
          
           
        ),
      ),
    );
  }
}
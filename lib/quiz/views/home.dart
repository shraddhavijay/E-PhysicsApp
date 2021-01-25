import 'package:ephysicsapp/globals/colors.dart';
import 'package:ephysicsapp/quiz/services/database.dart';
import 'package:ephysicsapp/quiz/views/create_quiz.dart';
import 'package:ephysicsapp/quiz/views/quiz_play.dart';
import 'package:ephysicsapp/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:ephysicsapp/globals/colors.dart';
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
                          title: snapshot.data.documents[index]['quizTitle'],
                          description: snapshot.data.documents[index]
                              ['quizDesc'],
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
      backgroundColor: color1,
      body: quizList(),
      floatingActionButton: isLoggedIn()
          ? FloatingActionButton(
            backgroundColor: color4,
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateQuiz()));
              },
            )
          : Container(),
    );
  }
}

class QuizTile extends StatelessWidget {
  final String title, id, description;
  final int noOfQuestions;

  QuizTile(
      {@required this.title,
      @required this.description,
      @required this.id,
      @required this.noOfQuestions});

  

  @override
  Widget build(BuildContext context) {

 Future<void> onDelete({String id,}) {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to delete this Quiz?'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Text("NO",style: TextStyle(fontSize: 18),),
          ),
          SizedBox(width: 35),
          new GestureDetector(
            onTap: () async{
               deleteQuiz(id);
                Navigator.of(context).pop(false);
            },
            child: Text("YES" ,style: TextStyle(fontSize: 18),),
          ),
        ],
      ),
    );
  }


    return Container(
      margin: EdgeInsets.only(top:10,left:10,right:10),
      height: MediaQuery.of(context).size.height/7,
      child:GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => QuizPlay(id, title)));
      },
      child:Card(
         shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(100)),
    ),
        elevation: 5,
        child: ClipPath(
          
          child: Container(
            
            
            decoration: BoxDecoration(
              
                border:
                    Border(right: BorderSide(color: color5, width: 5))),
            child:Center(child: ListTile(
             // tileColor: color2,
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(
                    border: new Border(
                        right: new BorderSide(width: 1.0, color: color5))),
                child: Icon(Icons.timer_outlined, color: color5),
              ),
              title: Text(
                title,
                style: TextStyle(
                    fontSize: 18, color: color5, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                description,
                style: TextStyle(
                    fontSize: 13, color: color5, fontWeight: FontWeight.w500),
              ),
            trailing:  isLoggedIn()?IconButton(
              icon:Icon(Icons.delete), 
              onPressed: (){
               onDelete(id:id);
              },
              color: color5
              ):Container(),
            ),
          )),
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3))),
        ),
      ),
    ));
  }
}

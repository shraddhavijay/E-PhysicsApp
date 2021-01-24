import 'package:ephysicsapp/quiz/services/database.dart';
import 'package:ephysicsapp/quiz/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:ephysicsapp/globals/colors.dart';
import 'add_question.dart';
import 'package:ephysicsapp/widgets/generalWidgets.dart';
class CreateQuiz extends StatefulWidget {


  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {

  DatabaseService databaseService = new DatabaseService();
  final _formKey = GlobalKey<FormState>();

  String quizTitle, quizDesc;

  bool isLoading = false;
  String quizId;


  createQuiz(){

    quizId = randomAlphaNumeric(16);
    if(_formKey.currentState.validate()){

      setState(() {
        isLoading = true;
      });

      Map<String, String> quizData = {
       
        "quizTitle" : quizTitle,
        "quizDesc" : quizDesc,
        "id":quizId
      };

      databaseService.addQuizData(quizData, quizId).then((value){
        setState(() {
          isLoading = false;
        });
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) =>  AddQuestion(quizId)
        ));
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: color1,
      appBar: themeAppBar("Create Quiz"),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
            // TextFormField(
            //   validator: (val) => val.isEmpty ? "Enter Quiz Image Url" : null,
            //   decoration: InputDecoration(
            //     hintText: "Quiz Image Url (Optional)"
            //   ),
            //   onChanged: (val){
            //     quizImgUrl = val;
            //   },
            // ),
            SizedBox(height: 5,),
            TextFormField(
              validator: (val) => val.isEmpty ? "Enter Quiz Title" : null,
              decoration: InputDecoration(
                hintText: "Quiz Title"
              ),
              onChanged: (val){
                quizTitle = val;
              },
            ),
            SizedBox(height: 5,),
            TextFormField(
              validator: (val) => val.isEmpty ? "Enter Quiz Description" : null,
              decoration: InputDecoration(
                  hintText: "Quiz Description"
              ),
              onChanged: (val){
               quizDesc = val;
              },
            ),
              Spacer(),
             RaisedButton(
                child: Text(
                    "Create Quiz",
                    style: TextStyle(
                        fontSize: 16, color: Colors.white),
                  ),
                  onPressed: (){
                        createQuiz();
                  },
                  color: color5,
                  padding: EdgeInsets.symmetric(horizontal:30,vertical:15),
             ),
              SizedBox(
                height: 60,
              ),
          ],)
          ,),
      ),
    );
  }
}

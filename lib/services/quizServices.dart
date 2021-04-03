import 'package:ephysicsapp/widgets/popUps.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

addQuiz({String section, String quizName, String quizLink}) {
  var uuid = Uuid();
  String uniqueID = uuid.v1();
  try {
    final databaseReference = FirebaseDatabase.instance.reference();
    databaseReference.child("quiz").child(section).child(uniqueID).set({
      "quizName": quizName,
      "quizID": uniqueID,
      "quizLink": quizLink,
    });
    showToast("Added Sucessfully");
  } catch (e) {
    showToast("Failed");
  }
}

deleteQuiz({String quizID, String section}) async {
  try {
    await FirebaseDatabase.instance
        .reference()
        .child("quiz")
        .child(section)
        .child(quizID)
        .remove();
    showToast("Removed Successfully");
  } catch (e) {
    showToast("Make sure you're connected to Internet");
  }
}

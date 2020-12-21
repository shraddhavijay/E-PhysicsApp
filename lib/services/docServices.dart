
import 'dart:io';
import 'package:ephysicsapp/widgets/popUps.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

addDoc({String section, String moduleID,String docName, File doc}) async
{
    var uuid = Uuid();
    String uniqueID = uuid.v1();
    String downloadUrl;
    try{
      var storageReference = FirebaseStorage.instance.ref().child("$section/$moduleID/"+uniqueID);
      var uploadTask = storageReference.putFile(doc);
      await uploadTask.whenComplete(() async {
        await storageReference.getDownloadURL().then((fileURL) {
          downloadUrl=fileURL;
        });
      });

    final databaseReference = FirebaseDatabase.instance.reference();
    await databaseReference.child(section).child(moduleID).child("documents").child(uniqueID).set(
       {
        "docName":docName,
        "docID":uniqueID,
        "downloadUrl": downloadUrl,
       }
     );
     showToast("Added Sucessfully");
    }
    catch(e)
    {
      print(e);
       showToast("Failed");
    }
}

deleteDoc({String docID,String moduleID,String section})async
{
 var storageReference = FirebaseStorage.instance.ref().child("$section/$moduleID/"+docID);
      var uploadTask = storageReference.delete();
      await uploadTask.whenComplete(() async {
       await FirebaseDatabase.instance.reference().child(section).child(moduleID).child("documents").child(docID).remove();
       showToast("Removed Successfully");
      });
}


Future<void> openFile(String url) async {
    if (await canLaunch(url)) {
    await launch(url);
  } else {
    showToast("Failed to open file. Try again");
  }
}
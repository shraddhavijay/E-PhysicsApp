

import 'package:ephysicsapp/widgets/popUps.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

addModule({String section, String modName})
{
    var uuid = Uuid();
    String uniqueID = uuid.v1();
    try{
     final databaseReference = FirebaseDatabase.instance.reference();
     databaseReference.child(section).child(uniqueID).set(
       {
        "moduleName":modName,
        "moduleID":uniqueID,
       }
     );
     showToast("Added Sucessfully");
    }
    catch(e)
    {
       showToast("Failed");
    }
}


deleteModule({String moduleID,String section,Map moduleDetails})async
{
  if(moduleDetails.containsKey("documents"))
    showToast("Empty the folder first");
  else{
  await FirebaseDatabase.instance.reference().child(section).child(moduleID).remove();
  showToast("Removed Successfully");
  }
}
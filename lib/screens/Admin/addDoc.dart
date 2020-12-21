import 'dart:io';
import 'package:ephysicsapp/services/docServices.dart';
import 'package:ephysicsapp/widgets/popUps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';

class AddDoc extends StatefulWidget {
  AddDoc({Key key, this.section,this.moduleID}) : super(key: key);
  final String section,moduleID;
  @override
  _AddDocState createState() => _AddDocState();
}

class _AddDocState extends State<AddDoc> {


  String filePath="";
  File pickedFile;
  TextEditingController docNameController = TextEditingController();
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();

  onFilePick() async
  {
    final params = OpenFileDialogParams(
    dialogType: OpenFileDialogType.document,
    sourceType: SourceType.photoLibrary,
  );
   filePath = await FlutterFileDialog.pickFile(params: params);
    print(filePath.runtimeType);
    setState(() {});

  }
  checkValidation()
  {
    if(_formKeyValue.currentState.validate() && filePath != null){
      if (filePath != null) {
      pickedFile = File(filePath); 
      debugPrint(filePath);   
       addDoc(section:widget.section,moduleID:widget.moduleID,docName:docNameController.text,doc: pickedFile);
      }
    }
    else showToast("Please enter details");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Add module"),
      ),
      body: Container(
        child:Form(
          key: _formKeyValue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          
              TextFormField(
                controller: docNameController,
                validator: (value){
                  if(value.isEmpty)
                    return "Enter document name";
                  else return null;
                },
                decoration: InputDecoration(
                  labelText: "Enter document name",
                  fillColor: Colors.white,                  
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),

              SizedBox(height: 20),
              RaisedButton(onPressed: (){
                onFilePick();
              },
              child: Text("select file"),
              ),
              Text("Selected file: "+ filePath??""),
              SizedBox(height: 20),

              RaisedButton(
                child: Text(
                  'Add Document',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  checkValidation();
                },
                color: Colors.blue,
              ),
          ],
        ),
      ),
      
    ));
  }
}

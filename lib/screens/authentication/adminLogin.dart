
import 'package:ephysicsapp/services/authentication.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  AdminLogin({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {

 

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();

  checkValidation()
  {
    if(_formKeyValue.currentState.validate()){
     login(emailController.text,passwordController.text,context);
    }
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
                controller: emailController,
                validator: (value){
                  if(value.isEmpty)
                    return "Enter Email";
                  else return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Enter Email",
                  fillColor: Colors.white,
                  
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),

              TextFormField(
                controller: passwordController,
                validator: (value){
                  if(value.isEmpty)
                    return "Enter Password";
                  else return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Enter Passwords",
                  fillColor: Colors.white,
                  
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),

              RaisedButton(
                child: Text(
                  'Login',
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

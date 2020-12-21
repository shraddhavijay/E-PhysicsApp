import 'package:ephysicsapp/screens/Admin/homepage.dart';
import 'package:ephysicsapp/screens/users/aboutUs.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool isLoggedIn=false;
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            RaisedButton(onPressed: 
            (){
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutUs()),);
            }
            )
           
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
               Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),);
        },
        tooltip: 'Next',
        child: Icon(Icons.arrow_forward),
      ), 
    );
  }
}

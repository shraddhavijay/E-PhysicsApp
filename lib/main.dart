
import 'package:ephysicsapp/screens/users/intro.dart';
import 'package:ephysicsapp/services/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'globals/colors.dart';


void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  prefs=await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: createMaterialColor(color5),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IntroPage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   bool isLoggedIn=false;
//    @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//       title: Text("Home Page"),
//       actions: [
//         IconButton(icon: Icon(Icons.person), onPressed: () async{                
//                  SharedPreferences prefs = await SharedPreferences.getInstance();
//                   isLoggedIn = (prefs.getBool('isLoggedIn') ?? false);
//                   Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) =>  isLoggedIn == false
//                     ? AdminLogin():HomePage()),);
                
//         })
//       ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
           
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
             
//         },
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), 
//     );
//   }
// }

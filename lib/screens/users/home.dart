import 'package:ephysicsapp/globals/colors.dart';
<<<<<<< HEAD
import 'package:ephysicsapp/screens/Admin/addCalculator.dart';
import 'package:ephysicsapp/screens/Admin/noteshomepage.dart';
import 'package:ephysicsapp/screens/users/calculator/calcHomePage.dart';
=======

import 'package:ephysicsapp/screens/Admin/noteshomepage.dart';
>>>>>>> 9098ce7b3654d93e10dc1014659878588153ac14
import 'package:ephysicsapp/screens/users/intro.dart';
import 'package:ephysicsapp/screens/authentication/adminLogin.dart';
import 'package:ephysicsapp/screens/users/quiz/quizHomePage.dart';
import 'package:ephysicsapp/services/authentication.dart';
import 'package:ephysicsapp/widgets/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

<<<<<<< HEAD
class MyHomePage extends StatefulWidget {
=======

class MyHomePage extends StatefulWidget {

>>>>>>> 9098ce7b3654d93e10dc1014659878588153ac14
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
<<<<<<< HEAD
  int _currentIndex = 0;
  PageController _pageController;
  String appbarText = "Home";
  List titles = ["Home", "Notes", "Play Quiz", "Calculator"];
=======

  int _currentIndex = 0;
  PageController _pageController;
 String appbarText="Home";
 List titles=["Home", "Notes","Play Quiz"];

>>>>>>> 9098ce7b3654d93e10dc1014659878588153ac14
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: Text(
          appbarText,
          style: TextStyle(color: color5),
        ),
        backgroundColor: color1,
        iconTheme: IconThemeData(color: color5),
        elevation: 0,
=======
 title: Text(appbarText,style:TextStyle(color: color5),),
            backgroundColor: color1,
        iconTheme: IconThemeData(
              color: color5
            ),
       elevation: 0,
>>>>>>> 9098ce7b3654d93e10dc1014659878588153ac14
        actions: [
          isLoggedIn()
              ? IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {
                    onLogout(context);
                  },
                )
              : IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AdminLogin()));
                  })
        ],
<<<<<<< HEAD
=======
       


>>>>>>> 9098ce7b3654d93e10dc1014659878588153ac14
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
<<<<<<< HEAD
            setState(() {
              appbarText = titles[_currentIndex];
              _currentIndex = index;
            });
=======
            setState(() { 
               appbarText=titles[_currentIndex];
              _currentIndex = index;});
>>>>>>> 9098ce7b3654d93e10dc1014659878588153ac14
          },
          children: <Widget>[
            IntroPage(),
            NotesHomePage(),
            QuizHomePage(),
<<<<<<< HEAD
            CalcHomePage(),
=======
           
>>>>>>> 9098ce7b3654d93e10dc1014659878588153ac14
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: color1,
        itemCornerRadius: 12,
<<<<<<< HEAD
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              activeColor: color2,
              title: Text(
                'Home',
                style: TextStyle(color: color5),
              ),
              icon: Icon(
                Icons.home,
                color: color5,
              )),
          BottomNavyBarItem(
              activeColor: color2,
              title: Text(
                'Notes',
                style: TextStyle(color: color5),
              ),
              icon: Icon(
                Icons.book,
                color: color5,
              )),
          BottomNavyBarItem(
              activeColor: color2,
              title: Text(
                'Quizzes',
                style: TextStyle(color: color5),
              ),
              icon: Icon(
                Icons.timer,
                color: color5,
              )),
          BottomNavyBarItem(
              activeColor: color2,
              title: Text(
                'Calculator',
                style: TextStyle(color: color5),
              ),
              icon: Icon(
                Icons.calculate,
                color: color5,
              )),
=======
        
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState((){
           
            _currentIndex = index;
            });
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[

           BottomNavyBarItem(
            activeColor: color2,
            
            title: Text('Home',style: TextStyle(color: color5),),
            icon: Icon(Icons.home,color: color5,)
            
          ),
          
          BottomNavyBarItem(
            activeColor: color2,
           
            title: Text('Notes',style: TextStyle(color: color5),),
            icon: Icon(Icons.book,color: color5,)
          ),

           BottomNavyBarItem(
            activeColor: color2,
            title: Text('Quizzes',style: TextStyle(color: color5),),
            icon: Icon(Icons.timer,color: color5,)
          ),
        
>>>>>>> 9098ce7b3654d93e10dc1014659878588153ac14
        ],
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 9098ce7b3654d93e10dc1014659878588153ac14

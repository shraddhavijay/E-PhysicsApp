import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:ephysicsapp/globals/colors.dart';
import 'package:ephysicsapp/quiz/views/home.dart';
import 'package:ephysicsapp/screens/Admin/noteshomepage.dart';
import 'package:ephysicsapp/screens/authentication/adminLogin.dart';
import 'package:ephysicsapp/services/authentication.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;
  PageController _pageController;

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
 title: Text("Homepage"),
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
        backgroundColor: color5,


      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(child:Center(child:Icon(Icons.home))),
            NotesHomePage(),
            QuizHomePage(),
           
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: color5,
        itemCornerRadius: 0,
        
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[

           BottomNavyBarItem(
            activeColor: color2,
            title: Text('Dashboard'),
            icon: Icon(Icons.apps)
          ),
          BottomNavyBarItem(
           activeColor: color2,
           //inactiveColor: ,
            title: Text('Notes'),
            icon: Icon(Icons.home)
          ),
          BottomNavyBarItem(
            activeColor: color2,
            title: Text('Quizzes'),
            icon: Icon(Icons.apps)
          ),
         
        
        ],
      ),
    );
  }
}
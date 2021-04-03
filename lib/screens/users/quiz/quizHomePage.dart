import 'package:ephysicsapp/globals/colors.dart';
import 'package:ephysicsapp/screens/Admin/addQuiz.dart';
import 'package:ephysicsapp/screens/users/quiz/quizList.dart';
import 'package:ephysicsapp/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

<<<<<<< HEAD
=======

>>>>>>> 9098ce7b3654d93e10dc1014659878588153ac14
class QuizHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeWidgetState();
  }
}

<<<<<<< HEAD
class HomeWidgetState extends State<QuizHomePage>
    with TickerProviderStateMixin {
=======
class HomeWidgetState extends State<QuizHomePage> with TickerProviderStateMixin {
>>>>>>> 9098ce7b3654d93e10dc1014659878588153ac14
  final List<Tab> tabs = <Tab>[
    new Tab(text: "Physics- I"),
    new Tab(text: "Physics- II"),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: new AppBar(
        // title: Text("Homepage"),
        // actions: [
        //   isLoggedIn()
        //       ? IconButton(
        //           icon: Icon(Icons.exit_to_app),
        //           onPressed: () {
        //             onLogout(context);
        //           },
        //         )
        //       : IconButton(
        //           icon: Icon(Icons.person),
        //           onPressed: () async {
        //             Navigator.push(context,
        //                 MaterialPageRoute(builder: (context) => AdminLogin()));
        //           })
        // ],
        backgroundColor: color1,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: new TabBar(
          isScrollable: true,
          unselectedLabelColor: color5,
          labelColor: color2,
<<<<<<< HEAD
=======
          
>>>>>>> 9098ce7b3654d93e10dc1014659878588153ac14
          labelPadding: EdgeInsets.symmetric(
              horizontal: (MediaQuery.of(context).size.width / 6)),
          indicatorPadding: EdgeInsets.symmetric(horizontal: 100),
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: new BubbleTabIndicator(
<<<<<<< HEAD
            indicatorHeight: 40.0,
            indicatorColor: color5,
=======
            indicatorHeight:40.0,
            indicatorColor:color5,
>>>>>>> 9098ce7b3654d93e10dc1014659878588153ac14
            indicatorRadius: 10,
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
          ),
          tabs: tabs,
          controller: _tabController,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: tabs.map((Tab tab) {
          String section = "1";
          if (tab.text == tabs[1].text)
            section = "2";
          else
            section = "1";
          return QuizList(section: section);
        }).toList(),
      ),
<<<<<<< HEAD
      floatingActionButton: isLoggedIn()
          ? FloatingActionButton(
              backgroundColor: color4,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddQuiz()),
                );
              },
              child: Icon(
                Icons.add,
              ),
            )
          : Container(),
=======
      floatingActionButton: isLoggedIn()? FloatingActionButton(
        backgroundColor: color4,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddQuiz()),
          );
        },
        child: Icon(Icons.add,),
      ):Container(),
>>>>>>> 9098ce7b3654d93e10dc1014659878588153ac14
    );
  }
}

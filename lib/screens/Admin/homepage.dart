import 'package:ephysicsapp/screens/Admin/addModule.dart';
import 'package:ephysicsapp/screens/authentication/adminLogin.dart';
import 'package:ephysicsapp/services/authentication.dart';

import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

import 'modulesMaster.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeWidgetState();
  }
}

class HomeWidgetState extends State<HomePage> with TickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    new Tab(text: "Physics- 1"),
    new Tab(text: "Physics- 2"),
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
      appBar: new AppBar(
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
        backgroundColor: Colors.amber,
        bottom: new TabBar(
          isScrollable: true,
          unselectedLabelColor: Colors.blue,
          labelColor: Colors.black,
          labelPadding: EdgeInsets.symmetric(
              horizontal: (MediaQuery.of(context).size.width / 6)),
          indicatorPadding: EdgeInsets.symmetric(horizontal: 100),
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: new BubbleTabIndicator(
            indicatorHeight: 35.0,
            indicatorColor: Colors.blue,
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
          return ModuleMaster(section: section);
        }).toList(),
      ),
      floatingActionButton: isLoggedIn()? FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddModule()),
          );
        },
        child: Icon(Icons.add),
      ):Container(),
    );
  }
}

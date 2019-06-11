import 'package:flutter/material.dart';
import 'package:todo_app/bottompage/CameraPage.dart';
import 'package:todo_app/bottompage/AssignmentPage.dart';
import 'package:todo_app/bottompage/SearchPage.dart';
import 'package:todo_app/bottompage/PersonPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTabIndex = 0;

  var tabImages;
  var pageLists;

  @override
  void initState() {
    super.initState();
    tabImages = [
      [Icons.assignment,Icons.assignment],
      [Icons.lightbulb_outline,Icons.lightbulb_outline],
      [Icons.linked_camera,Icons.linked_camera],
      [Icons.person,Icons.person]
    ];

    pageLists = [
      AssignmentPage(),
      SearchPage(),
      CameraPage(),
      PersonPage()
    ];
  }

  void onSearchActionButtonClicked() {}

  Icon getTabIcon(int curIndex) {
    if (curIndex == currentTabIndex) {
      return Icon(tabImages[curIndex][1]);
    }
    return Icon(tabImages[curIndex][0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, //remove appbar shadow
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.grey,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
        actions: <Widget>[
          Container(
            width: 30,
            height: 30,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
                border: Border.all(color: Colors.grey, width: 0.5)),
            margin: EdgeInsets.only(right: 5),
            child: IconButton(
                color: Colors.grey,
                icon: Icon(
                  Icons.search,
                  size: 15,
                ),
                onPressed: onSearchActionButtonClicked),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Item 1'),
              leading: new CircleAvatar(
                child: new Icon(Icons.school),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: getTabIcon(0),title: Text("")),
          new BottomNavigationBarItem(
              icon: getTabIcon(1),title: Text("")),
          new BottomNavigationBarItem(
              icon: getTabIcon(2),title: Text("")),
          new BottomNavigationBarItem(
              icon: getTabIcon(3),title: Text("")),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentTabIndex,
        iconSize: 24.0,
        onTap: (index){
          setState(() {
            currentTabIndex = index;
          });
        },
      ),
      body: pageLists[currentTabIndex],
    );
  }
}

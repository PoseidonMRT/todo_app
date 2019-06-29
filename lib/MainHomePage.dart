import 'package:flutter/material.dart';
import 'package:todo_app/bottompage/PlanDatePage.dart';
import 'package:todo_app/bottompage/HomePage.dart';
import 'package:todo_app/bottompage/GeneraViewPage.dart';
import 'package:todo_app/bottompage/SettingsPage.dart';
import 'package:todo_app/config/Constants.dart';

class MainHomePage extends StatefulWidget {
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int currentTabIndex = 0;

  var tabImages;
  var pageLists;

  bool searchActionVisible = false;
  bool userCenterActionVisible = true;

  @override
  void initState() {
    super.initState();
    tabImages = [
      [Icons.home, Icons.home],
      [Icons.insert_chart, Icons.insert_chart],
      [Icons.date_range, Icons.date_range],
      [Icons.settings, Icons.settings]
    ];

    pageLists = [HomePage(), GeneraViewPage(), PlanDatePage(), SettingsPage()];
  }

  void onSearchActionButtonClicked() {}

  void onUserCenterActionButtonClicked(){
    Navigator.of(context).pushNamed(Constants.personCenterPageRoutesTag);
  }

  Icon getTabIcon(int curIndex) {
    if (curIndex == currentTabIndex) {
      return Icon(
        tabImages[curIndex][1],
        color: Colors.blue,
      );
    }
    return Icon(tabImages[curIndex][0]);
  }

  Widget buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(icon: getTabIcon(0), title: Text("首页")),
        new BottomNavigationBarItem(icon: getTabIcon(1), title: Text("概览")),
        new BottomNavigationBarItem(icon: getTabIcon(2), title: Text("计划")),
        new BottomNavigationBarItem(icon: getTabIcon(3), title: Text("设置")),
      ],
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentTabIndex,
      iconSize: 24.0,
      onTap: (index) {
        setState(() {
          if (index != 3){
            searchActionVisible = false;
            userCenterActionVisible = true;
          }else{
            searchActionVisible = true;
            userCenterActionVisible = false;
          }
          currentTabIndex = index;
        });
      },
    );
  }

  Widget buildBottomAppbar(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          IconButton(
            icon: getTabIcon(0),
            highlightColor: Colors.blue,
            onPressed: () {
              setState(() {
                searchActionVisible = false;
                userCenterActionVisible = true;
                currentTabIndex = 0;
              });
            },
          ),
          IconButton(
            icon: getTabIcon(1),
            onPressed: () {
              setState(() {
                searchActionVisible = false;
                userCenterActionVisible = true;
                currentTabIndex = 1;
              });
            },
          ),
          IconButton(
            icon: getTabIcon(2),
            onPressed: () {
              setState(() {
                searchActionVisible = false;
                userCenterActionVisible = true;
                currentTabIndex = 2;
              });
            },
          ),
          IconButton(
            icon: getTabIcon(3),
            onPressed: () {
              setState(() {
                searchActionVisible = true;
                userCenterActionVisible = false;
                currentTabIndex = 3;
              });
            },
          )
        ],
      ),
    );
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
              color: Colors.black,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
        actions: <Widget>[
          Offstage(
            offstage: searchActionVisible,
            child: Container(
              width: 30,
              height: 30,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
                  border: Border.all(color: Colors.grey, width: 0.5)),
              margin: EdgeInsets.only(right: 16),
              child: IconButton(
                  color: Colors.grey,
                  icon: Icon(
                    Icons.search,
                    size: 15,
                  ),
                  onPressed: onSearchActionButtonClicked),
            ),
          ),
          Offstage(
            offstage: userCenterActionVisible,
            child: Container(
              child: Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.only(right: 16),
                child: IconButton(
                    icon: Icon(
                      Icons.person_pin,
                      size: 15,
                    ),
                    onPressed: onUserCenterActionButtonClicked),
              ),
            ),
          )
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
      bottomNavigationBar: buildBottomNavigationBar(context),
      floatingActionButton: new FloatingActionButton(
        foregroundColor: Colors.white,
        elevation: 5.0,
        onPressed: () {},
        child: new Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: pageLists[currentTabIndex],
    );
  }
}

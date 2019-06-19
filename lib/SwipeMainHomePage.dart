import 'package:flutter/material.dart';
import 'package:todo_app/bottompage/PlanDatePage.dart';
import 'package:todo_app/bottompage/HomePage.dart';
import 'package:todo_app/bottompage/GeneraViewPage.dart';
import 'package:todo_app/bottompage/SettingsPage.dart';

class SwipeMainHomePage extends StatefulWidget {
  @override
  _SwipeMainHomePageState createState() => _SwipeMainHomePageState();
}

class _SwipeMainHomePageState extends State<SwipeMainHomePage> {
  int currentTabIndex = 0;

  var tabImages;
  var pageLists;

  PageController pageController;

  @override
  void initState() {
    super.initState();
    tabImages = [
      [Icons.home,Icons.home],
      [Icons.insert_chart,Icons.insert_chart],
      [Icons.date_range,Icons.date_range],
      [Icons.settings,Icons.settings]
    ];

    pageLists = [
      HomePage(),
      GeneraViewPage(),
      PlanDatePage(),
      SettingsPage()
    ];

    pageController = new PageController(initialPage: 0);
  }

  void onSearchActionButtonClicked() {}

  Icon getTabIcon(int curIndex) {
    if (curIndex == currentTabIndex) {
      return Icon(tabImages[curIndex][1],color: Colors.blue,);
    }
    return Icon(tabImages[curIndex][0]);
  }

  void onBottomNavigationBarTap(int index){
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  Widget buildBottomNavigationBar(BuildContext context){
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            icon: getTabIcon(0),title: Text("首页")),
        new BottomNavigationBarItem(
            icon: getTabIcon(1),title: Text("概览")),
        new BottomNavigationBarItem(
            icon: getTabIcon(2),title: Text("计划")),
        new BottomNavigationBarItem(
            icon: getTabIcon(3),title: Text("设置")),
      ],
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentTabIndex,
      iconSize: 24.0,
      onTap: onBottomNavigationBarTap,
    );
  }

  Widget buildBottomAppbar(BuildContext context){
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
              onBottomNavigationBarTap(0);
            },
          ),
          IconButton(
            icon: getTabIcon(1),
            onPressed: () {
              onBottomNavigationBarTap(1);
            },
          ),
          IconButton(
            icon: getTabIcon(2),
            onPressed: () {
              onBottomNavigationBarTap(2);
            },
          ),
          IconButton(
            icon: getTabIcon(3),
            onPressed: () {
              onBottomNavigationBarTap(3);
            },
          )
        ],
      ),
    );
  }

  Widget buildPageViewBody(BuildContext context){
    return PageView.builder(
        itemBuilder: (BuildContext context,int index){
          return pageLists[index];
        },
      itemCount: 4,
      onPageChanged: onPageChanged,
      controller: pageController,
    );
  }

  void onPageChanged(int index){
    setState(() {
      currentTabIndex = index;
    });
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
            margin: EdgeInsets.only(right: 16),
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
      bottomNavigationBar: buildBottomAppbar(context),
      floatingActionButton: new FloatingActionButton(
        foregroundColor: Colors.white,
        elevation: 5.0,
        onPressed: () {},
        child: new Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: buildPageViewBody(context),
    );
  }

}

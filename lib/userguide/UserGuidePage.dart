import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/config/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'GuidePageOne.dart';
import 'GuidePageTwo.dart';
import 'GuidePageThree.dart';

class UserGuidePage extends StatefulWidget {
  @override
  _UserGuidePageState createState() {
    return new _UserGuidePageState();
  }
}

class _UserGuidePageState extends State<UserGuidePage> {
  SharedPreferences sharedPreferences;

  int currentGuidePageIndex;
  var pageLists;
  bool nextPageActionVisible = false;
  bool mainPageActionVisible = true;

  Future setUserGuideCompleted() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(Constants.keyIsFirstRun, false);
  }

  void userGuideActionComplete() {
    setUserGuideCompleted().whenComplete(() => {
          Navigator.of(context)
              .pushReplacementNamed(Constants.homePageRoutesTag)
        });
  }

  void goNextGuidePage() {
    setState(() {
      currentGuidePageIndex++;
      if (currentGuidePageIndex == 2) {
        mainPageActionVisible = false;
        nextPageActionVisible = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    currentGuidePageIndex = 0;
    pageLists = [
      new GuidePageOne(),
      new GuidePageTwo(),
      new GuidePageThree(),
    ];
  }

  Widget buildIcon(BuildContext context, int index) {
    return Icon(
      Icons.brightness_1,
      color: currentGuidePageIndex == index ? Colors.blue : Colors.grey,
      size: 8,
    );
  }

  Widget buildBottomAppBar(BuildContext context) {
    return Container(
      height: 68,
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Offstage(
            offstage: nextPageActionVisible,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 20)),
                      buildIcon(context, 0),
                      buildIcon(context, 1),
                      buildIcon(context, 2),
                    ],
                  ),
                )),
                Expanded(
                  child: Container(
                    width: 40,
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      child: new Text(
                        "NEXT"+" \ue409",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "MaterialIcons",
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      onPressed: goNextGuidePage,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Offstage(
            offstage: mainPageActionVisible,
            child: GestureDetector(
              onTap: userGuideActionComplete,
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(50),
                  gradient: new LinearGradient(
                      colors: [
                        Color(0xFF68B7CE),
                        Color(0xFF37EBBB),
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                margin: EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new FlatButton(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      color: Colors.transparent,
                      padding: EdgeInsets.only(right: 0),
                      onPressed: userGuideActionComplete,
                    ),
                    new Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: pageLists[currentGuidePageIndex],
      bottomNavigationBar: buildBottomAppBar(context),
    );
  }
}

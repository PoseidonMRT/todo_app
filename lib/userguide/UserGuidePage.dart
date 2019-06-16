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
    sharedPreferences.setBool(Constants.keyIsFirstRun,false);
  }

  void userGuideActionComplete() {
    setUserGuideCompleted().whenComplete(()=>{
      Navigator.of(context).pushReplacementNamed(Constants.homePageRoutesTag)
    });
  }

  void goNextGuidePage(){
    setState(() {
      currentGuidePageIndex++;
      if (currentGuidePageIndex == 2){
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

  Widget buildBottomAppBar(BuildContext context){
    return Container(
      height: 68,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Offstage(
            offstage: nextPageActionVisible,
            child: RaisedButton(
              child: Text('next page'),
              onPressed: goNextGuidePage,
            ),
          ),
          Offstage(
            offstage: mainPageActionVisible,
            child: RaisedButton(
              child: Text('enter main page'),
              onPressed: userGuideActionComplete,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body:pageLists[currentGuidePageIndex],
      bottomNavigationBar: buildBottomAppBar(context),
    );
  }
}
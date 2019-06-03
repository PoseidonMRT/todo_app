import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/config/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserGuidePage extends StatefulWidget {

  @override
  _UserGuidePageState createState() {
    return new _UserGuidePageState();
  }
}

class _UserGuidePageState extends State<UserGuidePage> {

  SharedPreferences sharedPreferences;

  Future setUserGuideCompleted() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(Constants.keyIsFirstRun,false);
  }

  void userGuideActionComplete() {
    setUserGuideCompleted().whenComplete(()=>{
      Navigator.of(context).pushReplacementNamed(Constants.homePageRoutesTag)
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('this is userguide page! click to go main page'),
              onPressed: userGuideActionComplete,
            ),
          ],
        ),
      ),
    );
  }
}
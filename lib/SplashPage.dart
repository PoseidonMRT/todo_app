import 'package:flutter/material.dart';

import 'dart:async';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/homePage');
  }

  @override
  void initState() {
    super.initState();
    startCountDown();
  }

  ///
  void startCountDown(){
    var _duration = new Duration(seconds: 3);
    new Future.delayed(_duration,goHomePage);
  }

  void goHomePage(){
    Navigator.of(context).pushReplacementNamed('/homePage');
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                Color(0xFF68B7CE),
                Color(0xFF37EBBB),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(0.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp)),
      alignment: Alignment.center,
      child: new Text(
        "Helio",
        style: new TextStyle(
          fontFamily: 'DancingBold',
          decoration: TextDecoration.none,
          color: Colors.white,
          fontSize: 60,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:todo_app/config/Constants.dart';

// contain Future delayed async task,
// default count down time is three seconds,
// u can use timeTotal to change total count down times
class SplashPage extends StatefulWidget {

  final int timeTotal;

  const SplashPage({Key key,this.timeTotal}):super(key:key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int timeTotal;

  @override
  void initState() {
    timeTotal = widget.timeTotal ?? Constants.defaultSplashPageDisplayTime;
    super.initState();
    startCountDown();
  }

  void startCountDown(){
    var _duration = new Duration(seconds: timeTotal);
    new Future.delayed(_duration,navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(Constants.homePageRoutesTag);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
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

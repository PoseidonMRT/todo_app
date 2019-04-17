import 'package:flutter/material.dart';
import 'dart:async';

class SplashPageWithTimer extends StatefulWidget {
  @override
  _SplashPageWithTimerState createState() {
    return new _SplashPageWithTimerState();
  }
}

class _SplashPageWithTimerState extends State<SplashPageWithTimer> {

  int timeTotal = 3;
  int countTime = 0;

  Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    releaseTimer();
    super.dispose();
  }

  void startTimer(){
    timer = new Timer.periodic(const Duration(seconds: 1), (timer){
      if (timeTotal - countTime > 0){
        setState(() {
          countTime++;
          timeTotal--;
        });
      }else{
        goHomePage();
      }
    });
  }

  void releaseTimer(){
    countTime = 0;
    timeTotal = 3;
    timer.cancel();
    timer = null;
  }

  void goHomePage(){
    Navigator.of(context).pushReplacementNamed('homePage');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
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
              decoration: TextDecoration.none,
              color: Colors.white,
              fontSize: 60,
            ),
          ),
        ),
        new Container(
          constraints: new BoxConstraints.expand(
            width: 30,
            height: 30
          ),
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: new Border.all(
              color: Colors.lightBlueAccent,
              width: 2.5
            )
          ),
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 360,top: 40),
          child: new Text(
            '$timeTotal',
            style: new TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black54,
              fontSize: 13,
            ),
          ),
        )
      ],
    );
  }
}

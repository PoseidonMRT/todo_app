import 'package:flutter/material.dart';
import 'dart:async';

// contain count down timer widgets,
// default count down time is three seconds,
// u can use timeTotal to change count down times
class SplashPageWithTimer extends StatefulWidget {

  final int timeTotal;

  const SplashPageWithTimer({Key key,this.timeTotal}):super(key:key);

  @override
  _SplashPageWithTimerState createState() {
    return new _SplashPageWithTimerState();
  }
}

class _SplashPageWithTimerState extends State<SplashPageWithTimer> {
  int timeTotal;

  Timer timer;

  @override
  void initState() {
    timeTotal = widget.timeTotal ?? 3;
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
      if (timeTotal > 1){
        setState(() {
          timeTotal--;
        });
      }else{
        goHomePage();
      }
    });
  }

  void releaseTimer(){
    timeTotal = widget.timeTotal ?? 3;
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
              fontFamily: 'DancingBold',
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

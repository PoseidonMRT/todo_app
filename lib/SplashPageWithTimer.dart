import 'package:flutter/material.dart';

class SplashPageWithTimer extends StatefulWidget {
  @override
  _SplashPageWithTimerState createState() {
    return new _SplashPageWithTimerState();
  }
}

class _SplashPageWithTimerState extends State<SplashPageWithTimer> {
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
        new Text(
          "5",
          style: new TextStyle(
            fontFamily: 'DancingBold',
            decoration: TextDecoration.none,
            color: Colors.white,
            fontSize: 60,
          ),
        ),
      ],
    );
  }
}

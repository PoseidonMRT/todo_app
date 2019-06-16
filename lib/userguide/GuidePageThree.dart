import 'package:flutter/material.dart';

class GuidePageThree extends StatefulWidget {

  @override
  _GuidePageThreeState createState() {
    return new _GuidePageThreeState();
  }
}

class _GuidePageThreeState extends State<GuidePageThree> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(1, 245, 246, 249),
      margin: EdgeInsets.only(top: 180,left: 50,right: 50,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Image.asset('assets/images/guide_page3.PNG'),
          new Text('Time Saving & Productive',textAlign: TextAlign.center,textScaleFactor: 1.5,),
          new Padding(padding: EdgeInsets.only(top: 15)),
          new Text('Please enter your email address or phone number to reset your password',textAlign: TextAlign.center,textScaleFactor: 0.8,)
        ],
      ),
    );
  }
}
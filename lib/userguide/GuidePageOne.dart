import 'package:flutter/material.dart';

class GuidePageOne extends StatefulWidget {

  @override
  _GuidePageOneState createState() {
    return new _GuidePageOneState();
  }
}

class _GuidePageOneState extends State<GuidePageOne> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(1, 245, 246, 249),
      margin: EdgeInsets.only(top: 180,left: 50,right: 50,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Image.asset('assets/images/guide_page1.PNG'),
          new Text('Multiple Device',textAlign: TextAlign.center,textScaleFactor: 1.5,),
          new Padding(padding: EdgeInsets.only(top: 15)),
          new Text('Please enter your email address or phone number to reset your password',textAlign: TextAlign.center,textScaleFactor: 0.8,)
        ],
      ),
    );
  }
}
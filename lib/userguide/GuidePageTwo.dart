import 'package:flutter/material.dart';

class GuidePageTwo extends StatefulWidget {

  @override
  _GuidePageTwoState createState() {
    return new _GuidePageTwoState();
  }
}

class _GuidePageTwoState extends State<GuidePageTwo> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(1, 245, 246, 249),
      margin: EdgeInsets.only(top: 180,left: 50,right: 50,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Image.asset('assets/images/guide_page2.PNG'),
          new Text('Grate Reminder',textAlign: TextAlign.center,textScaleFactor: 1.5,),
          new Padding(padding: EdgeInsets.only(top: 15)),
          new Text('Please enter your email address or phone number to reset your password',textAlign: TextAlign.center,textScaleFactor: 0.8,)
        ],
      ),
    );
  }
}
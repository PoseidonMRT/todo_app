import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserGuidePage extends StatefulWidget {

  @override
  _UserGuidePageState createState() {
    return new _UserGuidePageState();
  }
}

class _UserGuidePageState extends State<UserGuidePage> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'this is userguide page!',
            ),
          ],
        ),
      ),
    );
  }
}
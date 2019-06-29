import 'package:flutter/material.dart';

class LanguageListPage extends StatefulWidget {

  @override
  _LanguageListPageState createState() {
    return new _LanguageListPageState();
  }
}

class _LanguageListPageState extends State<LanguageListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Title(color: Colors.blueAccent, child: Text("LanguageList")),
      ),
      body: new Container(
        child: new Text("LaguageList Page"),
      ),
    );
  }
}
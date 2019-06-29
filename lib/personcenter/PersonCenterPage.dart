import 'package:flutter/material.dart';

class PersonCenterPage extends StatefulWidget {

  @override
  _PersonCenterPageState createState() {
    return new _PersonCenterPageState();
  }
}

class _PersonCenterPageState extends State<PersonCenterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Title(color: Colors.blueAccent, child: Text("PersonCenter")),
      ),
      body: new Container(
        child: new Text("PersonCenter Page"),
      ),
    );
  }
}
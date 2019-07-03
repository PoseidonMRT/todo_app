import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() {
    return new _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Title(color: Colors.blueAccent, child: Text("SearchPage")),
      ),
      body: new Container(
        child: new Text("Search Page"),
      ),
    );
  }
}
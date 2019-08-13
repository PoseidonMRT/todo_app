import 'package:flutter/material.dart';
import 'package:todo_app/config/Constants.dart';

class PersonCenterPage extends StatefulWidget {

  @override
  _PersonCenterPageState createState() {
    return new _PersonCenterPageState();
  }
}

class _PersonCenterPageState extends State<PersonCenterPage> {

  _goPlay2048Page(){
    Navigator.of(context).pushNamed(Constants.game2048PageRoutesTag);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Title(color: Colors.blueAccent, child: Text("PersonCenter")),
      ),
      body: new Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            new ListTile(
              title: new Text("PLAY 2018 Games"),
              subtitle: new Text("tap to play 2048 games"),
              onTap: _goPlay2048Page,
            ),
          ],
        ),
      ),
    );
  }
}
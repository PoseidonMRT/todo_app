import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget {

  @override
  _NotificationSettingsPageState createState() {
    return new _NotificationSettingsPageState();
  }
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Title(color: Colors.blueAccent, child: Text("NotificationSettings")),
      ),
      body: new Container(
        child: new Text("NotificationSettings Page"),
      ),
    );
  }
}
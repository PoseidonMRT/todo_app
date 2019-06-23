import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/config/Constants.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() {
    return new _SettingsPageState();
  }
}

class _SettingsPageState extends State<SettingsPage> {
  SharedPreferences sharedPreferences;
  var syncSubTitle;
  bool isAutoSync;

  @override
  void initState() {
    super.initState();
    initSyncAutomaticallyState()
        .whenComplete(() => {getSyncAutomaticallySubTitle()});
  }

  void getSyncAutomaticallySubTitle() {
    if (isAutoSync) {
      syncSubTitle = "Tap to disable sync automatically";
    } else {
      syncSubTitle = "Tap to enable sync automatically";
    }
  }

  void onSyncAutomaticallyTaped() async {
    isAutoSync = !isAutoSync;
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences
        .setBool(Constants.keyIsAutoSync, isAutoSync)
        .whenComplete(() => {
              setState(() {
                getSyncAutomaticallySubTitle();
              })
            });
  }

  Future initSyncAutomaticallyState() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isAutoSync = sharedPreferences.getBool(Constants.keyIsAutoSync);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10, left: 15, bottom: 10),
            child: new Text(
              "General",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 22),
            ),
          ),
          new ListTile(
            leading: new Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 2), blurRadius: 3)
                ],
              ),
              child: new Icon(
                Icons.sync,
                size: 20,
              ),
            ),
            title: new Text(
              "Sync Automatically",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            subtitle: new Text(
              '$syncSubTitle',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w200,
              ),
            ),
            trailing: Container(
              child: Offstage(
                offstage: !isAutoSync,
                child: new Icon(
                  Icons.check,
                  size: 20,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            onTap: onSyncAutomaticallyTaped,
          ),
        ],
      ),
    );
  }
}

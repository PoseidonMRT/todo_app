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

  void navigateToOtherPage(String routeName) {
    Navigator.of(context).pushNamed(routeName);
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

  Future<bool> initSyncAutomaticallyState() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isAutoSync = sharedPreferences.getBool(Constants.keyIsAutoSync);
    debugPrint("isAutoSync='$isAutoSync'");
    return isAutoSync != null;
  }

  bool isAutoSyncEnabled() {
    if (isAutoSync == null) {
      return true;
    }
    return !isAutoSync;
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
            trailing: FutureBuilder<bool>(
              future: initSyncAutomaticallyState(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return new Container(
                    width: 25,
                    child: Offstage(
                      offstage: !isAutoSync,
                      child: new Icon(
                        Icons.check,
                        size: 20,
                        color: Colors.blueAccent,
                      ),
                    ),
                  );
                } else {
                  return new Container(
                    width: 25,
                  );
                }
              },
            ),
            onTap: onSyncAutomaticallyTaped,
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
                Icons.language,
                size: 20,
              ),
            ),
            title: new Text(
              "Language",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            trailing: Container(
              width: 38,
              child: Row(
                children: <Widget>[
                  new Text(
                    "EN",
                    style: TextStyle(
                        fontWeight: FontWeight.w200, color: Colors.grey),
                  ),
                  new Icon(
                    Icons.navigate_next,
                    size: 16,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            onTap: () =>
                {navigateToOtherPage(Constants.languageListPageRoutesTag)},
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
                Icons.notifications,
                size: 20,
              ),
            ),
            title: new Text(
              "Show Notification",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            trailing: Container(
              width: 38,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Icon(
                    Icons.navigate_next,
                    size: 16,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            onTap: () =>
            {navigateToOtherPage(Constants.notificationSettingsPageRoutesTag)},
          ),
        ],
      ),
    );
  }
}

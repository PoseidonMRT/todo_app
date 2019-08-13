import 'package:flutter/material.dart';
import 'package:todo_app/splash/SplashPageWithTimer.dart';
import 'MainHomePage.dart';
import 'package:todo_app/userguide/UserGuidePage.dart';
import 'package:todo_app/config/Constants.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'SwipeMainHomePage.dart';
import 'package:todo_app/settings/LanguageListPage.dart';
import 'package:todo_app/settings/NotificationSettingsPage.dart';
import 'package:todo_app/personcenter/PersonCenterPage.dart';
import 'package:todo_app/search/SearchPage.dart';
import 'package:todo_app/2048/main_page_2048.dart';

void main() {
  initPreferencesData().whenComplete(() => {runApp(MyApp())});
}

Future initPreferencesData() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isFirstRun = preferences.getBool(Constants.keyIsFirstRun);
  bool isAutoSync = preferences.getBool(Constants.keyIsAutoSync);
  if (isFirstRun == null) {
    preferences.setBool(Constants.keyIsFirstRun, true);
  }
  if (isAutoSync == null) {
    preferences.setBool(Constants.keyIsAutoSync, true);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Helio',
        debugShowCheckedModeBanner: Constants.isNeedShowDebugBanner,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashPageWithTimer(),
//    home: SplashPage(),
        routes: <String, WidgetBuilder>{
          Constants.homePageRoutesTag: (BuildContext context) =>
              new MainHomePage(),
          Constants.swipeHomePageRoutesTag: (BuildContext context) =>
              new SwipeMainHomePage(),
          Constants.userGuidePageRoutesTag: (BuildContext context) =>
              new UserGuidePage(),
          Constants.languageListPageRoutesTag: (BuildContext context) =>
              new LanguageListPage(),
          Constants.notificationSettingsPageRoutesTag: (BuildContext context) =>
              new NotificationSettingsPage(),
          Constants.personCenterPageRoutesTag: (BuildContext context) =>
              new PersonCenterPage(),
          Constants.searchPageRoutesTag: (BuildContext context) =>
              new SearchPage(),
          Constants.game2048PageRoutesTag: (BuildContext context) =>
              new MaterialApp(
                theme: new ThemeData(
                    primarySwatch: Colors.blue, fontFamily: 'StarJedi'),
                home: new HomePage2048(),
                debugShowCheckedModeBanner: false,
              ),
        });
  }
}

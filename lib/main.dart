import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/splash/SplashPageWithTimer.dart';
import 'HomePage.dart';
import 'package:todo_app/userguide/UserGuidePage.dart';
import 'package:todo_app/config/Constants.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  initPreferencesData().whenComplete(() => {
    runApp(MyApp())
  });
}

Future initPreferencesData() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isFirstRun = preferences.getBool(Constants.keyIsFirstRun);
  if (isFirstRun == null) {
    preferences.setBool(Constants.keyIsFirstRun, true);
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
          Constants.homePageRoutesTag: (BuildContext context) => new HomePage(),
          Constants.userGuidePageRoutesTag: (BuildContext context) => new UserGuidePage(),
        });
  }
}

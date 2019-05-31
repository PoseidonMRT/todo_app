import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'SplashPageWithTimer.dart';
import 'HomePage.dart';
import 'UserGuidePage.dart';
import 'Constants.dart';
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
    preferences.setBool(Constants.keyIsFirstRun, false);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Helio',
        debugShowCheckedModeBanner: false, //是否显示右上角debug标签，true-显示，false-隐藏
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

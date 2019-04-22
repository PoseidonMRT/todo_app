import 'package:flutter/material.dart';
import 'SplashPageWithTimer.dart';
import 'HomePage.dart';
import 'UserGuidePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Helio',
        debugShowCheckedModeBanner: false,//是否显示右上角debug标签，true-显示，false-隐藏
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashPageWithTimer(),
//    home: SplashPage(),
        routes: <String, WidgetBuilder>{
          'homePage': (BuildContext context) => new HomePage(),
          'userGuidePage': (BuildContext context) => new UserGuidePage(),
        });
  }
}

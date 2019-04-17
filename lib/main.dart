import 'package:flutter/material.dart';
import 'SplashPage.dart';
import 'SplashPageWithTimer.dart';
import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Helio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPageWithTimer(timeTotal: 7,),
//    home: SplashPage(),
      routes: <String,WidgetBuilder>{
        'homePage':(BuildContext context) => new HomePage(),
      }
    );
  }
}

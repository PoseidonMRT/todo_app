import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void onSearchActionButtonClicked() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,//remove appbar shadow
        actions: <Widget>[
          Container(
            width: 30,
            height: 30,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
                border: Border.all(color: Colors.grey, width: 0.5)),
            margin: EdgeInsets.only(right: 5),
            child: IconButton(
                color: Colors.grey,
                icon: Icon(Icons.search,size: 15,),
                onPressed: onSearchActionButtonClicked),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}

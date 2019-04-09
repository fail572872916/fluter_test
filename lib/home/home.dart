import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }

}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar:  new AppBar(
        title: Text('Home'),
        actions: <Widget>[
          new Container()
        ],

      ),
      body: new Center(
        child: null,
      ),
    );
  }

}
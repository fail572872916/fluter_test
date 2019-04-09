import 'package:flutter/material.dart';

class Idea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _IdeaPageState();
  }
}

class _IdeaPageState extends State<Idea> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Idea'),
        actions: <Widget>[
          new Container(),
        ],
      ),
      body: new Center(
        child: null,
      ),
    );
  }
}

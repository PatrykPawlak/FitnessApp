import 'package:flutter/material.dart';
class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('About'),
          backgroundColor: Colors.black38,
        ),
        body: new Column(
          children: <Widget>[
            Text(
                'Fitness app. \n'
                    'Authors: \n'
                    'Patryk Pawlak \n'
                    'Pawel Michalski \n'
                    'Pawel Dzioba',
                style: new TextStyle(fontSize: 20.0, fontFamily: 'Roboto'))
          ],
        ));
    throw UnimplementedError();
  }
}
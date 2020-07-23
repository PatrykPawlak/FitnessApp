import 'package:flutter/material.dart';
import 'package:FitnessApp/screens/about_screen.dart';

import 'about_screen.dart';

class FitnessAppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('main'),
        backgroundColor: Colors.blueAccent,),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => About()),);
              },
            ),
          ],
        ),
      ),
    );
  }
}
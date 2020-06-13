import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          'Settings Screen',
          style: TextStyle(color: Colors.black54, fontSize: 26),
        ),
      ),
    );
  }
}

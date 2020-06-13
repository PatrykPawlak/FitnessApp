import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          'Home Screen',
          style: TextStyle(color: Colors.black54, fontSize: 26),
        ),
      ),
    );
  }
}

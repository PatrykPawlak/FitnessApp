import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.teal,
      child: Text(
        'SecondScreen',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
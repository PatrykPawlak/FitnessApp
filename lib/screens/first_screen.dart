import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.pink,
      child: Text(
        'FirstScreen',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

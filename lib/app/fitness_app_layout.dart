import 'package:flutter/material.dart';
import 'package:FitnessApp/screens/about_screen.dart';

class FitnessAppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AboutScreen(),
        // child: Text('FitnessApp'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:FitnessApp/screens/home_page.dart';
import 'package:FitnessApp/screens/traning_screen.dart';
void main() => runApp(FitnessApp());

class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitnessApp',
      home: WorkoutPlanPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
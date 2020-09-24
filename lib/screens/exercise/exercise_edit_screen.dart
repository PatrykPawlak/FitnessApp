import 'package:flutter/material.dart';
import 'package:FitnessApp/ui/index.dart' show CustomAppBar;

class ExerciseEditScreen extends StatefulWidget {
  _ExerciseEditScreenState createState() => _ExerciseEditScreenState();
}

class _ExerciseEditScreenState extends State<ExerciseEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withTitle('Exercise edit'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
      ),
    );
  }
}
import 'package:FitnessApp/models/exercise.dart';
import 'package:FitnessApp/ui/custom_app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ExerciseDetailScreen extends StatelessWidget {
  ExerciseDetailScreen({@required this.exercise});

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withTitle(exercise.name),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
        child: Column(
          children: <Widget>[
            Text(exercise.name),
            Text(exercise.duration.toString()),
            Text(exercise.durationTimeUnit),
          ],
        ),
      ),
    );
  }
}

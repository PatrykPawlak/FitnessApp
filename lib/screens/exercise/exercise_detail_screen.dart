import 'package:FitnessApp/models/exercise.dart';
import 'package:flutter/material.dart';
import 'package:FitnessApp/ui/index.dart' show CustomAppBar;

class ExerciseDetailScreen extends StatelessWidget {
  final Exercise _exercise;

  ExerciseDetailScreen(this._exercise);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withTitle(_exercise.name),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Name: ${_exercise.name}',
                textAlign: TextAlign.left,
              ),
              Text(
                'Duration: ${_exercise.duration.toString() + ' ' + _exercise.durationTimeUnit}',
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
//
//   _ExerciseDetailScreenState createState() => _ExerciseDetailScreenState();
}

// class ExerciseDetailScreen extends StatefulWidget {
//   final Exercise _exercise;
//   ExerciseDetailScreen(Exercise exercise);
//
//   _ExerciseDetailScreenState createState() => _ExerciseDetailScreenState();
// }

// class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar.withTitle('Exercise detail'),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 24.0),
//       ),
//     );
//   }
// }

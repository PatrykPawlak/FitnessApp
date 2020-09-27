import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:FitnessApp/utils/hive/hive_boxes.dart' show HiveBoxes;
import 'package:FitnessApp/models/index.dart' show Exercise;
import 'package:FitnessApp/router/index.dart' show AppRoutes;
import 'package:FitnessApp/ui/index.dart' show CustomAppBar;

class ExerciseDetailScreen extends StatelessWidget {
  final Exercise _exercise;

  ExerciseDetailScreen(this._exercise);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<Exercise>(HiveBoxes.exercise).listenable(),
      builder: (context, Box<Exercise> box, _) {
        return Scaffold(
          appBar: CustomAppBar.withTitle(_exercise.name),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'Name: ${_exercise.name}',
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Duration: ${_exercise.duration.toString() + ' ' + _exercise.durationTimeUnit}',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.pushNamed(
              context,
              AppRoutes.exerciseEditScreenRoute,
              arguments: _exercise,
            ),
            child: Icon(Icons.edit),
          ),
        );
      },
    );
  }
}

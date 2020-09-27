import 'package:FitnessApp/models/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:FitnessApp/models/index.dart' show Training;
import 'package:FitnessApp/router/index.dart' show AppRoutes;

class TrainingMyTrainingsListItem extends StatelessWidget {
  final Training _training;

  TrainingMyTrainingsListItem(this._training);

  int _getTrainingDuration(List<Exercise> _list) {
    int _duration = 0;

    _list.forEach((_exercise) {
      if (_exercise.durationTimeUnit == describeEnum(DurationTimeUnit.s)) {
        _duration += _exercise.duration;
      } else if (_exercise.durationTimeUnit ==
          describeEnum(DurationTimeUnit.m)) {
        _duration += _exercise.duration * 60;
      } else if (_exercise.durationTimeUnit ==
          describeEnum(DurationTimeUnit.h)) {
        _duration += _exercise.duration * 60 * 60;
      }
    });

    return _duration;
  }

  String _getTrainingDurationString(int _seconds) {
    return _seconds.toString() + 's';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0),
      child: Card(
        elevation: 2.0,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          onTap: () => Navigator.pushNamed(
              context, AppRoutes.trainingDetailScreenRoute,
              arguments: _training),
          title: Text(_training.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 16.0,
              ),
              Text(
                'Number of exercises: ${_training.exercisesList.toList().length}',
                textAlign: TextAlign.left,
              ),
              Text(
                'Duration: ${_getTrainingDurationString(
                  _getTrainingDuration(
                    _training.exercisesList.toList().cast<Exercise>(),
                  ),
                )}',
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}

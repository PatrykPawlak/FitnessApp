import 'package:FitnessApp/models/index.dart';
import 'package:FitnessApp/utils/hive/hive_boxes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:FitnessApp/router/index.dart' show AppRoutes;
import 'package:FitnessApp/models/index.dart' show Exercise, Training;
import 'package:FitnessApp/ui/index.dart' show CustomAppBar;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TrainingDetailScreen extends StatelessWidget {
  final Training _training;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TrainingDetailScreen(this._training);

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
    return ValueListenableBuilder(
      valueListenable: Hive.box<Training>(HiveBoxes.training).listenable(),
      builder: (context, Box<Training> box, _) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar.withTitle(_training.name),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          'Duration: ${_getTrainingDurationString(
                            _getTrainingDuration(
                              _training.exercisesList.toList().cast<Exercise>(),
                            ),
                          )}',
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: _createListView(context),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.pushNamed(
              context,
              AppRoutes.trainingEditScreenRoute,
              arguments: _training,
            ),
            child: Icon(Icons.edit),
          ),
        );
      },
    );
  }

  Widget _createListView(BuildContext context) {
    return ListView.builder(
      itemCount: _training.exercisesList.length,
      itemBuilder: (BuildContext context, int index) {
        Exercise _item = _training.exercisesList[index];
        return _createExerciseItem(context, _item);
      },
    );
  }

  Widget _createExerciseItem(BuildContext context, Exercise _exercise) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
      child: Card(
        elevation: 2.0,
        child: ListTile(
          onTap: () => Navigator.pushNamed(
              context, AppRoutes.exerciseDetailScreenRoute,
              arguments: _exercise),
          title: Text(_exercise.name),
          subtitle: Text(
              'Duration: ${_exercise.duration.toString() + _exercise.durationTimeUnit}'),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}

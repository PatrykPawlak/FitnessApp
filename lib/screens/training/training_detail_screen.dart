import 'package:flutter/material.dart';
import 'package:FitnessApp/router/index.dart' show AppRoutes;
import 'package:FitnessApp/models/index.dart' show Exercise, Training;
import 'package:FitnessApp/screens/exercise/ui/exercise_list_item.dart';
import 'package:FitnessApp/ui/index.dart' show CustomAppBar;

class TrainingDetailScreen extends StatelessWidget {
  final Training _training;

  TrainingDetailScreen(this._training);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withTitle(_training.name),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Name: ${_training.name}',
                textAlign: TextAlign.left,
              ),
              Expanded(
                child: _createListView(context),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, AppRoutes.trainingEditScreenRoute),
        child: Icon(Icons.star),
      ),
    );
  }

  Widget _createListView(BuildContext context) {
    debugPrint(_training.exercisesList.toString());
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
          subtitle:
          Text('Duration: ${_exercise.duration.toString() + _exercise.durationTimeUnit}'),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:FitnessApp/utils/hive/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:FitnessApp/models/index.dart' show Exercise;

part 'training.g.dart';

@HiveType(typeId: 2)
class Training extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  HiveList exercisesList;

  @HiveField(3)
  bool isFavourite;

  Training({
    @required this.id,
    @required this.name,
    @required this.exercisesList,
    this.isFavourite,
  });
}

void initExampleTrainings() {
  Box<Training> _trainingsBox = Hive.box<Training>(HiveBoxes.training);
  Box<Exercise> _exercisesBox = Hive.box<Exercise>(HiveBoxes.exercise);
  Training _tempTraining;

  _tempTraining = Training(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Easy',
    exercisesList: HiveList(_exercisesBox),
  );
  _tempTraining.exercisesList.add(_exercisesBox.getAt(0));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(4));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(13));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(0));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(4));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(13));
  _tempTraining.isFavourite = false;
  _trainingsBox.put(_tempTraining.id, _tempTraining);

  sleep(Duration(milliseconds: 1));

  _tempTraining = Training(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Medium',
    exercisesList: HiveList(_exercisesBox),
  );
  _tempTraining.exercisesList.add(_exercisesBox.getAt(0));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(4));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(14));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(0));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(4));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(14));
  _tempTraining.isFavourite = false;
  _trainingsBox.put(_tempTraining.id, _tempTraining);

  sleep(Duration(milliseconds: 1));

  _tempTraining = Training(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Hard',
    exercisesList: HiveList(_exercisesBox),
  );
  _tempTraining.exercisesList.add(_exercisesBox.getAt(0));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(4));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(14));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(7));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(0));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(4));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(14));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(7));
  _tempTraining.isFavourite = false;
  _trainingsBox.put(_tempTraining.id, _tempTraining);

  sleep(Duration(milliseconds: 1));

  _tempTraining = Training(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Dynamic force',
    exercisesList: HiveList(_exercisesBox),
  );
  _tempTraining.exercisesList.add(_exercisesBox.getAt(0));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(0));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(18));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(4));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(0));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(19));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(4));
  _tempTraining.isFavourite = false;
  _trainingsBox.put(_tempTraining.id, _tempTraining);

  sleep(Duration(milliseconds: 1));

  _tempTraining = Training(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Static force',
    exercisesList: HiveList(_exercisesBox),
  );
  _tempTraining.exercisesList.add(_exercisesBox.getAt(1));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(18));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(2));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(4));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(1));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(18));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(4));
  _tempTraining.isFavourite = false;
  _trainingsBox.put(_tempTraining.id, _tempTraining);

  sleep(Duration(milliseconds: 1));

  _tempTraining = Training(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Muscle endurance',
    exercisesList: HiveList(_exercisesBox),
  );
  _tempTraining.exercisesList.add(_exercisesBox.getAt(2));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(4));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(18));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(2));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(4));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(18));
  _tempTraining.isFavourite = false;
  _trainingsBox.put(_tempTraining.id, _tempTraining);

  sleep(Duration(milliseconds: 1));

  _tempTraining = Training(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Squat',
    exercisesList: HiveList(_exercisesBox),
  );
  _tempTraining.exercisesList.add(_exercisesBox.getAt(20));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(6));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(21));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(20));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(6));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(21));
  _tempTraining.isFavourite = false;
  _trainingsBox.put(_tempTraining.id, _tempTraining);

  sleep(Duration(milliseconds: 1));

  _tempTraining = Training(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Deadlift',
    exercisesList: HiveList(_exercisesBox),
  );
  _tempTraining.exercisesList.add(_exercisesBox.getAt(22));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(23));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(24));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(25));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(0));
  _tempTraining.isFavourite = false;
  _trainingsBox.put(_tempTraining.id, _tempTraining);

  sleep(Duration(milliseconds: 1));

  _tempTraining = Training(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Bench press',
    exercisesList: HiveList(_exercisesBox),
  );
  _tempTraining.exercisesList.add(_exercisesBox.getAt(26));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(27));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(3));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(5));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(11));
  _tempTraining.isFavourite = false;
  _trainingsBox.put(_tempTraining.id, _tempTraining);

  sleep(Duration(milliseconds: 1));

  _tempTraining = Training(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Big biceps',
    exercisesList: HiveList(_exercisesBox),
  );
  _tempTraining.exercisesList.add(_exercisesBox.getAt(29));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(28));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(29));
  _tempTraining.exercisesList.add(_exercisesBox.getAt(28));
  _tempTraining.isFavourite = false;
  _trainingsBox.put(_tempTraining.id, _tempTraining);
}

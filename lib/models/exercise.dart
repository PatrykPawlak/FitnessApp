import 'package:hive/hive.dart';
import 'package:FitnessApp/utils/hive/hive_boxes.dart' show HiveBoxes;
import 'package:FitnessApp/utils/hive/hive_boxes.dart';
import 'package:flutter/foundation.dart';

part 'exercise.g.dart';

enum DurationTimeUnit { s, m, h }

extension DurationTimeUnitParser on String {
  DurationTimeUnit toDurationTimeUnit() => DurationTimeUnit.values.firstWhere(
        (element) => describeEnum(element) == toLowerCase(),
      );
}

@HiveType(typeId: 1)
class Exercise extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  int duration;

  @HiveField(3)
  String durationTimeUnit;

  Exercise({
    @required this.id,
    @required this.name,
    @required this.duration,
    @required this.durationTimeUnit,
  });
}

Future<void> initExercises() async {
  if (Hive.box<Exercise>(HiveBoxes.exercise).isEmpty) {
    await initExampleExercises();
  }
}

Future<void> initExampleExercises() async {
  Box<Exercise> _exercisesBox = Hive.box<Exercise>(HiveBoxes.exercise);
  Exercise _tempExercise;

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Push-ups 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Push-ups 60s',
    duration: 60,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Push-ups on the rails 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Diamond Push-ups 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Squats 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Front squat 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Back squat 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Sit-ups 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Glute bridge 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Lunges 60s',
    duration: 60,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Dumbbell rows 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Dumbbell jump squat 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Standing overhead dumbbell presses 30s',
    duration: 60,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Burpees 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Burpees 60s',
    duration: 60,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Static Runners 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Static Runners 60s',
    duration: 60,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Static Runners 90s',
    duration: 90,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Pull-ups on the stick 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Pull-ups on the stick 60s',
    duration: 60,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Kettlebell goblet squat 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Kettlebell swing 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Kettlebell sumo deadlift 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Deadlift 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Romanian deadlift 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Incline bench press 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Dumbbell bench press 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Bench press 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Standing Dumbbell Curl 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );

  await Future.delayed(
    Duration(
      milliseconds: 1,
    ),
  );

  _tempExercise = Exercise(
    id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
    name: 'Hammer Curl 30s',
    duration: 30,
    durationTimeUnit: describeEnum(DurationTimeUnit.s),
  );

  _exercisesBox.put(
    _tempExercise.id,
    _tempExercise,
  );
}

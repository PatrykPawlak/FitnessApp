import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:FitnessApp/router/index.dart' show AppRoutes;
import 'package:FitnessApp/ui/index.dart' show CustomAppBar, SidebarNavigation;
import 'package:FitnessApp/screens/exercise/ui/index.dart'
    show ExerciseListItem;
import 'package:FitnessApp/models/index.dart' show Exercise, DurationTimeUnit;

class ExerciseListScreen extends StatefulWidget {
  _ExerciseListScreenState createState() => _ExerciseListScreenState();
}

class _ExerciseListScreenState extends State<ExerciseListScreen> {

  final List<Exercise> _exerciseList = <Exercise>[
    Exercise.withID(
      id: 0,
      name: 'Push-ups 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 1,
      name: 'Push-ups 60s',
      duration: 60,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 2,
      name: 'Push-ups on the rails 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 3,
      name: 'Diamond Push-ups 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 4,
      name: 'Squats 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 5,
      name: 'Front squat 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 6,
      name: 'Back squat 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 7,
      name: 'Sit-ups 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 8,
      name: 'Glute bridge 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 9,
      name: 'Lunges 60s',
      duration: 60,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 10,
      name: 'Dumbbell rows 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 11,
      name: 'Dumbbell jump squat 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 12,
      name: 'Standing overhead dumbbell presses 30s',
      duration: 60,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 13,
      name: 'Burpees 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 14,
      name: 'Burpees 60s',
      duration: 60,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 15,
      name: 'Static Runners 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 16,
      name: 'Static Runners 60s',
      duration: 60,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 17,
      name: 'Static Runners 90s',
      duration: 90,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 18,
      name: 'Pull-ups on the stick 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 19,
      name: 'Pull-ups on the stick 60s',
      duration: 60,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 20,
      name: 'Kettlebell goblet squat 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 21,
      name: 'Kettlebell swing 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 22,
      name: 'Kettlebell sumo deadlift 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 23,
      name: 'Deadlift 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 24,
      name: 'Romanian deadlift 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 25,
      name: 'Incline bench press 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 26,
      name: 'Dumbbell bench press 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 27,
      name: 'Bench press 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 28,
      name: 'Standing Dumbbell Curl 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
    Exercise.withID(
      id: 29,
      name: 'Hammer Curl 30s',
      duration: 30,
      durationTimeUnit: describeEnum(DurationTimeUnit.s),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withTitle('Exercise list'),
      drawer: SidebarNavigation(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0,),
        child: _createListView(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, AppRoutes.exerciseAddScreenRoute),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _createListView(BuildContext context) {
    return ListView.builder(
        itemCount: _exerciseList.length,
        itemBuilder: (BuildContext context, int index) {
          Exercise _item = _exerciseList[index];
          return ExerciseListItem(_item);
        });
  }
}

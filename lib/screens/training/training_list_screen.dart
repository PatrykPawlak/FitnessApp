import 'package:FitnessApp/router/index.dart';
import 'package:FitnessApp/screens/training/ui/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:FitnessApp/ui/index.dart' show CustomAppBar, SidebarNavigation;
import 'package:FitnessApp/models/index.dart'
    show Exercise, Training, DurationTimeUnit;

class TrainingListScreen extends StatefulWidget {
  _TrainingListScreenState createState() => _TrainingListScreenState();
}

class _TrainingListScreenState extends State<TrainingListScreen> {
  final List<Training> _trainingList = [
    Training.withID(
      id: 0,
      name: 'Easy',
      exercisesList: List<Exercise>.from(
        [
          Exercise.withID(
            id: 0,
            name: 'Push-ups 30s',
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
            id: 13,
            name: 'Burpees 30s',
            duration: 30,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
          Exercise.withID(
            id: 0,
            name: 'Push-ups 30s',
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
            id: 13,
            name: 'Burpees 30s',
            duration: 30,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
        ],
      ),
    ),
    Training.withID(
      id: 1,
      name: 'Medium',
      exercisesList: List<Exercise>.from(
        [
          Exercise.withID(
            id: 0,
            name: 'Push-ups 30s',
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
            id: 14,
            name: 'Burpees 60s',
            duration: 60,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
          Exercise.withID(
            id: 0,
            name: 'Push-ups 30s',
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
            id: 14,
            name: 'Burpees 60s',
            duration: 60,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
        ],
      ),
    ),
    Training.withID(
      id: 2,
      name: 'Hard',
      exercisesList: List<Exercise>.from(
        [
          Exercise.withID(
            id: 0,
            name: 'Push-ups 30s',
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
            id: 14,
            name: 'Burpees 60s',
            duration: 60,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
          Exercise.withID(
            id: 7,
            name: 'Sit-ups 30s',
            duration: 30,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
          Exercise.withID(
            id: 0,
            name: 'Push-ups 30s',
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
            id: 14,
            name: 'Burpees 60s',
            duration: 60,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
          Exercise.withID(
            id: 7,
            name: 'Sit-ups 30s',
            duration: 30,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
        ],
      ),
    ),
    Training.withID(
      id: 3,
      name: 'Dynamic force',
      exercisesList: List<Exercise>.from(
        [
          Exercise.withID(
            id: 0,
            name: 'Push-ups 30s',
            duration: 30,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
          Exercise.withID(
            id: 0,
            name: 'Push-ups 30s',
            duration: 30,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
          Exercise.withID(
            id: 18,
            name: 'Pull-ups on the stick 30s',
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
            id: 0,
            name: 'Push-ups 30s',
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
            id: 4,
            name: 'Squats 30s',
            duration: 30,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
        ],
      ),
    ),
    Training.withID(
      id: 4,
      name: 'Static force',
      exercisesList: List<Exercise>.from(
        [
          Exercise.withID(
            id: 1,
            name: 'Push-ups 60s',
            duration: 60,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
          Exercise.withID(
            id: 18,
            name: 'Pull-ups on the stick 30s',
            duration: 30,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
          Exercise.withID(
            id: 2,
            name: 'Push-ups on the rails 30s',
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
            id: 1,
            name: 'Push-ups 60s',
            duration: 60,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
          Exercise.withID(
            id: 18,
            name: 'Pull-ups on the stick 30s',
            duration: 30,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
          Exercise.withID(
            id: 4,
            name: 'Squats 30s',
            duration: 30,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
        ],
      ),
    ),
    Training.withID(
      id: 5,
      name: 'Muscle endurance',
      exercisesList: List<Exercise>.from(
        [
          Exercise.withID(
            id: 2,
            name: 'Push-ups on the rails 30s',
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
            id: 18,
            name: 'Pull-ups on the stick 30s',
            duration: 30,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
          Exercise.withID(
            id: 2,
            name: 'Push-ups on the rails 30s',
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
            id: 18,
            name: 'Pull-ups on the stick 30s',
            duration: 30,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
        ],
      ),
    ),
    Training.withID(
      id: 6,
      name: 'Squat',
      exercisesList: List<Exercise>.from(
        [
          Exercise.withID(
            id: 20,
            name: 'Kettlebell goblet squat 30s',
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
            id: 21,
            name: 'Kettlebell swing 30s',
            duration: 30,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
          Exercise.withID(
            id: 20,
            name: 'Kettlebell goblet squat 30s',
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
            id: 21,
            name: 'Kettlebell swing 30s',
            duration: 30,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
        ],
      ),
    ),
    Training.withID(
      id: 7,
      name: 'Deadlift',
      exercisesList: List<Exercise>.from(
        [
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
            id: 0,
            name: 'Push-ups 30s',
            duration: 30,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
        ],
      ),
    ),
    Training.withID(
      id: 8,
      name: 'Bench press',
      exercisesList: List<Exercise>.from(
        [
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
            id: 3,
            name: 'Diamond Push-ups 30s',
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
            id: 11,
            name: 'Dumbbell jump squat 30s',
            duration: 30,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
        ],
      ),
    ),
    Training.withID(
      id: 9,
      name: 'Big biceps',
      exercisesList: List<Exercise>.from(
        [
          Exercise.withID(
            id: 29,
            name: 'Hammer Curl 30s',
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
          Exercise.withID(
            id: 28,
            name: 'Standing Dumbbell Curl 30s',
            duration: 30,
            durationTimeUnit: describeEnum(DurationTimeUnit.s),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withTitle('Training list'),
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
        itemCount: _trainingList.length,
        itemBuilder: (BuildContext context, int index) {
          Training _item = _trainingList[index];
          return TrainingListItem(_item);
        });
  }
}

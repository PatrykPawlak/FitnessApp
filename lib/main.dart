import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:FitnessApp/utils/hive/hive_boxes.dart' show HiveBoxes;
import 'package:FitnessApp/models/index.dart'
    show
        Exercise,
        ExerciseAdapter,
        Settings,
        SettingsAdapter,
        Training,
        TrainingAdapter,
        initExercises,
        initTheme,
        initTrainings;
import 'package:FitnessApp/app/index.dart' show FitnessApp;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SettingsAdapter());
  Hive.registerAdapter(ExerciseAdapter());
  Hive.registerAdapter(TrainingAdapter());

  // uncomment to test
  // await Hive.deleteBoxFromDisk(HiveBoxes.settings);
  // await Hive.deleteBoxFromDisk(HiveBoxes.exercise);
  // await Hive.deleteBoxFromDisk(HiveBoxes.training);

  await Hive.openBox<Settings>(HiveBoxes.settings);
  await Hive.openBox<Exercise>(HiveBoxes.exercise);
  await Hive.openBox<Training>(HiveBoxes.training);

  await initTheme();
  await initExercises();
  await initTrainings();

  runApp(
    ValueListenableBuilder(
      valueListenable: Hive.box<Settings>(HiveBoxes.settings).listenable(),
      builder: (context, Box<Settings> box, _) => FitnessApp(),
    ),
  );
}

import 'package:FitnessApp/models/exercise.dart';
import 'package:FitnessApp/screens/add_training_screen.dart';
import 'package:flutter/material.dart';
import 'package:FitnessApp/router/index.dart' show Routes, ScaleRouteAnimation;
import 'package:FitnessApp/screens/index.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget builder;
    switch (settings.name) {
      //main routes
      case Routes.splashScreenRoute:
        throw Exception('Not implemented route.');
//        builder = SplashScreen();
        break;

      case Routes.homeScreenRoute:
        builder = HomeScreen();
        break;

      case Routes.exercisesScreenRoute:
        builder = ExercisesScreen();
        break;

      case Routes.trainingsScreenRoute:
        builder = TrainingsScreen();
        break;

      case Routes.settingsScreenRoute:
        builder = SettingsScreen();
        break;

      //detail data routes
      case Routes.exerciseDetailScreenRoute:
        // throw Exception('Not implemented route.');
       Exercise e = settings.arguments;
       builder = ExerciseDetailScreen(
         exercise: e,
       );
        break;

      case Routes.trainingDetailScreenRoute:
        throw Exception('Not implemented route.');
//        Training t = settings.arguments;
//        builder = TrainingDetailScreen(
//          training: t,
//        );
        break;

      //edit data routes
      case Routes.exerciseEditScreenRoute:
        // throw Exception('Not implemented route.');
       Exercise e = settings.arguments;
       builder = EditExerciseScreen(
         exercise: e,
       );
        break;

      case Routes.trainingEditScreenRoute:
        throw Exception('Not implemented route.');
//        Training t = settings.arguments;
//        builder = TrainingEditScreen(
//          training: t,
//        );
        break;

      case Routes.exerciseAddScreenRoute:
        // throw Exception('Not implemented route.');
        builder = AddExerciseScreen();
        break;

      case Routes.trainingAddScreenRoute:
        // throw Exception('Not implemented route.');
        builder = AddTrainingScreen();
//        TrainingPlan tp = settings.arguments;
//        builder = TrainingPlanEditScreen(
//          trainingPlan: tp,
//        );
        break;

      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return ScaleRouteAnimation(widget: builder);
  }
}

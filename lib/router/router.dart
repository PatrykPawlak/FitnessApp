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

      case Routes.trainingPlansScreenRoute:
        builder = TrainingPlansScreen();
        break;

      case Routes.settingsScreenRoute:
        builder = SettingsScreen();
        break;

      //detail data routes
      case Routes.exerciseDetailScreenRoute:
        throw Exception('Not implemented route.');
//        Exercise e = settings.arguments;
//        builder = ExerciseDetailScreen(
//          exercise: e,
//        );
        break;

      case Routes.trainingDetailScreenRoute:
        throw Exception('Not implemented route.');
//        Training t = settings.arguments;
//        builder = TrainingDetailScreen(
//          training: t,
//        );
        break;

      case Routes.trainingPlanDetailScreenRoute:
        throw Exception('Not implemented route.');
//        TrainingPlan tp = settings.arguments;
//        builder = TrainingPlanDetailScreen(
//          trainingPlan: tp,
//        );
        break;

    //edit data routes
      case Routes.exerciseEditScreenRoute:
        throw Exception('Not implemented route.');
//        Exercise e = settings.arguments;
//        builder = ExerciseEditScreen(
//          exercise: e,
//        );
        break;

      case Routes.trainingEditScreenRoute:
        throw Exception('Not implemented route.');
//        Training t = settings.arguments;
//        builder = TrainingEditScreen(
//          training: t,
//        );
        break;

      case Routes.trainingPlanEditScreenRoute:
        throw Exception('Not implemented route.');
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

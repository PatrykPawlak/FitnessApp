import 'package:flutter/material.dart';
import 'package:FitnessApp/router/index.dart' show Routes, ScaleRouteAnimation;
import 'package:FitnessApp/screens/index.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget builder;
    switch (settings.name) {
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

      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return ScaleRouteAnimation(widget: builder);
  }
}

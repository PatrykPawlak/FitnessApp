import 'package:FitnessApp/models/index.dart';
import 'package:flutter/material.dart';
import 'package:FitnessApp/router/index.dart' show AppRoutes, ScaleRouteAnimation;
import 'package:FitnessApp/screens/index.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget builder;
    switch (settings.name) {
      //main routes
      case AppRoutes.splashScreenRoute:
        throw Exception('Not implemented route.');
//        builder = SplashScreen();
        break;

      case AppRoutes.homeScreenRoute:
        builder = HomeScreen();
        break;

      case AppRoutes.exerciseListScreenRoute:
        builder = ExerciseListScreen();
        break;

      case AppRoutes.trainingListScreenRoute:
        builder = TrainingListScreen();
        break;

      case AppRoutes.settingsScreenRoute:
        builder = SettingsScreen();
        break;

      //rest of exercise routes
      case AppRoutes.exerciseAddScreenRoute:
        throw Exception('Not implemented route.');
        break;

      case AppRoutes.exerciseEditScreenRoute:
        throw Exception('Not implemented route.');
        break;

      case AppRoutes.exerciseDetailScreenRoute:
        Exercise _exercise = settings.arguments;
        builder = ExerciseDetailScreen(
          _exercise
        );
        break;

    //rest of training routes
      case AppRoutes.trainingAddScreenRoute:
        throw Exception('Not implemented route.');
        break;

      case AppRoutes.trainingEditScreenRoute:
        throw Exception('Not implemented route.');
        break;

      case AppRoutes.trainingDetailScreenRoute:
        Training _training = settings.arguments;
        builder = TrainingDetailScreen(
            _training
        );
        break;

      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return ScaleRouteAnimation(widget: builder);
  }
}

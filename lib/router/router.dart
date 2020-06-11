import 'package:flutter/material.dart';
import 'package:FitnessApp/router/index.dart' show Routes, ScaleRouteAnimation;
import 'package:FitnessApp/screens/index.dart';

class Router {
  static final GlobalKey<NavigatorState> _routerKey =
      GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get routerKey => _routerKey;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget builder;
    switch (settings.name) {
      case Routes.firstScreen:
        builder = FirstScreen();
        break;

      case Routes.secondScreen:
        builder = SecondScreen();
        break;

      case Routes.thirdScreen:
        builder = ThirdScreen();
        break;

      case Routes.fourthScreen:
        builder = FourthScreen();
        break;

      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return ScaleRouteAnimation(widget: builder);
  }
}

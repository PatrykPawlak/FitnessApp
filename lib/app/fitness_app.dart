import 'package:flutter/material.dart';
import 'package:FitnessApp/router/index.dart' show AppRouter, AppRoutes;

class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitnessApp',
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRoutes.homeScreenRoute,
    );
  }
}

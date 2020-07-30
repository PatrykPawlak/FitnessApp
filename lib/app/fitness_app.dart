import 'package:flutter/material.dart';
import 'package:FitnessApp/router/index.dart';

class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitnessApp',
      onGenerateRoute: Router.generateRoute,
      initialRoute: Routes.homeScreenRoute,
    );
  }
}

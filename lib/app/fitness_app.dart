import 'package:flutter/material.dart';
import 'package:FitnessApp/app/fitness_app_layout.dart';

class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitnessApp',
      home: FitnessAppLayout(),
    );
  }
}

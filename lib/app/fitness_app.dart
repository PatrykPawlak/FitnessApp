import 'package:flutter/material.dart';
import 'package:FitnessApp/app/index.dart' show FitnessAppLayout;

class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitnessApp',
      home: FitnessAppLayout(),
    );
  }
}

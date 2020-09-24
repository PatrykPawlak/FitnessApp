import 'package:flutter/material.dart';
import 'package:FitnessApp/ui/index.dart' show CustomAppBar;

class TrainingAddScreen extends StatefulWidget {
  _TrainingAddScreenState createState() => _TrainingAddScreenState();
}

class _TrainingAddScreenState extends State<TrainingAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withTitle('Training add'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
      ),
    );
  }
}
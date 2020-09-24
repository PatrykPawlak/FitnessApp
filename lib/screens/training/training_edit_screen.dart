import 'package:flutter/material.dart';
import 'package:FitnessApp/ui/index.dart' show CustomAppBar;

class TrainingEditScreen extends StatefulWidget {
  _TrainingEditScreenState createState() => _TrainingEditScreenState();
}

class _TrainingEditScreenState extends State<TrainingEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withTitle('Training edit'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
      ),
    );
  }
}
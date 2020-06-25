import 'package:flutter/material.dart';

class TrainingPlan {
  final int id;
  final String name;
  final List<int> trainingsList;

  TrainingPlan({
    @required this.id,
    @required this.name,
    @required this.trainingsList,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'trainingsList': this.trainingsList,
    };
  }
}

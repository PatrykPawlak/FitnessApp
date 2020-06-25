import 'package:flutter/material.dart';

class Training {
  final int id;
  final String name;
  final List<int> exercisesList;

  Training({
    @required this.id,
    @required this.name,
    @required this.exercisesList,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'exercisesList': this.exercisesList,
    };
  }
}

import 'package:FitnessApp/models/exercise.dart';
import 'package:flutter/material.dart';

class Training {
  int id;
  String name;
  List<Exercise> exercisesList;

  Training({
    @required this.name,
    @required this.exercisesList,
  });

  Training.withID({
    @required this.id,
    @required this.name,
    @required this.exercisesList,
  });

  Training.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    exercisesList = map["exercises_list"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "name": name,
      'exercisesList': exercisesList,
    };

    if (id != null) map["id"] = id;

    return map;
  }
}

import 'package:flutter/material.dart';

class Exercise {
  final int id;
  final String name;
  final int duration;
  final String durationTimeUnit;

  Exercise({
    @required this.id,
    @required this.name,
    @required this.duration,
    @required this.durationTimeUnit,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'duration': this.duration,
      'durationTimeUnit': this.durationTimeUnit,
    };
  }
}

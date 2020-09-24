// import 'package:FitnessApp/screens/exercises_screen_widgets/exercise_form.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum DurationTimeUnit { s, m, h }

extension DurationTimeUnitParser on String {
  // operator[](String key) => (name) {
  //   switch(name) {
  //     case 's': return DurationTimeUnit.s;
  //     case 'm': return DurationTimeUnit.m;
  //     case 'h': return DurationTimeUnit.h;
  //     default: throw RangeError('Enum DurationTimeUnit contains no value $name');
  //   }
  // }(key);
  DurationTimeUnit toDurationTimeUnit() => DurationTimeUnit.values.firstWhere(
        (element) => describeEnum(element) == toLowerCase(),
      );
}

class Exercise {
  int id;
  String name;
  int duration;
  String durationTimeUnit;

  Exercise({
    @required this.name,
    @required this.duration,
    @required this.durationTimeUnit,
  });

  Exercise.withID({
    @required this.id,
    @required this.name,
    @required this.duration,
    @required this.durationTimeUnit,
  });

  Exercise.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    duration = map["duration"];
    durationTimeUnit = map["duration_time_unit"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "name": name,
      "duration": duration,
      "duration_time_unit": durationTimeUnit,
    };

    if (id != null) map["id"] = id;

    return map;
  }

  @override
  bool operator ==(other) => other is Exercise && (other.id == id);

  @override
  int get hashCode => id;


}

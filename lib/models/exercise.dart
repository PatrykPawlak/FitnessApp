import 'package:flutter/foundation.dart';

enum DurationTimeUnit { s, m, h }

extension DurationTimeUnitParser on String {
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
}

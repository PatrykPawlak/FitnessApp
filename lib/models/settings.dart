import 'package:FitnessApp/utils/hive/hive_boxes.dart';
import 'package:hive/hive.dart';

part 'settings.g.dart';

@HiveType(typeId: 0)
class Settings extends HiveObject {
  @HiveField(0)
  String setting;

  Settings(this.setting);
}

void initTheme() {
  if (Hive.box<Settings>(HiveBoxes.settings).get('Theme') == null) {
    Hive.box<Settings>(HiveBoxes.settings).put('Theme', Settings('Light'));
  }
}

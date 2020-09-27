import 'package:FitnessApp/utils/hive/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:FitnessApp/router/index.dart' show AppRoutes;
import 'package:FitnessApp/ui/index.dart' show CustomAppBar, SidebarNavigation;
import 'package:FitnessApp/screens/exercise/ui/index.dart'
    show ExerciseListItem;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:FitnessApp/models/index.dart' show Exercise;
import 'package:hive/hive.dart';

class ExerciseListScreen extends StatefulWidget {
  _ExerciseListScreenState createState() => _ExerciseListScreenState();
}

class _ExerciseListScreenState extends State<ExerciseListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withTitle('Exercises'),
      drawer: SidebarNavigation(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: _createListView(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, AppRoutes.exerciseAddScreenRoute),
        child: Icon(
          Icons.add,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }

  Widget _createListView(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<Exercise>(HiveBoxes.exercise).listenable(),
      builder: (context, Box<Exercise> box, _) {
        if (box.values.isEmpty)
          return Center(
            child: Text("Exercise list is empty"),
          );

        return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              Exercise _item = box.getAt(index);
              return ExerciseListItem(_item);
            });
      },
    );
  }
}

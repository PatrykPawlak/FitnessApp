import 'package:FitnessApp/router/index.dart';
import 'package:FitnessApp/screens/training/ui/index.dart';
import 'package:FitnessApp/utils/hive/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:FitnessApp/ui/index.dart' show CustomAppBar, SidebarNavigation;
import 'package:FitnessApp/models/index.dart' show Training;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TrainingListScreen extends StatefulWidget {
  _TrainingListScreenState createState() => _TrainingListScreenState();
}

class _TrainingListScreenState extends State<TrainingListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withTitle('Trainings'),
      drawer: SidebarNavigation(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 44.0,
        ),
        child: _createListView(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, AppRoutes.trainingAddScreenRoute),
        child: Icon(
          Icons.add,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }

  Widget _createListView(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<Training>(HiveBoxes.training).listenable(),
      builder: (context, Box<Training> box, _) {
        if (box.values.isEmpty)
          return Center(
            child: Text("Training list is empty"),
          );

        return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              Training _item = box.getAt(index);
              return TrainingListItem(_item);
            });
      },
    );
  }
}

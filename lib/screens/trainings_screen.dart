import 'package:FitnessApp/router/index.dart';
import 'package:FitnessApp/screens/trainings_screen_widgets/trainings_list.dart';
import 'package:flutter/material.dart';
import 'package:FitnessApp/ui/index.dart' show CustomAppBar, SidebarNavigation;

class TrainingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: SidebarNavigation(),
      body: Container(
        alignment: Alignment.center,
        child: TrainingsList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.pushNamed(context, Routes.trainingAddScreenRoute);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

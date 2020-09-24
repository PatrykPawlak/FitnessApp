import 'package:flutter/material.dart';
import 'package:FitnessApp/ui/index.dart' show CustomAppBar, SidebarNavigation;
import 'package:FitnessApp/router/index.dart';
import 'package:FitnessApp/screens/exercises_screen_widgets/exercises_list.dart';

class ExercisesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: SidebarNavigation(),
      body: Container(
        alignment: Alignment.center,
        child: ExerciseList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Routes.exerciseAddScreenRoute),
        child: Icon(Icons.add),
      ),
    );
  }
}

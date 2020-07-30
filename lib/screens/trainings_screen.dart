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
        child: Text(
          'Trainings Screen',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 26,
          ),
        ),
      ),
    );
  }
}

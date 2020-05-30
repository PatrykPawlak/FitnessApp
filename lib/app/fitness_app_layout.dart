import 'package:flutter/material.dart';
import 'package:FitnessApp/ui/navigation/sidebar_navigation.dart';

class FitnessAppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SidebarNavigation(),
        ],
      ),
    );
  }
}

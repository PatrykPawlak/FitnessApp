import 'package:flutter/material.dart';
import 'package:FitnessApp/router/index.dart' show RouterView;
import 'package:FitnessApp/ui/navigation/index.dart' show SidebarNavigation;

class FitnessAppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: SidebarNavigation(),
      body: Stack(
        children: <Widget>[
          RouterView(),
//          SidebarNavigation(), //MUST be the last
        ],
      ),
    );
  }
}

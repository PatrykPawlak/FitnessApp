import 'package:flutter/material.dart';
import 'package:FitnessApp/ui/index.dart'
    show SidebarNavigationItem;
import 'package:FitnessApp/router/index.dart' show Routes;

class SidebarNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.indigo,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SidebarNavigationItem(
              itemText: 'Home',
              routeName: Routes.homeScreenRoute,
            ),
            Divider(),
            SidebarNavigationItem(
              itemText: 'Exercises',
              routeName: Routes.exercisesScreenRoute,
            ),
            Divider(),
            SidebarNavigationItem(
              itemText: 'Trainings',
              routeName: Routes.trainingsScreenRoute,
            ),
            Divider(),
            SidebarNavigationItem(
              itemText: 'Training plans',
              routeName: Routes.trainingPlansScreenRoute,
            ),
            Divider(),
            SidebarNavigationItem(
              itemText: 'Settings',
              routeName: Routes.settingsScreenRoute,
            ),
          ],
        ),
      ),
    );
  }
}

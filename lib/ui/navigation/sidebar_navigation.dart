import 'package:flutter/material.dart';
import 'package:FitnessApp/router/index.dart' show AppRoutes;
import 'package:FitnessApp/ui/index.dart' show SidebarNavigationItem;

class SidebarNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SidebarNavigationItem(
              itemText: 'Home',
              routeName: AppRoutes.homeScreenRoute,
            ),
            Divider(),
            SidebarNavigationItem(
              itemText: 'Exercises',
              routeName: AppRoutes.exerciseListScreenRoute,
            ),
            Divider(),
            SidebarNavigationItem(
              itemText: 'Trainings',
              routeName: AppRoutes.trainingListScreenRoute,
            ),
            Divider(),
            SidebarNavigationItem(
              itemText: 'Settings',
              routeName: AppRoutes.settingsScreenRoute,
            ),
          ],
        ),
      ),
    );
  }
}

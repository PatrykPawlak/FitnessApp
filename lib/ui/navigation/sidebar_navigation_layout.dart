import 'package:flutter/material.dart';
import 'package:FitnessApp/ui/navigation/index.dart' show SidebarNavigationItem;
import 'package:FitnessApp/router/index.dart' show Routes;

class SidebarNavigationLayout extends StatelessWidget {
  final double _dividerHeight = 60.0;
  final double _dividerThickness = 2.0;

  void _toggle(BuildContext _context) {
    Navigator.pop(_context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SidebarNavigationItem(
            itemText: 'Home',
            routeName: Routes.homeScreenRoute,
            func: () => _toggle(context),
          ),
          Divider(
            height: this._dividerHeight,
            thickness: this._dividerThickness,
          ),
          SidebarNavigationItem(
            itemText: 'Exercises',
            routeName: Routes.exercisesScreenRoute,
            func: () => _toggle(context),
          ),
          Divider(
            height: this._dividerHeight,
            thickness: this._dividerThickness,
          ),
          SidebarNavigationItem(
            itemText: 'Trainings',
            routeName: Routes.trainingsScreenRoute,
            func: () => _toggle(context),
          ),
          Divider(
            height: this._dividerHeight,
            thickness: this._dividerThickness,
          ),
          SidebarNavigationItem(
            itemText: 'Training plans',
            routeName: Routes.trainingPlansScreenRoute,
            func: () => _toggle(context),
          ),
          Divider(
            height: this._dividerHeight,
            thickness: this._dividerThickness,
          ),
          SidebarNavigationItem(
            itemText: 'Settings',
            routeName: Routes.settingsScreenRoute,
            func: () => _toggle(context),
          ),
        ],
      ),
//      ),
    );
  }
}

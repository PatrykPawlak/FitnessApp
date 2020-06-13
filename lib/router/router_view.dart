import 'package:flutter/material.dart';
import 'package:FitnessApp/router/index.dart' show Router, Routes;

class RouterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Router.routerKey,
      initialRoute: Routes.homeScreenRoute,
      onGenerateRoute: Router.generateRoute,
    );
  }
}

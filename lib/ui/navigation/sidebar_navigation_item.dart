import 'package:flutter/material.dart';
import 'package:FitnessApp/router/index.dart' show Router;

class SidebarNavigationItem extends StatelessWidget {
  final String _itemText;
  final String _routeName;
  final VoidCallback _func;

  SidebarNavigationItem({
    @required itemText,
    @required routeName,
    @required func,
  })  : this._itemText = itemText,
        this._routeName = routeName,
        this._func = func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this._func();
        Future.delayed(new Duration(milliseconds: 500), () {
          Router.routerKey.currentState.pushReplacementNamed(_routeName);
        });
      },
      child: Text(
        this._itemText,
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w300,
          color: Colors.white70,
        ),
      ),
    );
  }
}

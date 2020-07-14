import 'package:flutter/material.dart';

class SidebarNavigationItem extends StatelessWidget {
  final String _itemText;
  final String _routeName;

  SidebarNavigationItem({
    @required itemText,
    @required routeName,
  })  : this._itemText = itemText,
        this._routeName = routeName;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        _itemText,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w300,
          color: Colors.white70,
        ),
      ),
      onPressed: () => Navigator.pushNamed(context, _routeName),
      padding: EdgeInsets.all(20),
    );
  }
}

import 'package:flutter/material.dart';

class SidebarNavigationItem extends StatelessWidget {
  final String _itemText;
  final Function _func;

  SidebarNavigationItem({
    @required itemText,
    @required func,
  })  : this._itemText = itemText,
        this._func = func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this._func,
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

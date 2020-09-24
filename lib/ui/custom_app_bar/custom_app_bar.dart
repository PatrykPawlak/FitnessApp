import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar() : super(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.indigo,
          ),
        );

  CustomAppBar.withTitle(String _title) : super(
    title: Text(_title, style: TextStyle(color: Colors.black54),),
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.indigo,
    ),
  );
}

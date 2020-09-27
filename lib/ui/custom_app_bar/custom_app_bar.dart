import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar() : super();

  CustomAppBar.withTitle(String _title)
      : super(
          title: Text(
            _title,
          ),
        );
}

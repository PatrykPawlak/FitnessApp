import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar()
      : super(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.indigo,
          ),
        );
}

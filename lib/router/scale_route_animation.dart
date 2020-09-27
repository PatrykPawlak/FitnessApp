import 'package:flutter/material.dart';

class ScaleRouteAnimation extends PageRouteBuilder {
  final Widget widget;

  ScaleRouteAnimation({this.widget})
      : super(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              widget,
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}

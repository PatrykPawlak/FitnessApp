import 'package:flutter/material.dart';
import 'package:FitnessApp/screens/home_page.dart';

void main() => runApp(FitnessApp());

class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FitnessApp',
        home: JsonPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
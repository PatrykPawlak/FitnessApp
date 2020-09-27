import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:FitnessApp/utils/hive/hive_boxes.dart';
import 'package:FitnessApp/models/index.dart' show Settings;
import 'package:FitnessApp/router/index.dart' show AppRouter, AppRoutes;

class FitnessApp extends StatefulWidget {
  _FitnessAppState createState() => _FitnessAppState();
}

class _FitnessAppState extends State<FitnessApp> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<Settings>(HiveBoxes.settings).listenable(),
      builder: (context, Box<Settings> box, widget) {
        return MaterialApp(
          title: 'FitnessApp',
          debugShowCheckedModeBanner: false,
          theme: _lightTheme,
          darkTheme: _darkTheme,
          themeMode:
              Hive.box<Settings>(HiveBoxes.settings).get('Theme').setting ==
                      'Dark'
                  ? ThemeMode.dark
                  : ThemeMode.light,
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute:
              Hive.box<Settings>(HiveBoxes.settings).get('Username') ==
                      null
                  ? AppRoutes.welcomeScreenRoute
                  : AppRoutes.homeScreenRoute,
        );
      },
    );
  }

  ThemeData _lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.indigo,
    accentColor: Colors.pinkAccent,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    primaryIconTheme: IconThemeData(
      color: Colors.indigo,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.indigo,
      textTheme: ButtonTextTheme.primary,
    ),
    dividerTheme: DividerThemeData(
      color: Color.fromRGBO(
        Colors.white.red,
        Colors.white.green,
        Colors.white.blue,
        0.1,
      ),
      thickness: 2.0,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      color: Colors.transparent,
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 20.0,
          color: Colors.black54,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: Colors.indigo,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.indigo,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.indigo,
      splashColor: Colors.indigo.withOpacity(0.25),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.indigo,
      ),
      bodyText2: TextStyle(
        fontSize: 16.0,
        color: Colors.black54,
      ),
      subtitle1: TextStyle(
        color: Colors.black54,
      ),
      subtitle2: TextStyle(
        color: Colors.black54,
      ),
      caption: TextStyle(
        color: Colors.black54,
      ),
      headline4: TextStyle(
        color: Colors.black54,
      ),
      headline5: TextStyle(
        color: Colors.black54,
      ),
      headline6: TextStyle(
        color: Colors.black54,
      ),
    ),
  );

  ThemeData _darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.pink,
    accentColor: Colors.indigoAccent,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    primaryIconTheme: IconThemeData(
      color: Colors.pink,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.pink,
      textTheme: ButtonTextTheme.primary,
    ),
    dividerTheme: DividerThemeData(
      color: Color.fromRGBO(
        Colors.white.red,
        Colors.white.green,
        Colors.white.blue,
        0.2,
      ),
      thickness: 2.0,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      color: Colors.transparent,
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: Colors.pink,
      ),
      hintStyle: TextStyle(
        color: Colors.white,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.pink,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.pink,
      splashColor: Colors.pink.withOpacity(0.25),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.pink,
      ),
      bodyText2: TextStyle(
        fontSize: 16.0,
        color: Colors.white,
      ),
      subtitle1: TextStyle(
        color: Colors.white,
      ),
      subtitle2: TextStyle(
        color: Colors.white,
      ),
      caption: TextStyle(
        color: Colors.white,
      ),
      headline4: TextStyle(
        color: Colors.white,
      ),
      headline5: TextStyle(
        color: Colors.white,
      ),
      headline6: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}

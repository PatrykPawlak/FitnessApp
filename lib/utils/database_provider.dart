import 'dart:async';
import 'package:FitnessApp/models/training.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:FitnessApp/models/exercise.dart';

class DatabaseProvider {
  static const EXERCISES_TABLE = 'exercises';
  static const EXERCISE_COLUMN_ID = 'id';
  static const EXERCISE_COLUMN_NAME = 'name';
  static const EXERCISE_COLUMN_DURATION = 'duration';
  static const EXERCISE_COLUMN_DURATION_TIME_UNIT = 'duration_time_unit';

  static const TRAININGS_TABLE = 'trainings';
  static const TRAININGS_COLUMN_ID = 'id';
  static const TRAININGS_COLUMN_NAME = 'name';

  static const TRAININGS_EXERCISES_TABLE = 'trainings_exercises';
  static const TRAININGS_EXERCISES_COLUMN_ID = 'id';
  static const TRAININGS_EXERCISES_COLUMN_EXERCISE_ID = 'exercise_id';
  static const TRAININGS_EXERCISES_COLUMN_TRAINING_ID = 'training_id';

  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();

  static Database _database;

  Future<Database> get instance async {
    if (_database != null) {
      return _database;
    }

    _database = await _initDatabase();

    // debugPrint("!! DB: Get instance");
    return _database;
  }

  Future<Database> _initDatabase() async {
    String _dbPath = await getDatabasesPath();

    const String _exercises_sql = '''
        CREATE TABLE $EXERCISES_TABLE (
        $EXERCISE_COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT, 
        $EXERCISE_COLUMN_NAME TEXT NOT NULL, 
        $EXERCISE_COLUMN_DURATION INTEGER NOT NULL, 
        $EXERCISE_COLUMN_DURATION_TIME_UNIT TEXT NOT NULL)
        ''';

    const String _trainings_sql = '''
        CREATE TABLE $TRAININGS_TABLE (
        $TRAININGS_COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT,
        $TRAININGS_COLUMN_NAME TEXT NOT NULL)
        ''';

    const String _trainings_exercises_sql = '''
        CREATE TABLE $TRAININGS_EXERCISES_TABLE (
        $TRAININGS_EXERCISES_COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT,
        $TRAININGS_EXERCISES_COLUMN_EXERCISE_ID INTEGER NOT NULL,
        $TRAININGS_EXERCISES_COLUMN_TRAINING_ID INTEGER NOT NULL,
        FOREIGN KEY ($TRAININGS_EXERCISES_COLUMN_EXERCISE_ID) REFERENCES $EXERCISES_TABLE ($EXERCISE_COLUMN_ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
        FOREIGN KEY ($TRAININGS_EXERCISES_COLUMN_TRAINING_ID) REFERENCES $TRAININGS_TABLE ($TRAININGS_COLUMN_ID) ON DELETE NO ACTION ON UPDATE NO ACTION)
        ''';

    Future<void> _insertOnCreate(Database db) async {
      Exercise _first = Exercise(name: 'Push-ups - 30s', duration: 30, durationTimeUnit: describeEnum(DurationTimeUnit.s));
      Exercise _second = Exercise(name: 'Push-ups - 60s', duration: 60, durationTimeUnit: describeEnum(DurationTimeUnit.s));
      db.insert(EXERCISES_TABLE, _first.toMap());
      db.insert(EXERCISES_TABLE, _second.toMap());
    }

    Future<void> _onCreate(Database db, int v) async {
      await db.execute(_exercises_sql);
      await db.execute(_trainings_sql);
      await db.execute(_trainings_exercises_sql);

      _insertOnCreate(db);
    }

    Future<void> _onUpgrade(Database db, int oldV, int newV) async {
      _onCreate(db, newV);
    }

    Future<void> _onConfigure(Database db) async {
      await db.execute('PRAGMA foreign_keys = ON');
    }

    return await openDatabase(
      join(_dbPath, "fitnessAppDatabaseV2.db"),
      version: 1, onCreate: _onCreate, onConfigure: _onConfigure, onUpgrade: _onUpgrade,
//      onCreate: (Database database, int version) async {
//        debugPrint("!! DB: Create exercises table");
////        debugPrint("!! DB: PATH = ${_dbPath.toString()}");
//
//        _onCreate(database, version);
////        _insertOnCreate(database, version);
//      },
    );


  }

  Future<List<Exercise>> getExercises() async {
    final _db = await db.instance;

    var exercises = await _db.query(EXERCISES_TABLE, columns: [
      EXERCISE_COLUMN_ID,
      EXERCISE_COLUMN_NAME,
      EXERCISE_COLUMN_DURATION,
      EXERCISE_COLUMN_DURATION_TIME_UNIT
    ]);

    List<Exercise> exercisesList = List<Exercise>();

    exercises.forEach((currentExercise) {
      Exercise exercise = Exercise.fromMap(currentExercise);

      exercisesList.add(exercise);
    });

    // debugPrint("!! DB: Get Exercises");
    return exercisesList;
  }

  Future<int> addExercise(Exercise exercise) async {
    final _db = await db.instance;

    return await _db.insert(EXERCISES_TABLE, exercise.toMap());
  }

  Future<Exercise> selectExercise(int exerciseId) async {
    final _db = await db.instance;

    final result = await _db.query(
      EXERCISES_TABLE,
      columns: [
        EXERCISE_COLUMN_ID,
        EXERCISE_COLUMN_NAME,
        EXERCISE_COLUMN_DURATION,
        EXERCISE_COLUMN_DURATION_TIME_UNIT
      ],
      where: EXERCISE_COLUMN_ID,
      whereArgs: [exerciseId],
    );

    return Exercise.fromMap(result.first);
  }

  Future<int> deleteExercise(Exercise exercise) async {
    final _db = await db.instance;

    // debugPrint("!! DB: Delete Exercise");
    return await _db.delete(
      EXERCISES_TABLE,
      where: "$EXERCISE_COLUMN_ID = ?",
      whereArgs: [exercise.id],
    );
  }

  Future<int> updateExercise(Exercise exercise) async {
    final _db = await db.instance;

    // debugPrint("!! DB: Update Exercise");
    return await _db.update(
      EXERCISES_TABLE,
      exercise.toMap(),
      where: "$EXERCISE_COLUMN_ID = ?",
      whereArgs: [exercise.id],
    );
  }

  Future<int> countOfExercises() async {
    List<Exercise> _exercises = await getExercises();

    return _exercises.length;
  }

  // Trainings methods
  Future<List<Training>> getTrainings() async {
    final _db = await db.instance;

    var trainings = await _db.query(TRAININGS_TABLE, columns: [
      TRAININGS_COLUMN_ID,
      TRAININGS_COLUMN_NAME,
    ]);

    List<Training> trainingsList = List<Training>();

    trainings.forEach((currentTraining) async {
      debugPrint(currentTraining.toString());
      // var exercises = await _db.query(TRAININGS_EXERCISES_TABLE, columns: [
      //   TRAININGS_EXERCISES_COLUMN_EXERCISE_ID
      // ],
      //   where: TRAININGS_EXERCISES_COLUMN_TRAINING_ID,
      //   whereArgs: [currentTraining.],
      // );

      Training training = Training.fromMap(currentTraining);

      trainingsList.add(training);
    });

    return trainingsList;
  }

  Future<int> addTraining(Training training) async {
    final _db = await db.instance;
    List<Exercise> _exercises = training.exercisesList;

    _exercises.forEach((element) async {

      Map<String, int> exerciseTraining = {
        "$TRAININGS_EXERCISES_COLUMN_EXERCISE_ID": element.id,
        "$TRAININGS_EXERCISES_COLUMN_TRAINING_ID": training.id,
      };

       await _db.insert(TRAININGS_EXERCISES_TABLE, exerciseTraining);
    });

    Map<String, String> trainingMap = {
      "$TRAININGS_COLUMN_NAME": training.name,
    };

    return await _db.insert(TRAININGS_TABLE, trainingMap);
  }

  Future<Training> selectTraining(int trainingId) async {
    final _db = await db.instance;

    final result = await _db.query(
      TRAININGS_TABLE,
      columns: [
        TRAININGS_COLUMN_ID,
        TRAININGS_COLUMN_NAME,
      ],
      where: TRAININGS_COLUMN_ID,
      whereArgs: [trainingId],
    );

    return Training.fromMap(result.first);
  }

  Future<int> deleteTraining(Training training) async {
    final _db = await db.instance;

    return await _db.delete(
      TRAININGS_TABLE,
      where: "$TRAININGS_COLUMN_ID = ?",
      whereArgs: [training.id],
    );
  }

  Future<int> updateTraining(Training training) async {
    final _db = await db.instance;

    return await _db.update(
      TRAININGS_TABLE,
      training.toMap(),
      where: "$TRAININGS_COLUMN_ID = ?",
      whereArgs: [training.id],
    );
  }

  Future<int> countOfTrainings() async {
    List<Training> _trainings = await getTrainings();

    return _trainings.length;
  }
}

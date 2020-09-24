import 'package:FitnessApp/models/exercise.dart';
import 'package:FitnessApp/models/training.dart';
import 'package:FitnessApp/ui/index.dart';
import 'package:FitnessApp/utils/database_provider.dart';

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/services.dart';
// import 'package:sqflite/sqflite.dart';
import 'package:FitnessApp/router/index.dart' show Routes;

class AddTrainingScreen extends StatefulWidget {
  @override
  _AddTrainingScreenState createState() => _AddTrainingScreenState();
}

class _AddTrainingScreenState extends State<AddTrainingScreen> {
  TextEditingController _trainingNameController = TextEditingController();

  // TextEditingController _exerciseDurationController = TextEditingController();

  // DurationTimeUnit _selectedDurationTimeUnitValue;
  // List<DropdownMenuItem<DurationTimeUnit>> _durationTimeUnitValues =
  //     List<DropdownMenuItem<DurationTimeUnit>>();

  // Future<Database> _provider;
  DatabaseProvider _db;
  List<Exercise> _selectedExercises = <Exercise>[];
  List<Exercise> _exercises;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _showSuccessSnackBar(message) {
    SnackBar _snackBar = SnackBar(
      content: message,
    );
    _scaffoldKey.currentState.showSnackBar(_snackBar);
  }

  Future<List<Exercise>> _fetchExercises() async {
    _db = DatabaseProvider.db;
    _exercises = await _db.getExercises();
    return _exercises;
  }

  @override
  void initState() {
    super.initState();
    _fetchExercises();
    // _exercises = _fetchExercises();
    // _provider = DatabaseProvider.db.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar.withTitle('Add training'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextField(
                controller: _trainingNameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select exercises:',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              // StatefulBuilder(
              //   builder: (BuildContext context, StateSetter setState) {
              //     return _createExercisesList(context);
              //     // return _createExercisesList(context);
              //   },
              // ),
              // Wrap(
              //   spacing: 8.0,
              //   runSpacing: 4.0,
              //   // children: _chips,
              //   children: List<Widget>.generate(_exercises.length, (int index) {
              //     Exercise _item = _exercises[index];
              //     return CheckboxListTile(
              //       title: Text(_item.name),
              //       selected: _selectedExercises.contains(_item),
              //       onChanged: (value) {
              //         setState(() {
              //           _selectedExercises.add(_item);
              //         });
              //       },
              //       value: _selectedExercises.contains(_item),
              //       // label: Text(_item.name),
              //       // selected: _selectedExercises.contains(_item.id),
              //       // onSelected: (bool value) {
              //       //   setState(() {
              //       //     if (value) {
              //       //       _selectedExercises.add(_item);
              //       //     } else {
              //       //       _selectedExercises
              //       //           .removeWhere((Exercise e) => e.id == _item.id);
              //       //     }
              //       //   });
              //       // },
              //     );
              //   }),
              // ),
              FutureBuilder<List<Exercise>>(
                future: _fetchExercises(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  // if (snapshot.hasData)
                  //   List<Widget> _children;
                  // return Center(
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: _children,
                  //   ),
                  // );
                  // }
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return CircularProgressIndicator();
                    default:
                      if (snapshot.hasError)
                        return Text('Error: ${snapshot.error}');
                      else
                        // return
                        return _createExercisesList(context, snapshot);
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () async {

                  Training _training = Training(
                      name: _trainingNameController.text, exercisesList: _selectedExercises);

                  var _result =
                  await DatabaseProvider.db.addTraining(_training);

                  if (_result > 0) {
                    _showSuccessSnackBar(
                      Text('Training added!'),
                    );
                  }

                  await Future.delayed(const Duration(milliseconds: 1000));

                  Navigator.pushNamed(context, Routes.trainingsScreenRoute);
                },
                color: Colors.indigo,
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createExercisesList(BuildContext context, AsyncSnapshot snapshot) {
    // Future<List<Exercise>> _exercises = snapshot.data;
    //   Iterable<Widget> get _exerciseWidgets sync {
    //     for (Exercise _exercise in _exercises) {
    //       yield Padding(
    //       padding: const EdgeInsets.all(4.0),
    // child: FilterChip(
    // label: Text(_exercise)
    // )
    //       )
    //     }
    //   };
    // List<Widget> _chips = new List();
    //
    // for (int i = 0; i < snapshot.data.length; i++) {
    //   Exercise _item = snapshot.data[i];
    //   FilterChip _filterChip = FilterChip(
    //     selected: _selectedExercises.contains(_item.id),
    //     label: Text(_item.name),
    //     onSelected: (bool selected) {
    //       if (selected) {
    //         setState(() {
    //           _selectedExercises.add(_item);
    //         });
    //       }
    //       else {
    //         setState(() {
    //           _selectedExercises.remove(_item);
    //         });
    //       }
    //     },
    //     selectedColor: Colors.indigo,
    //   );
    //
    //   _chips.add(_filterChip);
    // }

    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      // children: _chips,
      children: List<Widget>.generate(_exercises.length, (int index) {
        Exercise _item = _exercises[index];

        return FilterChip(
          avatar: CircleAvatar(
            backgroundColor: Colors.grey.shade600,
            child: Text(_item.name[0].toUpperCase()),
          ),
          label: Expanded(
            child: Text('''${_item.name + ' ' + _item.duration.toString() + _item.durationTimeUnit}'''),
          ),
          selected: _selectedExercises.contains(_item),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _selectedExercises.add(_item);
              }
              else {
                _selectedExercises.removeWhere((element) => element == _item);
                // .removeWhere((Exercise e) => e.id == _item.id);
              }
            });
          },
          selectedColor: Colors.indigo,
          padding: EdgeInsets.all(6.0),
          labelPadding: EdgeInsets.symmetric(vertical: 4.0),
        );
      }),
    );
  }
}

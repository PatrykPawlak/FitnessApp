import 'package:FitnessApp/models/exercise.dart';
import 'package:FitnessApp/router/index.dart';
import 'package:FitnessApp/ui/index.dart';
import 'package:FitnessApp/utils/database_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditExerciseScreen extends StatefulWidget {
  EditExerciseScreen({Key key, this.exercise}) : super(key: key);

  final Exercise exercise;

  @override
  _EditExerciseScreenState createState() => _EditExerciseScreenState(exercise: exercise);
}

class _EditExerciseScreenState extends State<EditExerciseScreen> {
  _EditExerciseScreenState({Key key, @required this.exercise});

  final Exercise exercise;

  TextEditingController _exerciseNameController = TextEditingController();
  TextEditingController _exerciseDurationController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  DurationTimeUnit _selectedDurationTimeUnitValue;

  _showSuccessSnackBar(context, message) {
    SnackBar _snackBar = SnackBar(
      content: message,
    );

    _scaffoldKey.currentState.showSnackBar(_snackBar);
  }

  @override
  void initState() {
    super.initState();

    _exerciseNameController.text = exercise.name;
    _exerciseDurationController.text = exercise.duration.toString();

    _selectedDurationTimeUnitValue = exercise.durationTimeUnit.toDurationTimeUnit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar.withTitle('Edit exercise'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _exerciseNameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextFormField(
                controller: _exerciseDurationController,
                decoration: InputDecoration(
                  labelText: 'Duration',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
              ),
              DropdownButtonFormField<DurationTimeUnit>(
                value: _selectedDurationTimeUnitValue,
                onChanged: (DurationTimeUnit value) {
                  setState(() {
                    _selectedDurationTimeUnitValue = value;
                  });
                },
                items: DurationTimeUnit.values.map((DurationTimeUnit value) {
                  return DropdownMenuItem<DurationTimeUnit>(
                    value: value,
                    child: Text(
                      value.toString().split('.').last.toUpperCase(),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () async {
                  if (DurationTimeUnit.values
                      .contains(_selectedDurationTimeUnitValue)) {
                    exercise.name = _exerciseNameController.text;
                    exercise.duration = int.parse(_exerciseDurationController.text);
                    exercise.durationTimeUnit = describeEnum(_selectedDurationTimeUnitValue);

                    var _result =
                        await DatabaseProvider.db.updateExercise(exercise);

                    if (_result > 0) {
                      _showSuccessSnackBar(
                        context,
                        Text('Edited! - $_result'),
                      );
                    }

                    await Future.delayed(const Duration(milliseconds:  1000));

                    Navigator.pushNamed(context, Routes.exercisesScreenRoute);
                  }
                },
                color: Colors.indigo,
                child: Text(
                  'Save',
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
}

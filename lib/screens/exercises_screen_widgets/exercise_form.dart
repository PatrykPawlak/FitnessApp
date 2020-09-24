import 'package:FitnessApp/models/exercise.dart';
import 'package:FitnessApp/utils/database_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:sqflite/sqflite.dart';

class ExerciseForm extends StatefulWidget {
  @override
  _ExerciseFormState createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<ExerciseForm> {
  TextEditingController _exerciseNameController = TextEditingController();
  TextEditingController _exerciseDurationController = TextEditingController();
  DurationTimeUnit _selectedDurationTimeUnitValue;

  // Future<Database> _provider;

  _showSuccessSnackBar(context, message) {
    SnackBar _snackBar = SnackBar(
      content: message,
    );

    Scaffold.of(context).showSnackBar(_snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: _formKey,
      child: Column(
        children: <Widget>[
          TextField(
            controller: _exerciseNameController,
            decoration: InputDecoration(
              labelText: 'Name',
            ),
          ),
          TextField(
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
                Exercise _exercise = Exercise(
                  name: _exerciseNameController.text,
                  duration: int.parse(_exerciseDurationController.text),
                  durationTimeUnit:
                  describeEnum(_selectedDurationTimeUnitValue),
                );

                var _result =
                await DatabaseProvider.db.addExercise(_exercise);

                if (_result > 0) {
                  _showSuccessSnackBar(context, Text('Added! - $_result'),);
                }
              }
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
    );
  }
}
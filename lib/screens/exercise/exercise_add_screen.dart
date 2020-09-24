import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:FitnessApp/router/index.dart' show AppRoutes;
import 'package:FitnessApp/ui/index.dart' show CustomAppBar;
import 'package:FitnessApp/models/index.dart' show DurationTimeUnit, Exercise;


class ExerciseAddScreen extends StatefulWidget {
  _ExerciseAddScreenState createState() => _ExerciseAddScreenState();
}

class _ExerciseAddScreenState extends State<ExerciseAddScreen> {
  TextEditingController _exerciseNameController = TextEditingController();
  TextEditingController _exerciseDurationController = TextEditingController();
  DurationTimeUnit _selectedDurationTimeUnitValue;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _showSuccessSnackBar(message) {
    SnackBar _snackBar = SnackBar(
      content: message,
    );
    _scaffoldKey.currentState.showSnackBar(_snackBar);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar.withTitle('Exercise add'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
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
                    // Exercise _exercise = Exercise(
                    //   name: _exerciseNameController.text,
                    //   duration: int.parse(_exerciseDurationController.text),
                    //   durationTimeUnit:
                    //       describeEnum(_selectedDurationTimeUnitValue),
                    // );
                    //
                    // var _result =
                    //     await DatabaseProvider.db.addExercise(_exercise);
                    //
                    // if (_result > 0) {
                    //   _showSuccessSnackBar(
                    //     Text('Added! - $_result'),
                    //   );
                    // }
                    //
                    // await Future.delayed(const Duration(milliseconds: 1000));

                    Navigator.pushNamed(context, AppRoutes.exerciseListScreenRoute);
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
        ),
      ),
    );
  }
}

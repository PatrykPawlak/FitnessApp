import 'package:FitnessApp/utils/hive/hive_boxes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:FitnessApp/router/index.dart' show AppRoutes;
import 'package:FitnessApp/ui/index.dart' show CustomAppBar;
import 'package:FitnessApp/models/index.dart' show DurationTimeUnit, Exercise;
import 'package:hive/hive.dart';

class ExerciseAddScreen extends StatefulWidget {
  _ExerciseAddScreenState createState() => _ExerciseAddScreenState();
}

class _ExerciseAddScreenState extends State<ExerciseAddScreen> {
  TextEditingController _exerciseNameController = TextEditingController();
  TextEditingController _exerciseDurationController = TextEditingController();
  DurationTimeUnit _selectedDurationTimeUnitValue;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              TextFormField(
                controller: _exerciseNameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) {
                  return val.trim().isEmpty
                      ? 'Exercise name shouldn\'t be empty'
                      : null;
                },
              ),
              TextFormField(
                controller: _exerciseDurationController,
                decoration: InputDecoration(
                  labelText: 'Duration',
                ),
                validator: (val) {
                  return val.trim().isEmpty
                      ? 'Exercise duration shouldn\'t be empty'
                      : null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
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
            ],
          ),
          // ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _validateAndSave,
        child: Icon(
          Icons.save,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }

  void _validateAndSave() {
    final _form = _formKey.currentState;

    if (_form.validate()) {
      _onFormSubmit();
    } else {
      print('Form is invalid');
    }
  }

  void _onFormSubmit() async {
    Box<Exercise> _exercisesBox = Hive.box<Exercise>(HiveBoxes.exercise);
    Exercise _newExercise = Exercise(
      id: DateTime.now().millisecondsSinceEpoch.abs().toString(),
      name: _exerciseNameController.text,
      duration: int.parse(_exerciseDurationController.text),
      durationTimeUnit: describeEnum(_selectedDurationTimeUnitValue),
    );

    _exercisesBox.put(_newExercise.id, _newExercise);

    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text('Exercise successfully added'),
      ),
    );

    Navigator.pushNamed(context, AppRoutes.exerciseListScreenRoute);
  }
}

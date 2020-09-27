import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:FitnessApp/utils/hive/hive_boxes.dart' show HiveBoxes;
import 'package:FitnessApp/models/index.dart' show Exercise, DurationTimeUnit;
import 'package:FitnessApp/ui/index.dart' show CustomAppBar;

class ExerciseEditScreen extends StatefulWidget {
  final Exercise _exercise;

  ExerciseEditScreen(this._exercise);

  _ExerciseEditScreenState createState() => _ExerciseEditScreenState(_exercise);
}

class _ExerciseEditScreenState extends State<ExerciseEditScreen> {
  final Exercise _exercise;
  TextEditingController _exerciseNameController;
  TextEditingController _exerciseDurationController;
  DurationTimeUnit _selectedDurationTimeUnitValue;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _ExerciseEditScreenState(this._exercise);

  @override
  void initState() {
    super.initState();
    _exerciseNameController = TextEditingController(
      text: _exercise.name,
    );
    _exerciseDurationController = TextEditingController(
      text: _exercise.duration.toString(),
    );

    _selectedDurationTimeUnitValue = DurationTimeUnit.values.firstWhere(
      (e) =>
          e.toString().split('.')[1].toUpperCase() ==
          _exercise.durationTimeUnit.toUpperCase(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar.withTitle('Edit: ${_exercise.name}'),
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

    _exercisesBox.get(_exercise.id).name = _exerciseNameController.text;
    _exercisesBox.get(_exercise.id).duration =
        int.parse(_exerciseDurationController.text);
    _exercisesBox.get(_exercise.id).durationTimeUnit =
        describeEnum(_selectedDurationTimeUnitValue);

    _exercisesBox.put(_exercise.id, _exercise);

    Navigator.pop(context);
  }
}

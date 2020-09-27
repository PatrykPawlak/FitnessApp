import 'package:FitnessApp/models/index.dart';
import 'package:FitnessApp/models/training.dart';
import 'package:FitnessApp/utils/hive/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:FitnessApp/ui/index.dart' show CustomAppBar;
import 'package:hive/hive.dart';

class TrainingEditScreen extends StatefulWidget {
  final Training _training;

  TrainingEditScreen(this._training);

  _TrainingEditScreenState createState() => _TrainingEditScreenState(_training);
}

class _TrainingEditScreenState extends State<TrainingEditScreen> {
  final Training _training;

  TextEditingController _trainingNameController;

  List<Exercise> _exercises = List<Exercise>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<Exercise> _trainingExercises;
  final List<Widget> _trainingExercisesWidgets = List<Widget>();

  _TrainingEditScreenState(this._training);

  @override
  void initState() {
    super.initState();

    _trainingNameController = TextEditingController(text: _training.name);

    _exercises = Hive.box<Exercise>(HiveBoxes.exercise).values.toList();

    _trainingExercises = _training.exercisesList.cast<Exercise>();

    _trainingExercises.forEach((element) {
      _trainingExercisesWidgets.add(
        _createDropdownButton(context, _trainingExercisesWidgets.length),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar.withTitle('Training edit'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _trainingNameController,
                      decoration: InputDecoration(labelText: 'Training name'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (val) {
                        return val.trim().isEmpty
                            ? 'Training name shouldn\'t be empty'
                            : null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            setState(() {
                              _trainingExercises.add(_exercises.first);

                              _trainingExercisesWidgets.add(
                                _createDropdownButton(
                                    context, _trainingExercisesWidgets.length),
                              );
                            });
                          },
                          child: Row(
                            children: <Widget>[
                              // Icon(Icons.remove),
                              Text('Add exercise'),
                            ],
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            setState(() {
                              _trainingExercisesWidgets.removeLast();
                              _trainingExercises.removeLast();
                            });
                          },
                          child: Row(
                            children: <Widget>[
                              // Icon(Icons.remove),
                              Text('Remove exercise'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: _createTrainingExercisesWidget(context),
              ),
            ],
          ),
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

  Widget _createTrainingExercisesWidget(BuildContext context) {
    if (_trainingExercisesWidgets.isEmpty) {
      return Container(
        child: Text(
          'List of training exercises is empty.\nAdd some exercises below.',
          style: TextStyle(fontSize: 16),
        ),
      );
    } else {
      return Container(
        child: ListView.builder(
          itemCount: _trainingExercisesWidgets.length,
          itemBuilder: (context, index) => _createDropdownButton(
            context,
            index,
          ),
        ),
      );
    }
  }

  Widget _createDropdownButton(BuildContext context, int _index) {
    return DropdownButtonFormField<Exercise>(
      value: _trainingExercises.elementAt(_index),
      items: _exercises.map((Exercise _value) {
        return DropdownMenuItem<Exercise>(
          value: _value,
          child: Text(
            _value.name,
          ),
        );
      }).toList(),
      onChanged: (Exercise _value) {
        setState(() {
          _trainingExercises[_index] = _value;
        });
      },
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

  void _onFormSubmit() {
    Box<Training> _trainingsBox = Hive.box<Training>(HiveBoxes.training);
    Box<Exercise> _exercisesBox = Hive.box<Exercise>(HiveBoxes.exercise);

    var _item = _trainingsBox.get(_training.id);

    _item.name = _trainingNameController.text;
    _item.exercisesList = HiveList(_exercisesBox);

    _trainingExercises.forEach((_element) {
      _item.exercisesList.add(_element);
    });

    _trainingsBox.put(_item.id, _item);

    Navigator.pop(context);
  }
}

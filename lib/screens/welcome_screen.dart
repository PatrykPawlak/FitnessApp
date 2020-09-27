import 'package:FitnessApp/models/index.dart';
import 'package:FitnessApp/router/index.dart';
import 'package:FitnessApp/utils/hive/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController _usernameController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initExampleExercises();
    initExampleTrainings();
    _usernameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 64.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Hello user, please enter your name below',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 24.0,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (val) {
                    return val.trim().isEmpty
                        ? 'Username shouldn\'t be empty'
                        : null;
                  },
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              RaisedButton(
                child: Text('Save'),
                onPressed: _validateAndSave,
              ),
            ],
          ),
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
    Hive.box<Settings>(HiveBoxes.settings).put(
      'Username',
      Settings(_usernameController.text),
    );

    Navigator.pushReplacementNamed(context, AppRoutes.homeScreenRoute);
  }
}

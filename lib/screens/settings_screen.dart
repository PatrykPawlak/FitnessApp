import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:FitnessApp/utils/hive/hive_boxes.dart' show HiveBoxes;
import 'package:FitnessApp/models/index.dart' show Settings;
import 'package:FitnessApp/ui/index.dart' show CustomAppBar, SidebarNavigation;

class SettingsScreen extends StatefulWidget {
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController _usernameController;
  bool _isDarkMode;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _isDarkMode =
        Hive.box<Settings>(HiveBoxes.settings).get('Theme').setting == 'Dark'
            ? true
            : false;

    _usernameController = TextEditingController(
      text: Hive.box<Settings>(HiveBoxes.settings).get('Username').setting,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<Settings>(HiveBoxes.settings).listenable(),
      builder: (context, Box<Settings> box, widget) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(),
          drawer: SidebarNavigation(),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Username',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  subtitle: Text(
                    Hive.box<Settings>(HiveBoxes.settings)
                        .get('Username')
                        .setting,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  onTap: () async {
                    showDialog(
                      context: context,
                      child: SimpleDialog(
                        titlePadding: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        title: Text(
                          'Username',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        children: <Widget>[
                          Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                labelText: 'Username',
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (val) {
                                return val.trim().isEmpty
                                    ? 'Username shouldn\'t be empty'
                                    : null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 32.0,
                          ),
                          RaisedButton(
                            child: Text('Save'),
                            onPressed: _validateAndSave,
                          ),
                        ],
                      ),
                    ).whenComplete(
                      () => _usernameController.text =
                          Hive.box<Settings>(HiveBoxes.settings)
                              .get('Username')
                              .setting,
                    );
                  },
                ),
                SwitchListTile(
                  activeColor: Theme.of(context).primaryColor,
                  value: _isDarkMode,
                  onChanged: (newValue) {
                    setState(() {
                      _isDarkMode = newValue;

                      if (newValue) {
                        Hive.box<Settings>(HiveBoxes.settings)
                            .put('Theme', Settings('Dark'));
                      } else {
                        Hive.box<Settings>(HiveBoxes.settings)
                            .put('Theme', Settings('Light'));
                      }
                    });
                  },
                  title: Text(
                    'Dark mode',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                ListTile(
                  title: Text(
                    'Credits',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      child: SimpleDialog(
                        titlePadding: EdgeInsets.all(16.0),
                        contentPadding: EdgeInsets.all(16.0),
                        title: Text(
                          'Credits',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        children: <Widget>[
                          Text(
                            'Paweł Michalski',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'Paweł Dzioba',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'Tomasz Klaja',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'Patryk Pawlak',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
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

  void _onFormSubmit() async {
    Hive.box<Settings>(HiveBoxes.settings).put(
      'Username',
      Settings(_usernameController.text),
    );

    Navigator.pop(context);
  }
}

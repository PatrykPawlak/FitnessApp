import 'dart:core';
import 'package:flutter/material.dart';
import 'package:FitnessApp/screens/home_page.dart';
import 'dart:io';


class WorkoutPlanPage extends StatefulWidget {
  @override
  _WorkoutPlanPageState createState() => _WorkoutPlanPageState();
}

class _WorkoutPlanPageState extends State<WorkoutPlanPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Treningi"),),
      body: Container(
        child: Center(

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => Addingworkout()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
  }





class Addingworkout extends StatefulWidget {
  @override
  _AddingWorkoutstate createState() => _AddingWorkoutstate();
}

class _AddingWorkoutstate extends State<Addingworkout> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<String> selectedItemValue = List<String>();

  _showSnackBar(){
    final snackbar = new SnackBar(
      content: new Text("Pomyślnie zapisano trening"),
      duration: new Duration(seconds: 3),
      backgroundColor: Colors.green,
      action: new SnackBarAction(label: 'OK', onPressed: (){
        print('press OK on SnackBar');
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => WorkoutPlanPage()));
      }),
    );
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text("Dodawanie Treningu"),
      ),
      body: SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),

                children: <Widget>[
                  new DropdownButton(
                  value: selectedItemValue[index].toString(),
    items: _dropDownItem(),
    onChanged: (value) {
    selectedItemValue[index] = value;
    setState(() {});
    },
    hint: Text('Select Gender'),
    );
  }),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.access_time),
                      hintText: 'Wprowadź czas przerwy',
                      labelText: 'Czas przerwy',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (val) => val.isEmpty ? 'Czas przerwy jest wymagany' : null,
                    onSaved: (val) => newCwiczenia.czasPrzerwy = val,
                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: new RaisedButton(
                          child: const Text('Zapisz'),
                          onPressed: () {
                            _submitForm();
                            _showSnackBar();



                          }

                      )),
                ],
              ))),
    );
  }

  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> ddl = ["NONE", "1 YEAR", "2 YEAR"];
    return ddl
        .map((value) => DropdownMenuItem(
      value: value,
      child: Text(value),
    ))
        .toList();
  }
  void _submitForm() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      showMessage('Formularz jest niepoprawny! ');
    } else {
      form.save(); //This invokes each onSaved event
      print('Nazwa: ${newCwiczenia.nazwa}');
      print('Czas powtórzeń: ${newCwiczenia.czasPowtorzen}');
      print('Czas przerwy: ${newCwiczenia.czasPrzerwy}');
      print('========================================');
      setState(() {
        cwiczeniaList.add(newCwiczenia);

      });
    }
  }

  void showMessage(String message, [MaterialColor color = Colors.green]) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(backgroundColor: color, content: new Text(message)));
  }
}
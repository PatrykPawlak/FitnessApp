import 'dart:core';
import 'package:flutter/material.dart';
import 'dart:io';


class Cwiczenia  {
   String nazwa;
   String czasPowtorzen;
   String czasPrzerwy;
  Cwiczenia({this.nazwa= '', this.czasPowtorzen= '', this.czasPrzerwy= ''});
}

List<Cwiczenia> cwiczeniaList = [
  Cwiczenia(nazwa: "Deska 30 sekund", czasPowtorzen: "30", czasPrzerwy: "30"),
  Cwiczenia(nazwa: "Deska 60 sekund", czasPowtorzen: "60", czasPrzerwy: "30"),
  Cwiczenia(nazwa: "Pompki 60 sekund", czasPowtorzen: "60", czasPrzerwy: "30"),
  Cwiczenia(nazwa: "Pompki 30 sekund", czasPowtorzen: "30", czasPrzerwy: "30"),
  Cwiczenia(nazwa: "Brzuszki 60 sekund", czasPowtorzen: "60", czasPrzerwy: "30"),
];

Cwiczenia newCwiczenia = new Cwiczenia();
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class JsonPage extends StatefulWidget {
  @override
  _JsonPageState createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  bool isVisible = false;
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ćwiczenia"),),
      body: Container(
        child: Center(
          child:new ListView.separated
            (
              itemCount: cwiczeniaList.length,
              separatorBuilder: (context, index) => Divider(
                  height: 0.5,
                color: Colors.black
              ),
              itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(cwiczeniaList[index].nazwa),
                      onTap: () {
                        i = index;
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      subtitle: isVisible
                          ?  Text("Czas: " + cwiczeniaList[index].czasPowtorzen +
                          " sekund" +
                          "\nPrzerwa: " + cwiczeniaList[index].czasPrzerwy +
                          " sekund")
                          : null,
                      );
              }
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => AddingData()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class AddingData extends StatefulWidget {
  @override
  _AddingDatastate createState() => _AddingDatastate();
}

class _AddingDatastate extends State<AddingData> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _showSnackBar(){
    final snackbar = new SnackBar(
      content: new Text("Pomyślnie zapisano ćwiczenie"),
      duration: new Duration(seconds: 3),
      backgroundColor: Colors.green,
      action: new SnackBarAction(label: 'OK', onPressed: (){
        print('press OK on SnackBar');
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => JsonPage()));
      }),
    );
_scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
        title: new Text("Dodawanie ćwiczenia"),
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
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Wprowadź nazwę ćwiczenia',
                    labelText: 'Nazwa',
                  ),
                  keyboardType: TextInputType.text,
                  validator: (val) => val.isEmpty ? 'Nazwa jest wymagana' : null,
                  onSaved: (val) => newCwiczenia.nazwa = val,
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.accessibility_new),
                    hintText: 'Wprowadź czas powtórzeń',
                    labelText: 'Czas powtórzeń',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (val) => val.isEmpty ? 'Czas powtórzeń jest wymagany' : null,
                  onSaved: (val) => newCwiczenia.czasPowtorzen = val,
                ),
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


















/*class JsonPage extends StatefulWidget {
  @override
  _JsonPageState createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  bool isVisible = false;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ćwiczenia"),),
      body: Container(
        child: Center(

          child: FutureBuilder(builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: Text("Loading..."),
              );
            } else {
              var showData = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemCount: showData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(showData[index]['nazwa']),
                    onTap: () {
                      i = index;
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    subtitle: isVisible
                        ? Text("Czas: " + showData[index]['czasPowtorzen'] +
                        " sekund" +
                        "\nPrzerwa: " + showData[index]['czasPrzerwy'] +
                        " sekund")
                        : null,
                  );
                },
              );
            }
          },
            future: DefaultAssetBundle.of(context).loadString('assets/cwiczenia.json'),

          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => AddingData()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class AddingData extends StatefulWidget {
  @override
  _AddingDatastate createState() => _AddingDatastate();
}

class _AddingDatastate extends State<AddingData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dodaj ćwiczenie"),),
      body: TextField(),


    );
  }

}

*/

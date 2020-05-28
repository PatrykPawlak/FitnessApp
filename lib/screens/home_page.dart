import 'package:flutter/material.dart';
import 'dart:convert';



class JsonPage extends StatefulWidget {
  @override
  _JsonPageState createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ćwiczenia"),),
      body: Container(
        child:Center(

          child: FutureBuilder(builder: (context, snapshot){
            
            if(snapshot.data==null) {
              return Center(
                child: Text("Loading..."),
              );
            }else {
              var showData = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemCount: showData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(showData[index]['nazwa']),
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    subtitle: isVisible
                        ? Text("Czas: " + showData[index]['czasPowtorzen'] + " sekund" +
                        "\nPrzerwa: " + showData[index]['czasPrzerwy'] + " sekund")
                        : null,
                  );
                },
              );
            }
          }, future: DefaultAssetBundle.of(context).loadString("Cwiczenia.json"),

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



class Exercises {
  final int id;
  final String nazwa;
  final String czasPowtorzen;
  final String czasPrzerwy;

  Exercises(this.id, this.nazwa, this.czasPowtorzen, this.czasPrzerwy);

}

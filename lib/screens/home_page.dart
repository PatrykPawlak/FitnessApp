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
      body: Center(

        child: FutureBuilder(builder: (context, snapshot){
          var showData=json.decode(snapshot.data.toString());
          return ListView.builder(
            itemCount: showData.length,
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                title: Text(showData[index]['nazwa']),
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                subtitle: isVisible ? Text("Czas: "+showData[index]['czasPowtorzen']+ " sekund"+ "\nPrzerwa: "+showData[index]['czasPrzerwy']+ " sekund" ) : null,
              );

            },
          );
        }, future: DefaultAssetBundle.of(context).loadString("Cwiczenia.json"),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}


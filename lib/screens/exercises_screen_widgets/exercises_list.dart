import 'package:FitnessApp/router/index.dart';
import 'package:flutter/material.dart';
import 'package:FitnessApp/models/exercise.dart';
import 'package:FitnessApp/utils/database_provider.dart' show DatabaseProvider;

class ExerciseList extends StatefulWidget {
  @override
  _ExerciseListState createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList> {
  DatabaseProvider _db;

  Future<List<Exercise>> _fetchExercises() async {
    _db = DatabaseProvider.db;
    return _db.getExercises();
  }

  @override
  void initState() {
    super.initState();
    // _db = DatabaseProvider.db;
    _fetchExercises();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchExercises(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          default:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else
              return _createListView(context, snapshot);
        }
      },
    );
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        Exercise _item = snapshot.data[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
          // elevation: 8.0,
          // child: Dismissible(
          //   direction: DismissDirection.endToStart,
          //   key: Key(_item.id.toString()),
          //   onDismissed: (direction) {
          //     _db.deleteExercise(_item);
          //
          //     Scaffold.of(context).showSnackBar(
          //       SnackBar(
          //         content: Text("${_item.name} deleted"),
          //       ),
          //     );
          //   },
          child: Card(
            elevation: 2.0,
            child: ListTile(
              onTap: () => Navigator.pushNamed(context, Routes.exerciseDetailScreenRoute, arguments: _item),
              title: Text(_item.name),
              subtitle:
                  Text(_item.duration.toString() + _item.durationTimeUnit),
              trailing: PopupMenuButton(
                itemBuilder: (_) => <PopupMenuItem<String>>[
                  new PopupMenuItem<String>(
                    child: Text('Edit'),
                    value: 'Edit',
                  ),
                  new PopupMenuItem<String>(
                    child: Text('Delete'),
                    value: 'Delete',
                  ),
                ],
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.indigo,
                ),
                onSelected: (selected) {
                  if (selected == 'Edit') {
                    Navigator.pushNamed(context, Routes.exerciseEditScreenRoute, arguments: _item);
                  } else if (selected == 'Delete') {
                    _db.deleteExercise(_item);

                    setState(() {
                      _fetchExercises();
                    });

                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Item deleted'),
                      ),
                    );
                  }
                },
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          // ),
        );
        // return Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: Card(
        // return Card(
        //     elevation: 8.0,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(0),
        //     ),
        //     child: ListTile(
        //       title: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: <Widget>[
        //           Text(
        //             _item.name,
        //             style: TextStyle(
        //               fontSize: 28,
        //             ),
        //           ),
        //         ],
        //       ),
        //       trailing: Row(
        //         children: <Widget>[
        //           Text(
        //             _item.duration.toString() + _item.durationTimeUnit,
        //             style: TextStyle(
        //               fontSize: 20,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   );
        // );
        // return ListTile(
        //   title: Text(_item.name),
        //   trailing: Text(_item.duration.toString() + _item.durationTimeUnit),
        // );
      },
    );
  }
//
// Widget _buildItem(Exercise _item) {
//   return
// }
}

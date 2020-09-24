import 'package:FitnessApp/router/index.dart';
import 'package:flutter/material.dart';
import 'package:FitnessApp/models/index.dart' show Exercise;

class ExerciseListItem extends StatelessWidget {
  final Exercise _exercise;

  ExerciseListItem(this._exercise);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
      child: Card(
        elevation: 2.0,
        child: ListTile(
          onTap: () => Navigator.pushNamed(
              context, AppRoutes.exerciseDetailScreenRoute,
              arguments: _exercise),
          title: Text(_exercise.name),
          subtitle:
              Text('Duration: ${_exercise.duration.toString() + _exercise.durationTimeUnit}'),
          trailing: _popupMenuButton(context),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }

  Widget _popupMenuButton(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (_) => <PopupMenuItem<String>>[
        new PopupMenuItem<String>(
          child: Row(
            children: <Widget>[
              Icon(Icons.edit),
              VerticalDivider(width: 10.0,),
              Text('Edit'),
            ],
          ),
          value: 'Edit',
        ),
        new PopupMenuItem<String>(
          child: Row(
            children: <Widget>[
              Icon(Icons.delete),
              VerticalDivider(width: 10.0,),
              Text('Delete'),
            ],
          ),
          value: 'Delete',
        ),
      ],
      icon: Icon(
        Icons.more_vert,
        color: Colors.indigo,
      ),
      onSelected: (_selected) {},
      // onSelected: (selected) {
      //   if (selected == 'Edit') {
      //     Navigator.pushNamed(context, Routes.exerciseEditScreenRoute, arguments: _exercise);
      //   } else if (selected == 'Delete') {
      //     _db.deleteExercise(_exercise);
      //
      //     setState(() {
      //       _fetchExercises();
      //     });
      //
      //     Scaffold.of(context).showSnackBar(
      //       SnackBar(
      //         content: Text('Item deleted'),
      //       ),
      //     );
      //   }
      // },
    );
  }
}

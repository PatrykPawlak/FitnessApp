import 'package:FitnessApp/utils/hive/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:FitnessApp/models/index.dart' show Exercise;
import 'package:FitnessApp/router/index.dart' show AppRoutes;
import 'package:hive/hive.dart';

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
          title: Text(
            _exercise.name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          subtitle: Container(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'Duration: ${_exercise.duration.toString() + _exercise.durationTimeUnit}',
            ),
          ),
          trailing: _popupMenuButton(
            context,
          ),
          onTap: () => Navigator.pushNamed(
            context,
            AppRoutes.exerciseDetailScreenRoute,
            arguments: _exercise,
          ),
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
              Icon(
                Icons.edit,
              ),
              VerticalDivider(
                width: 10.0,
              ),
              Text(
                'Edit',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
          value: 'Edit',
        ),
        new PopupMenuItem<String>(
          child: Row(
            children: <Widget>[
              Icon(
                Icons.delete,
                color: Theme.of(context).errorColor,
              ),
              VerticalDivider(
                width: 10.0,
              ),
              Text(
                'Delete',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
          value: 'Delete',
        ),
      ],
      icon: Icon(
        Icons.more_vert,
        color: Theme.of(context).primaryIconTheme.color,
        // color: Colors.indigo,
      ),
      onSelected: (String _selected) async {
        if (_selected.toLowerCase() == 'edit') {
          Navigator.pushNamed(context, AppRoutes.exerciseEditScreenRoute,
              arguments: _exercise);
        } else if (_selected.toLowerCase() == 'delete') {
          Hive.box<Exercise>(HiveBoxes.exercise).delete(_exercise.id);
        }
      },
    );
  }
}

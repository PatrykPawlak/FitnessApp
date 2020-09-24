import 'package:flutter/material.dart';
import 'package:FitnessApp/models/index.dart' show Training;
import 'package:FitnessApp/router/index.dart' show AppRoutes;

class TrainingListItem extends StatelessWidget {
  final Training _training;

  TrainingListItem(this._training);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
      child: Card(
        elevation: 2.0,
        child: ListTile(
          onTap: () => Navigator.pushNamed(
              context, AppRoutes.trainingDetailScreenRoute,
              arguments: _training),
          title: Text(_training.name),
          subtitle: Text('Number of exercises: ${_training.exercisesList.length}'),
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
              Icon(Icons.star),
              VerticalDivider(width: 10.0,),
              Text('Add to my trainings'),
            ],
          ),
          value: 'Add to favourite',
        ),
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
    );
  }
}
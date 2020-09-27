import 'package:FitnessApp/models/index.dart';
import 'package:FitnessApp/utils/hive/hive_boxes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:FitnessApp/models/index.dart' show Training;
import 'package:FitnessApp/router/index.dart' show AppRoutes;
import 'package:hive/hive.dart';

class TrainingListItem extends StatelessWidget {
  final Training _training;

  TrainingListItem(this._training);

  int _getTrainingDuration(List<Exercise> _list) {
    int _duration = 0;

    _list.forEach((_exercise) {
      if (_exercise.durationTimeUnit == describeEnum(DurationTimeUnit.s)) {
        _duration += _exercise.duration;
      } else if (_exercise.durationTimeUnit ==
          describeEnum(DurationTimeUnit.m)) {
        _duration += _exercise.duration * 60;
      } else if (_exercise.durationTimeUnit ==
          describeEnum(DurationTimeUnit.h)) {
        _duration += _exercise.duration * 60 * 60;
      }
    });

    return _duration;
  }

  String _getTrainingDurationString(int _seconds) {
    return _seconds.toString() + 's';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0),
      child: Card(
        elevation: 2.0,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          onTap: () => Navigator.pushNamed(
              context, AppRoutes.trainingDetailScreenRoute,
              arguments: _training),
          title: Text(
            _training.name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 16.0,
              ),
              Text(
                'Number of exercises: ${_training.exercisesList.toList().length}',
                textAlign: TextAlign.left,
              ),
              Text(
                'Duration: ${_getTrainingDurationString(
                  _getTrainingDuration(
                    _training.exercisesList.toList().cast<Exercise>(),
                  ),
                )}',
              ),
            ],
          ),
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
        PopupMenuItem<String>(
          child: Row(
            children: <Widget>[
              Icon(
                Icons.star,
              ),
              VerticalDivider(
                width: 10.0,
              ),
              Text(
                _training.isFavourite
                    ? 'Delete from my trainings'
                    : 'Add to my trainings',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
          value: 'IsMyTraining',
        ),
        PopupMenuItem<String>(
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
        PopupMenuItem<String>(
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
      ),
      onSelected: (String _selected) {
        var _item = Hive.box<Training>(HiveBoxes.training).get(_training.id);
        if (_selected.toLowerCase() == 'ismytraining') {
          _item.isFavourite = !_item.isFavourite;
          Hive.box<Training>(HiveBoxes.training).put(_item.id, _item);

        } else if (_selected.toLowerCase() == 'edit') {
          Navigator.pushNamed(
            context,
            AppRoutes.trainingEditScreenRoute,
            arguments: _training,
          );
        } else if (_selected.toLowerCase() == 'delete') {
          Hive.box<Training>(HiveBoxes.training).delete(_training.id);
        }
      },
    );
  }
}

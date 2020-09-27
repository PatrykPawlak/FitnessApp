import 'package:FitnessApp/models/index.dart';
import 'package:FitnessApp/router/index.dart';
import 'package:FitnessApp/screens/training/ui/training_my_trainings_list_item.dart';
import 'package:FitnessApp/utils/hive/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:FitnessApp/ui/index.dart' show CustomAppBar, SidebarNavigation;
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: SidebarNavigation(),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _usernameWidget(context),
              SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: _myTrainingsList(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameWidget(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box<Settings>(HiveBoxes.settings).listenable(),
        builder: (context, Box<Settings> box, _) {
          return Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: RichText(
              text: TextSpan(
                text: 'Hello ',
                style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.w300),
                children: <TextSpan>[
                  TextSpan(
                    text: Hive.box<Settings>(HiveBoxes.settings).get('Username').setting,
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Theme.of(context).primaryColor,
                          // fontWeight: FontWeight.w200,
                        ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _myTrainingsList(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<Training>(HiveBoxes.training).listenable(),
      builder: (context, Box<Training> box, _) {
        if (Hive.box<Training>(HiveBoxes.training)
            .values
            .toList()
            .where(
              (_training) => _training.isFavourite,
            )
            .toList()
            .isEmpty) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 48.0,
                ),
                Text(
                  "Your favourite trainings list is empty",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 24.0,
                ),
                RaisedButton(
                  child: Text('Add favourite trainings'),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.trainingListScreenRoute,
                    );
                  },
                )
              ],
            ),
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 48.0,
              ),
              Text(
                'Your favourite trainings',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 24.0,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: Hive.box<Training>(HiveBoxes.training)
                      .values
                      .toList()
                      .where(
                        (_training) => _training.isFavourite,
                      )
                      .toList()
                      .length,
                  itemBuilder: (context, index) {
                    Training _item = Hive.box<Training>(HiveBoxes.training)
                        .values
                        .toList()
                        .where(
                          (_training) => _training.isFavourite,
                        )
                        .toList()[index];
                    return TrainingMyTrainingsListItem(_item);
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

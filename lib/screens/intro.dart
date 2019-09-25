import 'package:flutter/material.dart';
import 'package:smartmeat/widgets/bottom_app_bar.dart';

class PageSelectorExample extends StatelessWidget {
  const PageSelectorExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: DefaultTabController(
      length: choices.length,
      child: Builder(
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              
              Expanded(
                child: IconTheme(
                  data: IconThemeData(
                    size: 128.0,
                    color: Theme.of(context).accentColor,
                  ),
                  child: TabBarView(children: choices.map((Choice choice) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ChoiceCard(choice: choice),
            );
          }).toList(),),
                ),
              ),
              
              RaisedButton(
                child: Text('SKIP'),
                onPressed: () {
                  final TabController controller =
                      DefaultTabController.of(context);
                  if (!controller.indexIsChanging) {
                    controller.animateTo(choices.length - 1);
                  }
                },
              ),
              TabPageSelector(),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
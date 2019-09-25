import 'dart:io';

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
              ButtonTheme(
                minWidth: 200.0,
                height: 40.0,
                child:RaisedButton(
                  child: Text('INICIAR',style: TextStyle(
                          color: Colors.white,),),
                  color: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () {
                    final TabController controller =
                        DefaultTabController.of(context);
                    if (!controller.indexIsChanging) {
                      controller.animateTo(choices.length - 1);
                    }
                  },
                )),
              TabPageSelector(color: Colors.white,selectedColor: Colors.red,),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
class Choice {
  const Choice({this.text, this.imageFile});

  final String text;
  final imageFile;
}

const String text1 = "Já pensou em um\nchurrasco onde\nvocê particicpa da festa?";
const String text2 = "Basicamente o que\nvocê fará é cortar a\ncarne e\nacompanhar pelo\ncelular o seu\nchurrasco";
const String text3 = "Inicie agora no\nSmartMeat";

const List<Choice> choices = const <Choice>[
  const Choice(text: text1, imageFile: "images/intro1.jpg"),
  const Choice(text: text2, imageFile: "images/intro2.jpg"),
  const Choice(text: text3, imageFile: "images/intro3.jpg"),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return 
      Center(

        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 65,),
            Image.asset(
                          choice.imageFile,
                          fit: BoxFit.cover,
                          height: 190.0,
                        ),
            SizedBox(height: 50,),
            
            Text(choice.text, style: TextStyle(height: 1, fontSize: 30), textAlign: TextAlign.center,),
          ],
        ),
      );
  }
}
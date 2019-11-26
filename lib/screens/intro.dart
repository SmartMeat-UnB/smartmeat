import 'package:SmartMeat/screens/name_user.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class WelcomePage extends StatelessWidget {
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
                    child: TabBarView(
                      children: choices.map((Choice choice) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ChoiceCard(choice: choice),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment(0.0, 0.9),
                  padding: EdgeInsets.all(20.0),
                  child: ButtonTheme(
                      minWidth: 100.0,
                      height: 60.0,
                      child: RaisedButton(
                        child: Text(
                          'INICIAR',
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.redAccent[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () {
                          final TabController controller =
                              DefaultTabController.of(context);
                          if (!controller.indexIsChanging) {
                            controller.animateTo(choices.length - 1);
                          }
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => NameUser()));
                        },
                      )),
                ),
                TabPageSelector(
                  color: Colors.white,
                  selectedColor: Colors.red,
                )
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

const String text1 = "Já pensou em um churrasco onde você particicpa da festa?";
const String text2 = "Acompanhe sua churrasqueira pelo celular";
const String text3 = "Inicie agora no aplicativo Smart Meat";

const List<Choice> choices = const <Choice>[
  const Choice(text: text1, imageFile: "images/intro1.png"),
  const Choice(text: text2, imageFile: "images/intro2.png"),
  const Choice(text: text3, imageFile: "images/intro3.jpg"),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Image.asset(
            choice.imageFile,
            fit: BoxFit.cover,
            height: 190.0,
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
              child: AutoSizeText(
            choice.text,
            presetFontSizes: [40.0, 20.0, 14.0],
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )),
        ],
      ),
    );
  }
}

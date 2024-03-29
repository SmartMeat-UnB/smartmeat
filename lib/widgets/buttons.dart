import 'package:SmartMeat/screens/tutorialWifi.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Botao extends StatelessWidget {
  const Botao(this.nomeBotao, this.userName);
  final String nomeBotao;
  final String userName;

  Widget build(BuildContext context) {
    Future saveName() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('nome', this.userName);
      prefs.setBool('seen', true);
      prefs.setBool('notificacao', true);
      print(this.userName);
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new TutorialWifi()));
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ButtonTheme(
            minWidth: 200.0,
            height: 40.0,
            child: RaisedButton(
              onPressed: () => saveName(),
              textColor: Colors.white,
              padding: EdgeInsets.all(0.0),
              child: Text(
                this.nomeBotao,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
            ),
          ),
        ],
      ),
    );
  }
}

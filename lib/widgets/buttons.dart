import 'package:flutter/material.dart';

class  Botao extends StatelessWidget {
  const Botao(this.nomeBotao);
  final String nomeBotao;

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ButtonTheme(
                minWidth: 200.0,
                height: 40.0,
          child: RaisedButton(
              onPressed: () {},
              textColor: Colors.white,
              padding:  EdgeInsets.all(0.0),
              child: Text(this.nomeBotao,style: TextStyle(
                          color: Colors.white,),),
                  color: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            ),
          ),
        ],
      ),
    );

  }
}

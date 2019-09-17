import 'package:flutter/material.dart';

class  Botao extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
         RaisedButton(
            onPressed: () {},
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF689F38),
                    Color(0xFF64DD17),
                    Color(0xFF76FF03),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                  'Pronto!',
                  style: TextStyle(fontSize: 20)
              ),
            ),
          ),
        ],
      ),
    );

  }
}
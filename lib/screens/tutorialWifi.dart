import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TutorialWifi extends StatefulWidget {
  @override
  _TutorialWifiState createState() => _TutorialWifiState();
}

class _TutorialWifiState extends State<TutorialWifi> {
  String _nome;
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nome = (prefs.getString('nome'));
    });
    
}
  @override
  void initState() {
      super.initState();
      Timer( Duration(milliseconds: 20), () {
      checkFirstSeen();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
                  height: 10,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                          "images/ok.jpg",
                          fit: BoxFit.cover,
                          height: 190.0,
                        )
                
              ],            
            ),
            SizedBox(
                  height: 20,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Tudo certo $_nome\n vamos começar.\nO primeiro passo\n é conectar seu\n celular a\n churrasqueira via\n wifi",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300 ),
                textAlign: TextAlign.center,)
                 
              ],

            ),
             SizedBox(
                  height: 15,
                ),
            Row(
              
              children: <Widget>[
                SizedBox(
                  width: 280,
                ),
                IconButton(
                icon: Icon(
                  Icons.navigate_next,
                  size: 60,
                  color: Colors.grey,
                 ), 
                 onPressed: () {
                   Navigator.pushNamed(context, '/tutorial');
                 },
                ),
              ],            
            )
          ],
        ),
      ),
    );
  }
}

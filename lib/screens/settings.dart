import 'dart:async';

import 'package:SmartMeat/widgets/bottom_app_bar.dart';
import 'package:SmartMeat/widgets/float_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String _nome;
  bool _state = false;
  bool notificationState = false;
  int _tempo;
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      notificationState = (prefs.getBool('notificacao'));
      _tempo = (prefs.getInt('tempo'));
      _nome = (prefs.getString('nome'));
      _tempo = _tempo ~/ 60;
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 20), () {
      checkFirstSeen();
    });
  }

  Future _doSomething(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('nome', text);
    setState(() {
      _nome = text;
    });
  }

  Future _alterarTempo(int tempo) async {
    print(tempo);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _tempo = tempo;
    });
    prefs.setInt('tempo', _tempo * 60);
  }

  Future _alterarStatusNotificacao(bool active) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('notificacao', active);
    setState(() {
      notificationState = active;
    });
  }

  @override
  Widget build(BuildContext context) {
       return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: PreferredSize(
          child: AppBar(
            title: Text('Configurações',
                style: TextStyle(color: Colors.white, fontSize: 25)),
            centerTitle: true,
            backgroundColor: Colors.grey[800],
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          preferredSize: Size.fromHeight(55.0),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Card(
               elevation: 20,
           child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.supervised_user_circle, size: 40),
                  title: Text('Usuário', style: TextStyle(fontSize: 30),),
              ),
                      TextField(
                        onChanged: (text) {
                          _doSomething(text);
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.edit,
                            size: 30,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          hintText: '$_nome',
                          labelText: "Nome:",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 0,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
           ),
        ),
         new Card(
           elevation: 20,
           child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.speaker_phone, size: 40),
                  title: Text('Conexão', style: TextStyle(fontSize: 30),),
              ),
                      Row(children: <Widget>[
                        Icon(
                          Icons.wifi,
                          size: 30,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Wi-Fi", style: TextStyle(fontSize: 18)),
                        SizedBox(
                          width: 200,
                        ),
                        Switch(
                          onChanged: (bool value) {
                            setState(() {
                              value = !_state;
                            });
                          },
                          activeColor: Colors.green,
                          value: _state,
                        ),
                      ]),
                       SizedBox(
                        height: 15,
                      ),
                      Row(children: <Widget>[
                        Icon(
                          Icons.bluetooth,
                          size: 30,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Bluetooth", style: TextStyle(fontSize: 18)),
                        SizedBox(
                          width: 160,
                        ),
                        Switch(
                          onChanged: (bool value) {
                            setState(() {
                              value = !_state;
                            });
                          },
                          activeColor: Colors.green,
                          value: _state,
                        ),
                      ]),
                    ],
                  ),
                ),
                new Card(
                  elevation: 20,
           child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                  Row(children: <Widget>[
                        Icon(
                          Icons.notifications_active,
                          size: 40,
                          color: Colors.grey[500],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Notficações", style: TextStyle(fontSize: 18)),
                        SizedBox(
                          width: 130,
                        ),
                         Switch(
                          onChanged: (bool value) {
                            _alterarStatusNotificacao(!notificationState);
                          },
                          activeColor: Colors.green,
                          value: notificationState,
                        ),
                      ]),
                      TextField(
                        onChanged: (text) {
                          _doSomething(text);
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.timer,
                            size: 40,
                            color: Colors.black,
                          ),
                          suffixIcon: Icon(
                            Icons.edit,
                            size: 40,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          labelText: " 15 min",
                          labelStyle: TextStyle(
                            height: 0,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
           ),
                ),
                    ],
           ),
        ),
        bottomNavigationBar: BottomApp(),
        floatingActionButton: FloatButton(),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked
        );



  }
}




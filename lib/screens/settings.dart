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
        resizeToAvoidBottomPadding: true,
        appBar: PreferredSize(
          child: AppBar(
            title: Text('Configurações',
                style: TextStyle(color: Colors.black, fontSize: 25)),
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          preferredSize: Size.fromHeight(70.0),
        ),
        body: Container(
            child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                        onChanged: (text) {
                          _doSomething(text);
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.edit,
                            size: 40,
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(color: Colors.black),
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Icon(
                          Icons.speaker_phone,
                          size: 40,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Conexão:", style: TextStyle(fontSize: 18)),
                      ]),
                      SizedBox(
                        height: 15,
                      ),
                      Row(children: <Widget>[
                        Icon(
                          Icons.wifi,
                          size: 40,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Wi-Fi", style: TextStyle(fontSize: 18)),
                        SizedBox(
                          width: 165,
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
                          size: 40,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Bluetooth", style: TextStyle(fontSize: 18)),
                        SizedBox(
                          width: 125,
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(color: Colors.black),
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Icon(
                          Icons.notifications_active,
                          size: 40,
                          // color: Colors.black,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Notficações", style: TextStyle(fontSize: 18)),
                        SizedBox(
                          width: 104,
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
                        keyboardType: TextInputType.number,
                        onChanged: (tempo) {
                          _alterarTempo(int.parse(tempo));
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
                          labelText: " $_tempo min",
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
        )),
        bottomNavigationBar: BottomApp(),
        floatingActionButton: FloatButton(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}

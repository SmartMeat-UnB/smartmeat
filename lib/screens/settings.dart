import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    String v = "";
    Widget _nomeWidget() {
      return Row(children: <Widget>[
        SizedBox(
          width: 15,
          height: 55,
        ),
        Icon(
          Icons.edit,
          size: 40,
          color: Colors.black,
        ),
        SizedBox(
          width: 20,
        ),
        Text("Nome: ", style: TextStyle(fontSize: 18)),
      ]);
    }

    void _doSomething(String text) {
      setState(() {
        v = text;
      });
    }

    return Scaffold(
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
          preferredSize: Size.fromHeight(100.0),
        ),
        body: Container(
          child: Container(
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
                      Column(
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
                              hintText: '$v',
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
                      Row(children: <Widget>[
                        // SizedBox(
                        //   height: 70,
                        // ),
                        // SizedBox(
                        //   width: 220,
                        // ),
                        // Icon(
                        //   Icons.edit,
                        //   size: 40,
                        //   // color: Colors.transparent,
                        // ),
                      ])
                    ],
                  ),
                ),
                SizedBox(
                  height: 55,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      // _buildRow(1),
                      // _buildRow(2),
                      // _buildRow(3),
                      // _buildRow(4),
                      // _buildRow(5),
                      // _buildRow(6),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

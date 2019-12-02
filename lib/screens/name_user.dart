import 'package:SmartMeat/widgets/buttons.dart';
import 'package:SmartMeat/widgets/image_banner.dart';
import 'package:SmartMeat/widgets/text_section.dart';
import 'package:SmartMeat/screens/tutorialWifi.dart';
import 'package:flutter/material.dart';

class NameUser extends StatefulWidget {
  @override
  _NameUserState createState() => _NameUserState();
}

class _NameUserState extends State<NameUser> {
  String username = "";

  @override
  Widget build(BuildContext context) {
    void setName(String text) {
      setState(() {
        username = text;
      });
    }

    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            child: SafeArea(
            child: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(height: _height * 0.02),
                // SizedBox(
                //   height: 3,
                // ),
                // Expanded(
                //   child: Image.asset(
                //     "images/SmartMeat.png",
                //     fit: BoxFit.fitHeight,
                //     height: 90.0,
                //     alignment: Alignment.topCenter,
                //   ),
                // ),
                ImageBanner("images/SmartMeat.png"),
                TextSection("\nDigite seu nome\n no campo abaixo!"),
                SizedBox(height: _height * 0.04),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextField(
                            onChanged: (text) {
                              setName(text);
                            },
                            decoration: InputDecoration(
                              // border: InputBorder.none,
                              hintText: 'Insira seu nome',
                              labelText: "Nome",
                              labelStyle: TextStyle(
                                height: 0,
                                fontSize: 30,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ])),
                SizedBox(height: _height * 0.05),
                Container(
                  alignment: Alignment(0.0, 0.9),
                  padding: EdgeInsets.all(20.0),
                  child: ButtonTheme(
                      minWidth: 100.0,
                      height: 60.0,
                      child: FloatingActionButton(
                        child: Text(
                          '✔',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/tutorial1');
                        },
                      )),
                ),
              ],
            )))));
  }
}

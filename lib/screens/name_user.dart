import 'package:SmartMeat/widgets/buttons.dart';
import 'package:SmartMeat/widgets/image_banner.dart';
import 'package:SmartMeat/widgets/text_section.dart';
import 'package:flutter/material.dart';

class NameUser extends StatefulWidget {
  @override
  _NameUserState createState() => _NameUserState();
}

class _NameUserState extends State<NameUser> {
  String v = "";

  @override
  Widget build(BuildContext context) {
    void _doSomething(String text) {
      setState(() {
        v = text;
      });
    }

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(
                  height: 3,
                ),
                ImageBanner("images/SmartMeat.png"),
                TextSection(
                    "Vamos iniciar.\nPor favor,\n digite seu nome\n no campo abaixo!"),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextField(
                            onChanged: (text) {
                              _doSomething(text);
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Insira seu nome',
                              labelText: "Nome:",
                              labelStyle: TextStyle(
                                height: 0,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ])),
                Botao('PRONTO!', v),
              ],
            ))));
  }
}

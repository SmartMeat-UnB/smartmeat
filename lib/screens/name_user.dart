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
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 3,
            ),
            ImageBanner("images/SmartMeat.png"),
            TextSection(
                "Vamos iniciar.\nPor favor,\n digite seu nome\n no campo abaixo!"),
            TextField(
              onChanged: (text) {
                _doSomething(text);
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '      Insira seu nome',
                labelText: "      Nome:",
                labelStyle: TextStyle(
                  height: 0,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Botao('PRONTO!', v),
          ],
        ));
  }
}

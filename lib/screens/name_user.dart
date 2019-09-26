import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart' as connectivity;
import 'package:smartmeat/screens/text_section.dart';
import 'image_banner.dart';
import 'buttons.dart';


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImageBanner("images/SmartMeat.png"),
          TextSection("Vamos iniciar.", "Por favor,\n digite seu nome\n no campo abaixo!"),
          TextField(
            decoration: InputDecoration(labelText: "Nome",
            border: OutlineInputBorder()),
          ),
         Botao(),
        ],
      )
      );

  }
}

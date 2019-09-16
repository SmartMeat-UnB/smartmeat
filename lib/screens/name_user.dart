import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart' as connectivity;
import 'package:smartmeat/screens/text_section.dart';
import 'image_banner.dart';


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          ImageBanner("assets/images/Smart-Meat-2.png"),
          TextSection("TESTETESTETESTETESTETESTETESTETESTE"),
        ],
      )
      );

  }
}

import 'package:SmartMeat/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';

class Churrasqueira extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget espeto(bool d) {
      return Visibility(
        child: Image.asset(
          "images/espeto.jpg",
          fit: BoxFit.cover,
          height: 150.0,
        ),
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        visible: d,
      );
    }

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset(
                  "images/churrasqueira.png",
                  fit: BoxFit.cover,
                  height: 190.0,
                ),
              ],
            ),
            Positioned(
              top: 20,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 43,
                  ),
                  espeto(true),
                  SizedBox(
                    width: 9,
                  ),
                  espeto(false),
                  SizedBox(
                    width: 8,
                  ),
                  espeto(true),
                  SizedBox(
                    width: 9,
                  ),
                  espeto(false),
                  SizedBox(
                    width: 9,
                  ),
                  espeto(true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Churrasqueira extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget espeto(bool d) {
      return Visibility(
        child: Image.asset(
          "images/espeto.png",
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
        alignment: Alignment.center,
        margin: EdgeInsets.all(30),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset(
                  "images/bbq.png",
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
                    width: 48,
                  ),
                  espeto(true),
                  SizedBox(
                    width: 10,
                  ),
                  espeto(true),
                  SizedBox(
                    width: 8,
                  ),
                  espeto(true),
                  SizedBox(
                    width: 5,
                  ),
                  espeto(true),
                  SizedBox(
                    width: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

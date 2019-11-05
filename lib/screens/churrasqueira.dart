import 'package:SmartMeat/screens/smartMeat/generalSmartMeat.dart';
import 'package:flutter/material.dart';

class Churrasqueira extends StatelessWidget {
  final GeneralSmartMeat smartMeat;

  const Churrasqueira(this.smartMeat);
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
                  espeto(smartMeat.smartmeat.stick1.active),
                  SizedBox(
                    width: 10,
                  ),
                  espeto(smartMeat.smartmeat.stick2.active),
                  SizedBox(
                    width: 8,
                  ),
                  espeto(smartMeat.smartmeat.stick3.active),
                  SizedBox(
                    width: 5,
                  ),
                  espeto(smartMeat.smartmeat.stick4.active),
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

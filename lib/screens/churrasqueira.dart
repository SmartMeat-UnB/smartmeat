import 'package:SmartMeat/screens/smartMeat/generalSmartMeat.dart';
import 'package:auto_size_text/auto_size_text.dart';
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

    Widget timer() {
      return Visibility(
        child: Image.asset(
          "images/quadrado.png",
          fit: BoxFit.cover,
          height: 40.0,
        ),
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        visible: true,
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
            Positioned(
              top: 185,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 48,
                  ),
                  timer(),
                  SizedBox(
                    width: 20,
                  ),
                  timer(),
                  SizedBox(
                    width: 20,
                  ),
                  timer(),
                  SizedBox(
                    width: 23,
                  ),
                  timer(),
                  SizedBox(
                    width: 4,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 223,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 48,
                  ),
                  AutoSizeText(
                    "min",
                    presetFontSizes: [20.0, 20.0, 14.0],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  AutoSizeText(
                    "min",
                    presetFontSizes: [20.0, 20.0, 14.0],
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),                  
                  SizedBox(
                    width: 24,
                  ),
                  AutoSizeText(
                    "min",
                    presetFontSizes: [20.0, 20.0, 14.0],
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 23,
                  ),
                  AutoSizeText(
                    "min",
                    presetFontSizes: [20.0, 20.0, 14.0],
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 193,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 54,
                  ),
                  AutoSizeText(
                    "5",
                    presetFontSizes: [30.0, 20.0, 14.0],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 37,
                  ),
                  AutoSizeText(
                    "3",
                    presetFontSizes: [30.0, 20.0, 14.0],
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),                  
                  SizedBox(
                    width: 31,
                  ),
                  AutoSizeText(
                    "10",
                    presetFontSizes: [30.0, 20.0, 14.0],
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 26,
                  ),
                  AutoSizeText(
                    "15",
                    presetFontSizes: [30.0, 20.0, 14.0],
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
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

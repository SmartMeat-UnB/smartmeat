import 'package:SmartMeat/screens/smartMeat/generalSmartMeat.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Churrasqueira extends StatelessWidget {
  final GeneralSmartMeat smartMeat;

  const Churrasqueira(this.smartMeat);
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    // find a variable length hex value at the beginning of the line
    final regexp = RegExp(r'\d\d'); 

    Widget espeto(bool d) {
      return Visibility(
        child: Image.asset(
          "images/espeto.png",
          fit: BoxFit.cover,
          height: _height * 0.30,
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
          height: _height * 0.1,
          width: _width * 0.1,
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
                  // height: 190.0,
                  height: _height * 0.35,
                ),
              ],
            ),
            Positioned(
              top: _height * 0.02,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: _width * 0.133,
                    // width: 48,
                  ),
                  espeto(smartMeat.smartmeat.stick1.active),
                  SizedBox(
                    width: _width * 0.015,
                  ),
                  espeto(smartMeat.smartmeat.stick2.active),
                  SizedBox(
                    width: _width * 0.015,
                  ),
                  espeto(smartMeat.smartmeat.stick3.active),
                  SizedBox(
                    width: _width * 0.007,
                  ),
                  espeto(smartMeat.smartmeat.stick4.active),
                ],
              ),
            ),
            Positioned(
              top: _height * 0.3,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: _width * 0.15,
                  ),
                  timer(),
                  SizedBox(
                    width: _width * 0.05,
                  ),
                  timer(),
                  SizedBox(
                    width: _width * 0.05,
                  ),
                  timer(),
                  SizedBox(
                    width: _width * 0.05,
                  ),
                  timer(),
                  SizedBox(
                    width: _width * 0.05,
                  ),
                ],
              ),
            ),
            Positioned(
              // top: _height * 0.3,
              top: _height * 0.1,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: _width * 0.16,
                    height: _height * 0.45,
                  ),
                  AutoSizeText(
                    regexp.firstMatch(smartMeat.smartmeat.stick1.timeActive.toString()).group(0).toString(),
                    // thisInstant.difference(smartMeat.smartmeat.stick1.timeActive.toString()),
                    presetFontSizes: [25.0, 20.0, 14.0],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: _width * 0.09,
                    // width: 30,
                  ),
                  AutoSizeText(
                    regexp.firstMatch(smartMeat.smartmeat.stick2.timeActive.toString()).group(0).toString(),
                    presetFontSizes: [25.0, 20.0, 14.0],
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),                  
                  SizedBox(
                    width: _width * 0.075,
                  ),
                  AutoSizeText(
                    regexp.firstMatch(smartMeat.smartmeat.stick3.timeActive.toString()).group(0).toString(),
                    presetFontSizes: [25.0, 20.0, 14.0],
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: _width * 0.08,
                    // width: 30,
                  ),
                  AutoSizeText(
                    regexp.firstMatch(smartMeat.smartmeat.stick4.timeActive.toString()).group(0).toString(),
                    presetFontSizes: [25.0, 20.0, 14.0],
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
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

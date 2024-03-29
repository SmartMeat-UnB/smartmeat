import 'dart:typed_data';

import 'package:SmartMeat/screens/smartMeat/generalSmartMeat.dart';
import 'package:SmartMeat/screens/smartMeat/stick.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Churrasqueira extends StatelessWidget {
  final GeneralSmartMeat smartMeat;
  final int tempo;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  const Churrasqueira(this.smartMeat, this.tempo, this.flutterLocalNotificationsPlugin);
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    bool notificationState = false;

    int notificationTime = tempo ~/ 60;

    final regexp = RegExp(r'\d\d:(\d\d)'); 
    DateFormat dateFormat = new DateFormat.Hm(); 

    Future<void> scheduleNotification(Stick stick) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      notificationState = (prefs.getBool('notificacao'));

      if (notificationState && stick.active) {
        var vibrationPattern = Int64List(4);
        vibrationPattern[0] = 0;
        vibrationPattern[1] = 1000;
        vibrationPattern[2] = 5000;
        vibrationPattern[3] = 2000;

        var androidPlatformChannelSpecifics = AndroidNotificationDetails(
            'your channel id', 'your channel name', 'your channel description',
            largeIconBitmapSource: BitmapSource.Drawable,
            vibrationPattern: vibrationPattern,
            enableLights: true,
            color: const Color.fromARGB(255, 255, 0, 0),
            ledColor: const Color.fromARGB(255, 255, 0, 0),
            ledOnMs: 1000,
            ledOffMs: 500);
        var iOSPlatformChannelSpecifics =
            IOSNotificationDetails(sound: "slow_spring_board.aiff");
        var platformChannelSpecifics = NotificationDetails(
            androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
        await flutterLocalNotificationsPlugin.show(
          0,
          'Seu churrasco te espera!',
          'o seu espetinho já esta pronto!',
          platformChannelSpecifics,
          payload: 'item x'
          ); 
      }
    }


    String notifyIn(Stick stick) {
      if (!stick.active) {
        return "00";
      }
      var now = new DateTime.now();
      int nowMinute = int.parse(regexp.firstMatch(dateFormat.format(now)).group(1).toString());
      int stickMinute = int.parse(regexp.firstMatch(stick.timeActive).group(1).toString());

      if (nowMinute < stickMinute) { 
        nowMinute += 60; 
      }
      int minutesActive = nowMinute - stickMinute;

      if (minutesActive == notificationTime) { 
        print("Notificacao Ativada");
        scheduleNotification(stick); 
      }

      if (minutesActive < 10) {
        return "0" + minutesActive.toString();
      }

      return minutesActive.toString();
    }

    Widget espeto(bool d) {
      return Visibility(
        child: Image.asset(
          "images/espeto.png",
          fit: BoxFit.cover,
          height: _height * 0.265,
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
          height: _height * 0.05,
          width: _width * 0.1,
        ),
        // maintainSize: true,
        // maintainAnimation: true,
        // maintainState: true,
        // visible: true,
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
                  height: _height * 0.3,
                ),
              ],
            ),
            Positioned(
              top: _height * 0.016,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: _width * 0.1,
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
                    notifyIn(smartMeat.smartmeat.stick1),
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
                    notifyIn(smartMeat.smartmeat.stick2),
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
                    notifyIn(smartMeat.smartmeat.stick3),
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
                    notifyIn(smartMeat.smartmeat.stick4),
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

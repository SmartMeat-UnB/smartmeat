import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification extends StatefulWidget {
  @override
  _LocalNotificationState createState() => new _LocalNotificationState();
}

class _LocalNotificationState extends State<LocalNotification> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A Carne esta ao ponto'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: showNotification,
          child: Text(
            'teste',
            style: Theme.of(context).textTheme.headline,
          ),
        ),
      ),
    );
  }

  showNotification() async {
    var android = AndroidNotificationDetails('carne', 'assada', 'no ponto',
        priority: Priority.High, importance: Importance.Max);
    var iOS = IOSNotificationDetails();
    var platform = NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(0, ' pi2', 'smart', platform,
        payload: 'meat');
  }
}

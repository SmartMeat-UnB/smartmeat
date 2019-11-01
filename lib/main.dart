import 'package:SmartMeat/screens/introState.dart';
import 'package:SmartMeat/screens/notification.dart';
import 'package:flutter/material.dart';
import 'package:SmartMeat/screens/imagecell.dart';
import 'package:SmartMeat/screens/tutorialWifi.dart';
import 'package:SmartMeat/screens/tutorial_screen.dart';
import 'package:SmartMeat/tabs/home_tab.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/home': (context) => HomeTab(),
      '/recipe': (context) => ImagesCell(),
      '/tutorial': (context) => TutorialScreen(),
      '/tutorial1': (context) => TutorialWifi(),
    }, debugShowCheckedModeBanner: false, home: LocalNotificationa());
  }
}

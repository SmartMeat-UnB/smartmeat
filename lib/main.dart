import 'package:SmartMeat/screens/introState.dart';
import 'package:SmartMeat/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:SmartMeat/screens/imagecell.dart';
import 'package:SmartMeat/screens/tutorialWifi.dart';
import 'package:SmartMeat/screens/tutorial_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:SmartMeat/screens/informationsRasp.dart';
// import 'package:flutter/rendering.dart';

void main() async {
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/home': (context) => InformationRasp(),
          '/recipe': (context) => ImagesCell(),
          '/tutorial': (context) => TutorialScreen(),
          '/tutorial1': (context) => TutorialWifi(),
          '/settings': (context) => Settings(),
        },
        title: 'Smart\n Meat',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: Splash());
  }
}

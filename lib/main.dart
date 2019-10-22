// import 'package:SmartMeat/screens/testt.dart';
import 'package:flutter/material.dart';
import 'package:SmartMeat/screens/imagecell.dart';
import 'package:SmartMeat/screens/result_IA.dart';
import 'package:SmartMeat/screens/tutorialWifi.dart';
import 'package:SmartMeat/screens/tutorial_screen.dart';
import 'package:SmartMeat/tabs/home_tab.dart';
import 'package:SmartMeat/screens/informationsRasp.dart';

void main() {
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
    }, debugShowCheckedModeBanner: false, home: ImagesCell());
  }
}

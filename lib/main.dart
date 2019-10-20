import 'package:SmartMeat/screens/introState.dart';
import 'package:flutter/material.dart';
import 'package:SmartMeat/screens/recipe.dart';
import 'package:SmartMeat/screens/result_IA.dart';
import 'package:SmartMeat/screens/tutorialWifi.dart';
import 'package:SmartMeat/screens/tutorial_screen.dart';
import 'package:SmartMeat/tabs/home_tab.dart';
import 'package:SmartMeat/screens/informationsRasp.dart';
import 'package:flutter/rendering.dart';


void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/home': (context) => InformationRasp(),
          '/resultado': (context) => ResultIA(),
          '/recipe': (context) => Recipe(),
          '/tutorial': (context) => TutorialScreen(),
          '/tutorial1': (context) => TutorialWifi(),
        },
        
        debugShowCheckedModeBanner: false,
        home: Splash()
    );
  }
}

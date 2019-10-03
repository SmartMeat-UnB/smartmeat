import 'package:flutter/material.dart';
import 'package:smartmeat/screens/introState.dart';
import 'package:smartmeat/screens/receita.dart';
import 'package:smartmeat/screens/result_IA.dart';
import 'package:smartmeat/screens/tutorialWifi.dart';
import 'package:smartmeat/screens/tutorial_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/resultado': (context) => ResultIA(),
          '/receita': (context) => Receita(),
          '/tutorial': (context) => TutorialScreen(),
          '/tutorial1': (context) => TutorialWifi(),
        },
        title: 'Smart\n Meat',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: Splash());
  }
}

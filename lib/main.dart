import 'package:flutter/material.dart';
import 'package:smartmeat/screens/home_screen.dart';
import 'package:smartmeat/screens/result_IA.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/sd': (context) => ResultIA(),
        },
        title: 'Smart Meat',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}

import 'package:flutter/material.dart';
import 'package:smartmeat/screens/crop.dart';
import 'package:smartmeat/screens/receita.dart';
import 'package:smartmeat/screens/result_IA.dart';
import 'package:smartmeat/tabs/home_tab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/resultado': (context) => ResultIA(),
          '/receita': (context) => Receita(),
        },
        title: 'Smart\n Meat',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeTab());
  }
}

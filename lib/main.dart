import 'package:flutter/material.dart';
import 'package:smartmeat/screens/receita.dart';
import 'package:smartmeat/screens/result_IA.dart';
import 'package:smartmeat/tabs/home_tab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/sd': (context) => Receita(),
        },
        title: 'Smart\n Meat',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeTab());
  }
}

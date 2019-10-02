import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:SmartMeat/tabs/home_tab.dart';
import 'package:SmartMeat/screens/intro.dart';


class Splash extends StatefulWidget {
@override
SplashState createState() =>  SplashState();
}

class SplashState extends State<Splash> {
Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
    Navigator.of(context).pushReplacement(
         MaterialPageRoute(builder: (context) => HomeTab()));
    } else {
    prefs.setBool('seen', true);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomePage()));
    }
}

@override
void initState() {
    super.initState();
     Timer( Duration(milliseconds: 20), () {
    checkFirstSeen();
    });
}

@override
Widget build(BuildContext context) {
    return  Scaffold(
    body:  Center(
        child:  Text('Loading...'),
    ),
    );
}
}
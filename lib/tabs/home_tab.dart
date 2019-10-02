import 'package:flutter/material.dart';
import 'package:SmartMeat/widgets/bottom_app_bar.dart';
import 'package:SmartMeat/widgets/float_button.dart';
import 'package:SmartMeat/screens/informations.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() {
      var scaffold = Scaffold(
          appBar: AppBar(
            title: const Text("Smart\n       Meat",
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                strutStyle: StrutStyle(height: 1.4, forceStrutHeight: true)),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: Informations(),
          bottomNavigationBar: BottomApp(),
          floatingActionButton: FloatButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked);
      return scaffold;
    }

    return Stack(
      children: <Widget>[
        _buildBodyBack(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smartmeat/widgets/bottom_app_bar.dart';

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
          bottomNavigationBar: BottomApp(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 169, 0, 52),
            onPressed: () {
              Navigator.pushNamed(context, '/sd');
              print('as');
            },
            child: Icon(
              Icons.camera,
              size: 40,
            ),
          ),
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

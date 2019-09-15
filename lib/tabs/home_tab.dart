import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
          ),
        );
    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.all(5),
                title: const Text("Smart\n       Meat",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                    strutStyle:
                        StrutStyle(height: 1.4, forceStrutHeight: true)),
                centerTitle: true,
              ),
            )
          ],
        )
      ],
    );
  }
}

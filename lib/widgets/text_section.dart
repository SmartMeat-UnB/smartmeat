import 'package:flutter/material.dart';

class  TextSection extends StatelessWidget {
  final String _title;

  TextSection(this._title);

  @override
  Widget build(BuildContext context) {
    return      Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            Text(_title, style: TextStyle(height: 1, fontSize: 30), textAlign: TextAlign.center,),
          ],
        ),
      );
  }
}
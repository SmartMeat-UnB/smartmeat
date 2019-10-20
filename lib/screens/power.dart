import 'dart:async';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'temp.dart';


class power extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.power_settings_new,),iconSize: 90,
            tooltip: 'Ligar',
            //color: Colors.black,
            onPressed: () {}
          ),

        ]
        
      ),
      
    ),

          
        ],
        
        )
        
        );
  }
}


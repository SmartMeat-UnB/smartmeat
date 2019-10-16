import 'dart:async';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class temp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: Text('Hello'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
         decoration: BoxDecoration(              
            ),
            child:SizedBox(
             child: Card(
              elevation: 20,
               child: Column(
                 children: [
                    ListTile(
                     title: Text('Sensor de Temperatura:',
                         style: TextStyle(fontWeight: FontWeight.w500)),
                     subtitle: Text('90 ºC',), 
                     leading: Icon(
                       MdiIcons.thermometerAlert, size: 50, 
                       color: Colors.red[500],
                     ),
                     
                  ),
    
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                     
                      children: [
                        IconButton(
                          icon: Icon(MdiIcons.plusCircleOutline), iconSize: 50, color: Colors.green,
                          onPressed: (){},
                        ),
                        IconButton(
                          icon: Icon(MdiIcons.minusCircleOutline), iconSize: 50, color: Colors.red,
                          onPressed: (){},
                        )
                      ],
                    )
                       
                 ], 
               ),
               
             ),
          ),
   ),
        ],
      ),
    );

    
    
    
    
    }
    
    }
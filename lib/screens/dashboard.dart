import 'dart:async';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'temp.dart';
import 'power.dart';

class dash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
        body: Column(
          temp(); 
           power();
        )
          

    );
    
      
  }
}
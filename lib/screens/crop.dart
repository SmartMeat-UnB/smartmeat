import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartmeat/widgets/bottom_app_bar.dart';
import 'package:smartmeat/widgets/float_button.dart';

class CropImage extends StatefulWidget {
  final Image imageFile;
  CropImage(this.imageFile);
  @override
  _CropImageState createState() => _CropImageState();
}

class _CropImageState extends State<CropImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomApp(),
        body: Container(
          child: Column(
            children: <Widget>[
              Card(
                child: widget.imageFile,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatButton(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}

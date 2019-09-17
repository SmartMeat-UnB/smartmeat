import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartmeat/widgets/bottom_app_bar.dart';
import 'package:smartmeat/widgets/float_button.dart';

class CropImage extends StatefulWidget {
  final File imageFile;
  CropImage(this.imageFile);
  @override
  _CropImageState createState() => _CropImageState();
}

class _CropImageState extends State<CropImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        bottomNavigationBar: BottomApp(),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 300,
                height: 300,
                child: Card(
                  child: Image.file(
                    widget.imageFile,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 100.0,
                    height: 50.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.crop,
                            size: 35,
                          ),
                          SizedBox(width: 15.0),
                          Text(
                            'Cortar',
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/crop');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatButton(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}

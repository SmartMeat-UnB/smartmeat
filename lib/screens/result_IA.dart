import 'dart:io';

import 'package:SmartMeat/widgets/bottom_app_bar.dart';
import 'package:SmartMeat/widgets/float_button.dart';
import 'package:flutter/material.dart';

class ResultIA extends StatelessWidget {
  final File imageFile;
  ResultIA(this.imageFile);
  @override
  Widget build(BuildContext context) {
    Image imageCropped = Image.file(
      imageFile,
      fit: BoxFit.cover,
    );
    Widget results(int receita) {
      return ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ButtonTheme(
            minWidth: 300,
            height: 100.0,
            child: RaisedButton(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Card(
                      child: Container(
                    width: 80,
                    height: 80,
                    child: Image.file(
                      imageFile,
                      fit: BoxFit.cover,
                    ),
                  )),
                  SizedBox(width: 50.0),
                  Text(
                    'Receita $receita',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              onPressed: () {
                //getImageGallery();
              },
            ),
          ),
        ],
      );
    }

    return Scaffold(
        bottomNavigationBar: BottomApp(),
        body: Stack(
          children: <Widget>[
            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Resultados",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22)),
                    SizedBox(
                      height: 20,
                    ),
                    results(1),
                  ],
                ),
              ),
            ),
          ],
        ),
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
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        floatingActionButton: FloatButton(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}

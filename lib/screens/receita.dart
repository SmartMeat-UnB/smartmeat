import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartmeat/widgets/bottom_app_bar.dart';
import 'package:smartmeat/widgets/float_button.dart';

import 'crop.dart';

class Receita extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  Receita({this.onPressed, this.tooltip, this.icon});

  @override
  _ReceitaState createState() => _ReceitaState();
}

class _ReceitaState extends State<Receita> with SingleTickerProviderStateMixin {
  bool isOpened = false;
  File _image;
  Image imageFile;

  void pedirReceita() {
    Navigator.pushNamed(context, '/resultado');
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  Future getImageGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CropImage(image)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomApp(),
        body: Stack(
          children: <Widget>[
            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 70.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ButtonTheme(
                          minWidth: 300,
                          height: 100.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: Colors.white,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.file_upload,
                                  size: 35,
                                ),
                                SizedBox(width: 15.0),
                                Text(
                                  'Fazer Upload',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 25),
                                ),
                              ],
                            ),
                            onPressed: () {
                              getImageGallery();
                            },
                          ),
                        ),
                      ],
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ButtonTheme(
                          minWidth: 300.0,
                          height: 100.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: Colors.white,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.camera_alt,
                                  size: 35,
                                ),
                                SizedBox(width: 40.0),
                                Text(
                                  'Tirar Foto',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 25),
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
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _image == null
                          ? null
                          : ButtonTheme(
                              minWidth: 150.0,
                              height: 50.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                color: Colors.green,
                                child: Text(
                                  'Enviar',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/resultado');
                                },
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
        ),
        floatingActionButton: FloatButton(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}

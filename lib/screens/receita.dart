import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartmeat/widgets/bottom_app_bar.dart';
import 'package:smartmeat/widgets/float_button.dart';

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
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Animation<double> _translateButtonD;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;
  File _image;
  Image imageFile;

  void pedirReceita() {
    Navigator.pushNamed(context, 'resultado');
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
      _image = image;
    });
  }

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Color.fromARGB(255, 169, 0, 52),
      end: Color.fromARGB(255, 169, 0, 52),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: 56,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    _translateButtonD = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget add() {
    return Container(
      child: FloatingActionButton(
        heroTag: "btn3",
        backgroundColor: Color.fromARGB(255, 169, 0, 52),
        onPressed: () {
          getImage();
          animate();
        },
        tooltip: 'Camera',
        child: Icon(Icons.camera_alt),
      ),
    );
  }

  Widget image() {
    return Container(
      child: FloatingActionButton(
        heroTag: "btn2",
        backgroundColor: Color.fromARGB(255, 169, 0, 52),
        onPressed: () {
          getImageGallery();
          animate();
        },
        tooltip: 'Image',
        child: Icon(Icons.image),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        heroTag: "btn1",
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.view_list,
          progress: _animateIcon,
        ),
      ),
    );
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
                              Navigator.pushNamed(context, '/resultado');
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
                              Navigator.pushNamed(context, '/resultado');
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // onTap: () {
              //   print("tapped on container");
              // },
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(vertical: 15.0),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //       Card(

            //         child: _image == null
            //             ? Image.asset(
            //                 "images/noImage.png",
            //                 fit: BoxFit.cover,
            //                 width: 350,
            //                 height: 350.0,
            //               )
            //             : imageFile = Image.file(
            //                 _image,
            //                 width: 350,
            //                 height: 350.0,
            //                 fit: BoxFit.fill,
            //               ),
            //       ),
            //     ],
            //   ),
            // ),
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
    ;
  }
}

// Container(
//   padding: EdgeInsets.fromLTRB(280, 0, 0, 15),
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.end,
//     children: <Widget>[
//       Transform(
//         transform: Matrix4.translationValues(
//           0.0,
//           _translateButton.value * 2.0,
//           0.0,
//         ),
//         child: add(),
//       ),
//       Transform(
//         transform: Matrix4.translationValues(
//           0.0,
//           _translateButtonD.value * 1.0,
//           0.0,
//         ),
//         child: image(),
//       ),
//       // _image == null ? null : toggle(),
//       toggle(),
//     ],
//   ),
// ),

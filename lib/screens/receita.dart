import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:SmartMeat/widgets/bottom_app_bar.dart';
import 'package:SmartMeat/widgets/float_button.dart';
import 'package:http/http.dart' as http;
import 'crop.dart';

class Receita extends StatefulWidget {
  Receita();

  @override
  _ReceitaState createState() => _ReceitaState();
}

class _ReceitaState extends State<Receita> with SingleTickerProviderStateMixin {
  File image;
  final String inverseCookingEndPoint = 'http://localhost:3000/predict';

  // void pedirReceita() {
  //   Navigator.pushNamed(context, '/resultado');
  // }

  void getRecipe() {
    if (image == null) return;
    String base64Image = base64Encode(image.readAsBytesSync());
    String fileName = image.path.split("/").last;

    http.post(inverseCookingEndPoint, body: {
      "image": base64Image,
      "name": fileName,
    }).then((res) {
      print(res.statusCode);
    }).catchError((err) {
      print(err);
    });
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      if (image != null)
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CropImage(image)));
    });
  }

  Future getImageGallery() async {
    print("Started image getter");
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    print("Image read!");

    setState(() {
      if (image != null) {
      print("Set State, image not null!!");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CropImage(image)));
      print("Exiting");
      }
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
                              getImage();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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

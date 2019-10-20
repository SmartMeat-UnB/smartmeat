import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:SmartMeat/widgets/bottom_app_bar.dart';
import 'package:SmartMeat/widgets/float_button.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class CropImage extends StatefulWidget {
  final File imageFile;
  CropImage(this.imageFile);
  @override
  _CropImageState createState() => _CropImageState();
}

class _CropImageState extends State<CropImage> {
  Image imageCropped;
  File croppedFile;

  Future<Null> _cropImage(File imageFile) async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      // ratioX: 1.0,
      // ratioY: 1.0,
      maxWidth: 512,
      maxHeight: 512,
      // toolbarTitle: "Smart Meat Crop",
      // toolbarColor: Colors.white,
    );
    setState(() {
      imageCropped = Image.file(
        croppedFile,
        fit: BoxFit.cover,
      );
      this.croppedFile = croppedFile;
      getRecipe();
    });
  }

  // final String inverseCookingEndPoint = 'http://localhost:3000/predict';
  final String inverseCookingEndPoint = 'http://10.0.2.2:3000/predict';
  // final String inverseCookingEndPoint = "ubuntu@ec2-18-231-150-126.sa-east-1.compute.amazonaws.com:3000/predict";

  Future<String> getRecipe() async {
      if (croppedFile == null) return "Cropped file returned Null";
      String base64Image = base64Encode(croppedFile.readAsBytesSync());
      String fileName = croppedFile.path.split("/").last;

      await http.post(inverseCookingEndPoint, body: {
        "image": base64Image,
        "name": fileName,
      }).then((res) {
        print(res.statusCode);
        print(res.body);
      }).catchError((err) {
        print(err);
      });
    }

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
                  child: imageCropped == null
                      ? Image.file(
                          widget.imageFile,
                          fit: BoxFit.cover,
                        )
                      : imageCropped,
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  imageCropped != null
                      ? ButtonTheme(
                          minWidth: 150.0,
                          height: 50.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: Colors.green,
                            child: Text(
                              'Enviar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/resultado');
                            },
                          ),
                        )
                      : ButtonTheme(
                          minWidth: 150.0,
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
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 25),
                                ),
                              ],
                            ),
                            onPressed: () {
                              _cropImage(widget.imageFile);
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
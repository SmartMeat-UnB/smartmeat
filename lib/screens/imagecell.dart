import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:SmartMeat/widgets/bottom_app_bar.dart';
import 'package:SmartMeat/widgets/float_button.dart';
import 'crop.dart';

class ImagesCell extends StatefulWidget {
  ImagesCell();

  @override
  _ImagesCellState createState() => _ImagesCellState();
}

class _ImagesCellState extends State<ImagesCell>
    with SingleTickerProviderStateMixin {
  Image imageFile;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      if (image != null)
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CropImage(image)));
    });
  }

  Future getImageGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null)
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CropImage(image)));
    });
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
        bottomNavigationBar: BottomApp(),
        body: Stack(
          children: <Widget>[
            Container(
              height: _height * 0.2,
              width: _width,
              child:
                Text(
                  "Inverse Cooking",
                  style: TextStyle(
                      fontSize: 38.0,
                      color: Colors.black87,
                      fontFamily: 'Pacifico'
                    ),
                    strutStyle: StrutStyle(height: _height * 0.01, forceStrutHeight: true),
                    textAlign: TextAlign.center
                ),
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: _height * 0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ButtonTheme(
                          minWidth: _width * 0.65,
                          height: _height * 0.1,
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
                                SizedBox(width: _width * 0.05),
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
                          minWidth: _width * 0.65,
                          height: _height * 0.1,
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
                                SizedBox(width: _width * 0.05),
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
          title: const Text('Imagem Para Receita',
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.white,
                    fontFamily: 'Pacifico'),
                    textAlign: TextAlign.center,
                    strutStyle: StrutStyle(height: 2.5, forceStrutHeight: true)),
                    centerTitle: true,
                               
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          backgroundColor: Colors.red[900],
        ),
        floatingActionButton: FloatButton(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}

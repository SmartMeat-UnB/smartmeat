import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Receita extends StatefulWidget {
  @override
  _ReceitaState createState() => _ReceitaState();
}

class _ReceitaState extends State<Receita> {
  File _image;
  
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
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 169, 0, 52),
          ),
        );
    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("SmartMeat"),
                centerTitle: true,
              ),
            )
          ],
        )
      ],
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String im;

  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[+
        Scaffold(
          appBar: AppBar(
            title: Text('Image Picker Example'),
          ),
          body: Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(_image),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: getImage,
            tooltip: 'Pick Image',
            child: Icon(Icons.add_a_photo),
          ),
        )
      ],
    );
  }
}


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smartmeat/screens/home_screen.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Smart Meat',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   File _image;
//   String im;

//   Future getImage() async {
//     var image = await ImagePicker.pickImage(source: ImageSource.camera);

//     setState(() {
//       _image = image;
//     });
//   }

//   Future getImageGallery() async {
//     var image = await ImagePicker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       _image = image;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[+
//         Scaffold(
//           appBar: AppBar(
//             title: Text('Image Picker Example'),
//           ),
//           body: Center(
//             child: _image == null
//                 ? Text('No image selected.')
//                 : Image.file(_image),
//           ),
//           floatingActionButton: FloatingActionButton(
//             onPressed: getImage,
//             tooltip: 'Pick Image',
//             child: Icon(Icons.add_a_photo),
//           ),
//         )
//       ],
//     );
//   }
// }

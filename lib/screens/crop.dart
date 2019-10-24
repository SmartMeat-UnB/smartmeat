import 'dart:io';
import 'package:SmartMeat/screens/recipes/recipes.dart';
import 'package:SmartMeat/screens/recipes/result_IA.dart';
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

String jsonRecipe = 'vazio';

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
      jsonRecipe = null;
      imageCropped = Image.file(
        croppedFile,
        fit: BoxFit.cover,
      );
      this.croppedFile = croppedFile;
      jsonRecipe =
          '{"recipes": [{"ingrs": ["zucchini","oil","salt","squash","pepper","eggplant"],"recipe": ["Preheat grill to medium-high.","Brush eggplant slices with oil and season with salt and pepper.","Grill, turning once, until tender and lightly charred, about 10 minutes.","Transfer to a platter and let cool.","Cut into 1/2-inch slices.","Serve with grilled zucchini."],"title": "Grilled eggplant and zucchini"},{"ingrs": ["zucchini","oil","salt","squash","pepper","eggplant"],"recipe": ["Slice the squash and slice into rounds, then brush with olive oil.","Season with salt and pepper.","Grill over high heat, turning once to char all sides.","Sprinkle with fresh grated cheese and serve."],"title": "Eggplant with zucchini (aubergine)"}]}';

      // getRecipe();
    });
  }

  // final String inverseCookingEndPoint = 'http://localhost:3000/predict';
  final String inverseCookingEndPoint = 'http://10.0.2.2:3000/predict';
  // final String inverseCookingEndPoint = "ubuntu@ec2-18-231-150-126.sa-east-1.compute.amazonaws.com:3000/predict";

  Future getRecipe() async {
    if (croppedFile == null) return "Cropped file returned Null";
    String base64Image = base64Encode(croppedFile.readAsBytesSync());
    String fileName = croppedFile.path.split("/").last;

    await http.post(inverseCookingEndPoint, body: {
      "image": base64Image,
      "name": fileName,
    }).then((res) {
      if (res.statusCode == 200)
        setState(() {
          jsonRecipe = res.body;
        });
      else
        print(
            "Server returned a non 200 status, status received: ${res.statusCode}");
    }).catchError((err) {
      print(err);
    });
  }

  // String jsonRecipe =
  //     '{"recipes": [{"ingrs": ["zucchini","oil","salt","squash","pepper","eggplant"],"recipe": ["Preheat grill to medium-high.","Brush eggplant slices with oil and season with salt and pepper.","Grill, turning once, until tender and lightly charred, about 10 minutes.","Transfer to a platter and let cool.","Cut into 1/2-inch slices.","Serve with grilled zucchini."],"title": "Grilled eggplant and zucchini"},{"ingrs": ["zucchini","oil","salt","squash","pepper","eggplant"],"recipe": ["Slice the squash and slice into rounds, then brush with olive oil.","Season with salt and pepper.","Grill over high heat, turning once to char all sides.","Sprinkle with fresh grated cheese and serve."],"title": "Eggplant with zucchini (aubergine)"}]}';
  // // jsonRecipe eh onde precisa armazenar o retorno das receitas em formato de String
  Recipes recipesData() {
    String jsonData = jsonRecipe;
    var parsedJson = json.decode(jsonData);
    Recipes recipes = Recipes.fromJson(parsedJson);
    return recipes;
  }

  @override
  Widget build(BuildContext context) {
    return jsonRecipe != null
        ? Scaffold(
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
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                color: Colors.green,
                                child: Text(
                                  'Enviar',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ResultIA(
                                          widget.imageFile, recipesData())));
                                },
                              ),
                            )
                          : ButtonTheme(
                              minWidth: 150.0,
                              height: 50.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
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
                FloatingActionButtonLocation.centerDocked)
        : Scaffold(
            body: Center(
              child: Text('Loading...'),
            ),
          );
  }
}

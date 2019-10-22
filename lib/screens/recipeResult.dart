import 'package:SmartMeat/widgets/bottom_app_bar.dart';
import 'package:SmartMeat/widgets/float_button.dart';
import 'package:flutter/material.dart';

class RecipeResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String titulo = 'Salada com Queijo';
    return Scaffold(
        bottomNavigationBar: BottomApp(),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 7.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(children: <Widget>[
                  Center(
                    child: Text(
                      "Resultados",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Card(
                      child: Container(
                    width: 120,
                    height: 120,
                    // child: Image.file(
                    //   imageFile,
                    //   fit: BoxFit.cover,
                    // ),
                  )),
                  SizedBox(width: 50.0),
                  Text(
                    '$titulo',
                    style: TextStyle(fontSize: 15),
                  ),
                ]),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text("  Ingredientes:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                        textAlign: TextAlign.left),
                  ],
                ),
              ),
              SizedBox(height: 22.0),
              Container(
                child: Column(
                  children: <Widget>[
                    Text("  Modo de preparo:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                        textAlign: TextAlign.left),
                  ],
                ),
              ),
            ],
          ),
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

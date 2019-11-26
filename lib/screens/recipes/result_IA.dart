import 'dart:io';

import 'package:SmartMeat/screens/recipes/recipeResult.dart';
import 'package:SmartMeat/screens/recipes/recipes.dart';
import 'package:SmartMeat/widgets/bottom_app_bar.dart';
import 'package:SmartMeat/widgets/float_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ResultIA extends StatelessWidget {
  final File imageFile;
  final Recipes receita;
  ResultIA(this.imageFile, this.receita);

  @override
  Widget build(BuildContext context) {
    Recipes receita = this.receita;
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    Widget results(int contador) {
      return ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ButtonTheme(
            // minWidth: 300,
            // height: 10.0,
            child: RaisedButton(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Card(
                    child: Container(
                      width: _width * 0.25,
                      height: _height * 0.12,
                      child: Image.file(
                        imageFile,
                        fit: BoxFit.cover,
                    ),
                  )),
                  SizedBox(width: _width * 0.2, height: _height * 0.15),
                  // Flexible(child:
                  Container(
                    width: _width * 0.3,
                    height: _height * 0.1,
                    child: AutoSizeText(
                      // 'Receita $contador',
                      '${receita.recipes[contador - 1].title}',
                      style: TextStyle(fontSize: 20),
                      minFontSize: 16,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                  // )
                ],
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                    RecipeResult(imageFile, receita, contador - 1)));
              },
            ),
          ),
        ],
      );
    }

    Widget buildResults() {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: receita.recipes.length,
        itemBuilder: (BuildContext context, int index) {
          return results(index + 1);
        },
      );
    }

    return Scaffold(
        bottomNavigationBar: BottomApp(),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: _height * 0.0001),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Receitas Encontradas",
                  style: TextStyle(
                      // fontFamily: 'RobotoMono',
                      color: Colors.black87,
                      fontFamily: 'Pacifico',
                      // fontWeight: FontWeight.bold,
                      fontSize: 32
                      )
                    ),
              SizedBox(
                height: _height * 0.01,
              ),
              buildResults(),
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

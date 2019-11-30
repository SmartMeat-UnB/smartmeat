import 'dart:io';

import 'package:SmartMeat/screens/recipes/recipes.dart';
import 'package:SmartMeat/widgets/bottom_app_bar.dart';
import 'package:SmartMeat/widgets/float_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class RecipeResult extends StatelessWidget {
  final File imageFile;
  final Recipes receita;
  final int contador;
  RecipeResult(this.imageFile, this.receita, this.contador);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    String title = this.receita.recipes[contador].title;
    List<String> ingrs = this.receita.recipes[contador].ingrs;
    List<String> recipe = this.receita.recipes[contador].recipe;

    Widget buildIngrs() {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: ingrs.length,
        itemBuilder: (BuildContext context, int index) {
          String ingredientes = ingrs[index];
          return Text(" - $ingredientes" + ",",
              style: TextStyle(fontSize: 15), textAlign: TextAlign.left);
        },
      );
    }

    Widget buildRecipes() {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: recipe.length,
        itemBuilder: (BuildContext context, int index) {
          String recipes = recipe[index];
          return Text(" - $recipes",
              style: TextStyle(fontSize: 15), textAlign: TextAlign.justify);
        },
      );
    }

    return Scaffold(
        bottomNavigationBar: BottomApp(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 7.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(children: <Widget>[
                    Center(),
                    SizedBox(
                      height: _height * 0.01,
                    ),
                    Card(
                        child: Container(
                          height: 120,
                          width: 120,
                          child: Image.file(
                            imageFile,
                            fit: BoxFit.cover,
                          ),
                      )
                    ),
                  ]),
                ),
                SizedBox(height: _height * 0.02),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                  child: Column(
                    children: <Widget>[
                      Text("Ingredientes:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                          textAlign: TextAlign.left),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                  child: Column(
                    children: <Widget>[
                      buildIngrs(),
                    ],
                  ),
                ),
                SizedBox(height: _height * 0.02),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                  child: Column(
                    children: <Widget>[
                      AutoSizeText("Modo de preparo:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                          textAlign: TextAlign.left),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                  child: Column(
                    children: <Widget>[
                      buildRecipes(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: AutoSizeText(
            "$title",
            style: TextStyle(
              fontSize: 35.0,
              fontFamily: 'Pacifico',
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
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

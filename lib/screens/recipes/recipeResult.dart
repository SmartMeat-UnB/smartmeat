import 'dart:io';

import 'package:SmartMeat/screens/recipes/recipes.dart';
import 'package:SmartMeat/widgets/bottom_app_bar.dart';
import 'package:SmartMeat/widgets/float_button.dart';
import 'package:flutter/material.dart';

class RecipeResult extends StatelessWidget {
  final File imageFile;
  final Recipes receita;
  final int contador;
  RecipeResult(this.imageFile, this.receita, this.contador);
  @override
  Widget build(BuildContext context) {
    String title = this.receita.recipes[contador].title;
    List<String> ingrs = this.receita.recipes[contador].ingrs;
    final ingredientes = ingrs.reduce((value, element) => value + ',' + element);
    List<String> recipe = this.receita.recipes[contador].recipe;

    Widget buildIngrs() {
      return Text("$ingredientes", style: TextStyle(fontSize: 15));
    }

    Widget buildRecipes() {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: recipe.length,
        itemBuilder: (BuildContext context, int index) {
          String recipes = recipe[index];
          return Text("- $recipes", style: TextStyle(fontSize: 15));
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
                  Center(
                    // child: Text(
                    //   "Receita ${contador + 1}",
                    //   style:
                    //       TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    //   textAlign: TextAlign.center,
                    // ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Card(
                      child: Container(
                    width: 120,
                    height: 120,
                    child: Image.file(
                      imageFile,
                      fit: BoxFit.cover,
                    ),
                  )),
                  SizedBox(width: 50.0),
                  Text(
                    '$title',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              SizedBox(height: 18.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7.0),
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
                padding: EdgeInsets.symmetric(horizontal: 7.0),
                child: Column(
                  children: <Widget>[
                    buildIngrs(),
                  ],
                ),
              ),
              SizedBox(height: 22.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7.0),
                child: Column(
                  children: <Widget>[
                    Text("Modo de preparo:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                        textAlign: TextAlign.left),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7.0),
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
          title: Text("Receita ${contador + 1}",
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

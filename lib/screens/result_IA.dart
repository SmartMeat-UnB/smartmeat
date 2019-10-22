import 'dart:convert';
import 'dart:io';

import 'package:SmartMeat/screens/recipeResult.dart';
import 'package:SmartMeat/widgets/bottom_app_bar.dart';
import 'package:SmartMeat/widgets/float_button.dart';
import 'package:flutter/material.dart';

class Recipes {
  List<Recipe> recipes;

  Recipes({this.recipes});

  Recipes.fromJson(Map<String, dynamic> json) {
    if (json['recipes'] != null) {
      recipes = new List<Recipe>();
      json['recipes'].forEach((v) {
        recipes.add(new Recipe.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recipes != null) {
      data['recipes'] = this.recipes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recipe {
  List<String> ingrs;
  List<String> recipe;
  String title;

  Recipe({this.ingrs, this.recipe, this.title});

  Recipe.fromJson(Map<String, dynamic> json) {
    ingrs = json['ingrs'].cast<String>();
    recipe = json['recipe'].cast<String>();
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ingrs'] = this.ingrs;
    data['recipe'] = this.recipe;
    data['title'] = this.title;
    return data;
  }
}

class ResultIA extends StatelessWidget {
  final File imageFile;
  ResultIA(this.imageFile);

  @override
  Widget build(BuildContext context) {
    Recipes teste() {
      var jsonData =
          '{"recipes": [{"ingrs": ["zucchini","oil","salt","squash","pepper","eggplant"],"recipe": ["Preheat grill to medium-high.","Brush eggplant slices with oil and season with salt and pepper.","Grill, turning once, until tender and lightly charred, about 10 minutes.","Transfer to a platter and let cool.","Cut into 1/2-inch slices.","Serve with grilled zucchini."],"title": "Grilled eggplant and zucchini"},{"ingrs": ["zucchini","oil","salt","squash","pepper","eggplant"],"recipe": ["Slice the squash and slice into rounds, then brush with olive oil.","Season with salt and pepper.","Grill over high heat, turning once to char all sides.","Sprinkle with fresh grated cheese and serve."],"title": "Eggplant with zucchini (aubergine)"}]}';
      var parsedJson = json.decode(jsonData);
      var user = Recipes.fromJson(parsedJson);
      return user;
    }

    Recipes receita = teste();
    Widget results(int contador) {
      return ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ButtonTheme(
            minWidth: 300,
            height: 100.0,
            child: RaisedButton(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Card(
                      child: Container(
                    width: 80,
                    height: 80,
                    child: Image.file(
                      imageFile,
                      fit: BoxFit.cover,
                    ),
                  )),
                  SizedBox(width: 50.0),
                  Text(
                    'Receita $contador',
                    style: TextStyle(fontSize: 20),
                  ),
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
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Resultados",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              SizedBox(
                height: 20,
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

import 'dart:convert';
import 'dart:io';

import 'package:SmartMeat/widgets/bottom_app_bar.dart';
import 'package:SmartMeat/widgets/float_button.dart';
import 'package:flutter/material.dart';

class Receita {
  List<Recipes> recipes;

  Receita({this.recipes});

  Receita.fromJson(Map<String, dynamic> json) {
    if (json['recipes'] != null) {
      recipes = new List<Recipes>();
      json['recipes'].forEach((v) {
        recipes.add(new Recipes.fromJson(v));
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

class Recipes {
  List<String> ingrs;
  List<String> recipe;
  String title;

  Recipes({this.ingrs, this.recipe, this.title});

  Recipes.fromJson(Map<String, dynamic> json) {
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

class Blabla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void teste() {
      var jsonData =
          '{"recipes": [{"ingrs": ["zucchini","oil","salt","squash","pepper","eggplant"],"recipe": ["Preheat grill to medium-high.","Brush eggplant slices with oil and season with salt and pepper.","Grill, turning once, until tender and lightly charred, about 10 minutes.","Transfer to a platter and let cool.","Cut into 1/2-inch slices.","Serve with grilled zucchini."],"title": "Grilled eggplant and zucchini"},{"ingrs": ["zucchini","oil","salt","squash","pepper","eggplant"],"recipe": ["Slice the squash and slice into rounds, then brush with olive oil.","Season with salt and pepper.","Grill over high heat, turning once to char all sides.","Sprinkle with fresh grated cheese and serve."],"title": "Eggplant with zucchini (aubergine)"}]}';
      var parsedJson = json.decode(jsonData);
      var user = Receita.fromJson(parsedJson);
      print('${user.recipes[1].ingrs}');
    }

    Widget results() {
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
                  SizedBox(width: 50.0),
                  Text(
                    'Receita',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              onPressed: () {
                teste();
              },
            ),
          ),
        ],
      );
    }

    return Scaffold(
        bottomNavigationBar: BottomApp(),
        body: results(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        floatingActionButton: FloatButton(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}

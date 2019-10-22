import 'package:SmartMeat/screens/recipes/recipe.dart';

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

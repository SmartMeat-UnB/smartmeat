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

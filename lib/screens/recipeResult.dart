import 'package:SmartMeat/widgets/bottom_app_bar.dart';
import 'package:SmartMeat/widgets/float_button.dart';
import 'package:flutter/material.dart';

class RecipeResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Salada com Queijo';
    int receita = 1;
    List<String> ingrs = [
      "zucchini",
      "oil",
      "salt",
      "squash",
      "pepper",
      "eggplant"
    ];
    List<String> recipe = [
      "Preheat grill to medium-high.",
      "Brush eggplant slices with oil and season with salt and pepper.",
      "Grill, turning once, until tender and lightly charred, about 10 minutes.",
      "Transfer to a platter and let cool.",
      "Cut into 1/2-inch slices.",
      "Serve with grilled zucchini."
    ];

    Widget buildIngrs() {
      return Text("$ingrs", style: TextStyle(fontSize: 15));
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
                      "Receita $receita",
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
                    '$title',
                    style: TextStyle(fontSize: 15),
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

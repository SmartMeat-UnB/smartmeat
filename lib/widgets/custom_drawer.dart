import 'package:flutter/material.dart';
import 'package:smartmeat/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;
  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container();
    return Drawer(
      child: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(left: 0.0, top: 0.0),
            children: <Widget>[
              Container(
                color: Color.fromARGB(255, 169, 0, 52),
                padding: EdgeInsets.fromLTRB(23.0, 25.0, 16.0, 8.0),
                margin: EdgeInsets.only(bottom: 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        "Smart Meat \nMenu",
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Inicio", pageController, 0),
              SizedBox(height: 10.0),
              DrawerTile(Icons.wifi, "Conectar", pageController, 1),
              SizedBox(height: 10.0),
              DrawerTile(Icons.fastfood, "Receitas", pageController, 2),
            ],
          ),
        ],
      ),
    );
  }
}

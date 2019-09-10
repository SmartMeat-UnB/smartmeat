import 'package:flutter/material.dart';
import 'package:smartmeat/screens/receita.dart';
import 'package:smartmeat/tabs/home_tab.dart';
import 'package:smartmeat/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 169, 0, 52),
            title: Text("Smart Meat"),
            centerTitle: true,
          ),
          body: Receita(),
          drawer: CustomDrawer(_pageController),
        )
      ],
    );
  }
}

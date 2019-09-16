import 'package:flutter/material.dart';

class FloatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildButton() => FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 169, 0, 52),
          onPressed: () {
            ModalRoute.of(context).settings.name != ('/receita')
                ? Navigator.pushNamed(context, '/receita')
                : null;
          },
          child: Icon(
            Icons.camera,
            size: 40,
          ),
        );
    return _buildButton();
  }
}

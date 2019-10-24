import 'package:SmartMeat/screens/imagecell.dart';
import 'package:flutter/material.dart';

class FloatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildButton() => FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 169, 0, 52),
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new ImagesCell()));
          },
          child: Icon(
            Icons.camera,
            size: 40,
          ),
        );
    return _buildButton();
  }
}

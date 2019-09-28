import 'package:flutter/material.dart';

class  ImageBanner extends StatelessWidget {
  final String _assetPath;

  ImageBanner(this._assetPath);

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(color: Colors.white),
      margin: EdgeInsets.only(left: 80.0, right: 80.0),
      child: Image.asset(
        _assetPath,
      fit: BoxFit.cover
      ),
      );


  }
}
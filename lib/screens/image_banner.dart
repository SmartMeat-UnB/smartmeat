import 'package:flutter/material.dart';

class  ImageBanner extends StatelessWidget {
  final String _assetPath;

  ImageBanner(this._assetPath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
    decoration: BoxDecoration(color: Colors.white),
      child: Image.asset(
        _assetPath,
      fit: BoxFit.cover),
      );


  }
}
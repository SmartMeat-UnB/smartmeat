import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Informations extends StatefulWidget {
  @override
  _InformationsState createState() => _InformationsState();
}

class _InformationsState extends State<Informations> {
  final String url = "http://10.0.2.2:5000/get_info";
  List data;

  Future<String> getInformation() async {
    http.Response response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "applications/json"});

    print(response.body);
    // setState((){
    //   var data = json.decode(response.body);
    //   print(data[1]["on"]);
    // });

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new RaisedButton(
          child: new Text("Get data"),
          onPressed: getInformation,
        ),
      ),
    );
  }
}

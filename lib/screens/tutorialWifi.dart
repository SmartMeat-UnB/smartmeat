import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_setting/system_setting.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:async';
import 'dart:typed_data';
import 'package:qrscan/qrscan.dart' as scanner;

class TutorialWifi extends StatefulWidget {
  @override
  _TutorialWifiState createState() => _TutorialWifiState();
}

class _TutorialWifiState extends State<TutorialWifi> {
  _jumpToSettingWifi() {
    SystemSetting.goto(SettingTarget.WIFI);
  }

  // If you want use bluetooth
  // _jumpToSettingBT() {
  //   SystemSetting.goto(SettingTarget.BLUETOOTH);
  // }

  // String get barcode => _barcode;
  String barcode = '';
  Future scan() async {
    String barcode = await scanner.scan();
    setState(() {
      this.barcode = barcode;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('uri', barcode);
    Navigator.pushNamed(context, '/home');
  }

  //If you want read a photo in gallery
  // Future _scanPhoto() async {
  //   String barcode = await scanner.scanPhoto();
  //   setState(() => this.barcode = barcode);
  // }

  Uint8List bytes = Uint8List(200);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(8.0),
          width: _width,
          height: _height,
          child: SafeArea(
              child: Center(
                  child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: _height * 0.04),
              Expanded(
                child: Image.asset(
                  "images/smartphone.png",
                  fit: BoxFit.cover,
                  height: 190.0,
                  alignment: Alignment.topCenter,
                ),
              ),
              SizedBox(height: _height * 0.03),
              AutoSizeText(
                "Para se conectar leia o QR CODE",
                presetFontSizes: [40.0, 20.0, 14.0],
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _height * 0.10),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ButtonTheme(
                      child: RaisedButton(
                        onPressed: scan,
                        child: Text(
                          'LER QR CODE',
                          style: TextStyle(
                            fontSize: 35.0,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.green,
                      ),
                    ),

                    SizedBox(height: _height * 0.04),
                    // AutoSizeText(
                    //   "Agora escolha o wifi em que a churrasqueira está conectada!",
                    //   presetFontSizes: [25.0, 20.0, 14.0],
                    //   maxLines: 5,
                    //   overflow: TextOverflow.ellipsis,
                    //   textAlign: TextAlign.center,
                    // ),
                    SizedBox(height: _height * 0.04),
                    // RaisedButton(
                    //   onPressed: _jumpToSettingWifi,
                    //   textColor: Colors.white,
                    //   color: Colors.blue,
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Text(
                    //     "Wifi",
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 28.0,
                    //       fontFamily: 'Roboto',
                    //     ),
                    //   ),
                    // ),
                  ]),
              SizedBox(height: _height * 0.05),
              Container(
                alignment: Alignment(0.0, 0.9),
                padding: EdgeInsets.all(20.0),
                child: ButtonTheme(
                    minWidth: 100.0,
                    height: 60.0,
                    child: RaisedButton(
                      child: Text(
                        'PULAR',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                    )),
              ),
            ],
          )))),
    );
  }
}

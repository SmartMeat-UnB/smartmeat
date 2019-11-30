import 'package:flutter/material.dart';
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

  _jumpToSettingBT() {
    SystemSetting.goto(SettingTarget.BLUETOOTH);
  }

  String barcode = '';
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
                "Faça a conexão do seu celular\n na mesma rede Wifi que esta a \nchurrasqueira ou conecte ao Bluetooth da SmartMeat.",
                presetFontSizes: [40.0, 20.0, 14.0],
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _height * 0.07),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: _jumpToSettingWifi,
                      textColor: Colors.white,
                      color: Colors.blue,
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Wifi",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    RaisedButton(
                      padding: const EdgeInsets.all(8.0),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: _jumpToSettingBT,
                      child: Text(
                        "Bluetooth",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
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
                        'PRONTO',
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                    )),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.memory(bytes),
                    ),
                    Text('RESULT  $barcode'),
                    RaisedButton(onPressed: _scan, child: Text("Scan")),
                    RaisedButton(
                        onPressed: _scanPhoto, child: Text("Scan Photo")),
                    RaisedButton(
                        onPressed: _generateBarCode,
                        child: Text("Generate Barcode")),
                  ],
                ),
              ),
            ],
          )))),
    );
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    setState(() => this.barcode = barcode);
  }

  Future _scanPhoto() async {
    String barcode = await scanner.scanPhoto();
    setState(() => this.barcode = barcode);
  }

  Future _generateBarCode() async {
    Uint8List result = await scanner
        .generateBarCode('https://github.com/leyan95/qrcode_scanner');
    this.setState(() => this.bytes = result);
  }
}

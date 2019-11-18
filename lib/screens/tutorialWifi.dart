import 'package:flutter/material.dart';
import 'package:system_setting/system_setting.dart';
import 'package:SmartMeat/screens/informationsRasp.dart';
import 'package:auto_size_text/auto_size_text.dart';

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

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height= MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        width: _width,
        height: _height,
        child: SafeArea(
          child:Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: _height*0.04),
                Expanded(
                  child: Image.asset(
                              "images/smartphone.png",
                              fit: BoxFit.cover,
                              height: 190.0,
                              alignment: Alignment.topCenter,
                            ),
                ),
                SizedBox(height: _height*0.03),
                AutoSizeText(
                  "Faça a conexão do seu celular\n na mesma rede Wifi que esta a \nchurrasqueira ou conecte ao Bluetooth da SmartMeat.",
                  presetFontSizes: [40.0, 20.0, 14.0],
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: _height*0.07),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RawMaterialButton(
                    fillColor: Colors.blueAccent,
                    splashColor: Colors.greenAccent,                    
                    child: Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.wifi,
                            color: Colors.black,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10.0,                            
                          ),
                          Text(
                            "Wi-Fi",
                            maxLines: 1,
                            style: TextStyle(color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22.0,
                                              fontFamily: 'Roboto',),
                                   
                          ),
                        ],
                      ),
                    ),
                    onPressed: _jumpToSettingWifi,
                    shape: const StadiumBorder(),
                  ),
                  RawMaterialButton(
                    fillColor: Colors.blueAccent,
                    splashColor: Colors.greenAccent,
                    child: Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.bluetooth,
                            color: Colors.black,
                            size: 25,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "Bluetooth",
                            maxLines: 1,
                            style: TextStyle(color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22.0,
                                              fontFamily: 'Roboto',),
                                   
                          ),
                        ],
                      ),
                    ),
                    onPressed: _jumpToSettingWifi,
                    shape: const StadiumBorder(),
                  ),
                    // RaisedButton(
                    //   onPressed: _jumpToSettingWifi,
                    //   textColor: Colors.white,
                    //   color: Colors.blue,
                    //   padding: const EdgeInsets.all(8.0),
                    //   child:  Text(
                    //                 "Wifi",
                    //                 style: TextStyle(
                    //                           fontWeight: FontWeight.bold,
                    //                           fontSize: 28.0,
                    //                           fontFamily: 'Roboto',
                    //                       ),
                    //               ),
                    // ),
                    // RaisedButton(
                    //   padding: const EdgeInsets.all(8.0),
                    //   textColor: Colors.white,
                    //   color: Colors.blue,
                    //   onPressed: _jumpToSettingBT,
                    //   child:  Text(
                    //               "Bluetooth",
                    //               style: TextStyle(
                    //                       fontWeight: FontWeight.bold,
                    //                       fontSize: 28.0,
                    //                       fontFamily: 'Roboto',
                    //                     ),
                    //           ),
                    // ),
                  ]
                ),
                SizedBox(height: _height*0.05),
                Container(
                  alignment: Alignment(0.0,0.9),
                  padding: EdgeInsets.all(20.0),
                  child: 
                    ButtonTheme(
                      minWidth: 100.0,
                      height: 60.0,                  
                        child:RaisedButton(
                          child: Text('PRONTO',
                                      style: TextStyle(
                                                fontSize: 40.0,
                                                color: Colors.white,
                                              ),
                                    ),
                          color: Colors.green,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => InformationRasp()));
                          },
                      )
                    ),
                ),
                  ],           
                )
            )
          )
        ),
    );
  }
}

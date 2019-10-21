import 'package:flutter/material.dart';
import 'package:system_setting/system_setting.dart';
import 'package:SmartMeat/screens/informationsRasp.dart';

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
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       icon: Icon(
      //         Icons.arrow_back,
      //         color: Colors.black,
      //       ),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //     ),
      //   backgroundColor: Colors.white,
      // ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
                  height: 100,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                          "images/smartphone.png",
                          fit: BoxFit.cover,
                          height: 190.0,
                        )
                
              ],            
            ),
            SizedBox(
                  height: 20,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Faça a conexão do seu celular\n a mesma rede Wifi que esta a \nchurrasqueira ou ao Bluetooth.",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300 ),
                textAlign: TextAlign.center,)
                 
              ],

            ),
             SizedBox(
                  height: 90,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // SizedBox(
                //   height: 25,
                // ),
                RaisedButton(
                  onPressed: _jumpToSettingWifi,
                  textColor: Colors.white,
                  color: Colors.blue,
                  padding: const EdgeInsets.all(8.0),
                  child:  Text(
                                "Wifi",
                                style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 35.0,
                                          fontFamily: 'Roboto',
                                      ),
                              ),
                ),
                RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: _jumpToSettingBT,
                  child:  Text(
                              "Bluetooth",
                              style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35.0,
                                      fontFamily: 'Roboto',
                                    ),
                          ),
                ),
              ]
            ),
            SizedBox(
              height: 185,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
              ],
            ),
              ],           
            )
        ),
    );
  }
}

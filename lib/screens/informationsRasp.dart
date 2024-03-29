import 'dart:convert';
import 'dart:async';
import 'dart:ui';

import 'package:SmartMeat/screens/churrasqueira.dart';
import 'package:SmartMeat/screens/smartMeat/generalSmartMeat.dart';
import 'package:SmartMeat/widgets/bottom_app_bar.dart';
import 'package:SmartMeat/widgets/float_button.dart';
import 'package:flutter/material.dart';
import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

class InformationRasp extends StatefulWidget {
  @override
  _InformationRaspState createState() => _InformationRaspState();
}

class _InformationRaspState extends State<InformationRasp> {
  GeneralSmartMeat smartMeat;
  bool notificationState;
  String uri;
  // String uri = "http://192.168.25.114:8080/";
  // String uri = "http://10.0.2.2:8080/";

  List<String> toPrint = ["trying to connect"];
  SocketIOManager manager;
  Map<String, SocketIO> sockets = {};
  Map<String, bool> _isProbablyConnected = {"default": false};
  // List<bool> isSelected;
  int _level = 0;
  int tempo = 360;

  //Vai ser setado de acordo com o valor que vai chegar da churrasqueira
  //para saber se está ou não ligada, uma variavel para o estado da churrasqueira
  bool _state = false;

  String _jsonData =
      '{"smartmeat": { "on": false,"stick1": {"active": false,"time_active": "00:00"},"stick2": {"active": false,"time_active": "00:00"},"stick3": {"active": false,"time_active": "00:00"},"stick4": {"active": false,"time_active": "00:00"},"temperature": 3}}';

  void smartMeatData(jsonData) {
    setState(() {
      _jsonData = jsonData.toString();
    });
    var parsedJson = json.decode(_jsonData);
    smartMeat = GeneralSmartMeat.fromJson(parsedJson);
    print("Incoming data $_jsonData");
  }

  void toggleState(String identifier, bool value) {
    setState(() {
      this._state = value;
      sendMessage(identifier);
    });
  }

  @override
  void initState() {
    super.initState();
    getTempo();
    manager = SocketIOManager();
    initSocket("default");
    smartMeatData(_jsonData);
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> getTempo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tempo = (prefs.getInt('tempo') ?? 720);
  }

  initSocket(String identifier) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      uri = (prefs.getString('uri'));
      if (uri == null) {
        uri = "http://10.0.2.2:8080/";
      }
      print(uri);
    });

    setState(() => _isProbablyConnected[identifier] = false);
    SocketIO socket = await manager.createInstance(SocketOptions(uri,
        //Enable or disable platform channel logging
        enableLogging: false,
        transports: [
          Transports.WEB_SOCKET /*, Transports.POLLING*/
        ] //Enable required transport
        ));
    socket.onConnect((data) {
      setState(() => _isProbablyConnected[identifier] = true);
      pprint(data);
      // sendMessage("default");
    });
    socket.onConnectError((data) {
      setState(() => _isProbablyConnected[identifier] = false);
      pprint(data);
    });
    socket.onError((data) {
      setState(() => _isProbablyConnected[identifier] = false);
      pprint(data);
    });
    socket.onConnectTimeout((data) {
      setState(() => _isProbablyConnected[identifier] = false);
      pprint(data);
    });
    // socket.onDisconnect((data) {
    //   setState(() => _isProbablyConnected[identifier] = false);
    //   disconnect(identifier);
    //   pprint(data);
    // });

    socket.on("message", (data) => smartMeatData(data));
    socket.connect();
    sockets[identifier] = socket;
  }

  bool isProbablyConnected(String identifier) {
    return _isProbablyConnected[identifier];
  }

  disconnect(String identifier) async {
    await manager.clearInstance(sockets[identifier]);
    setState(() => _isProbablyConnected[identifier] = false);
  }

  sendMessage(identifier) {
    if (sockets[identifier] != null) {
      sockets[identifier].emit("message", [
        {
          "smartmeat": {
            "on": _state,
            "temperature": _level,
            "stick1": {
              "active": smartMeat.smartmeat.stick1.active,
              "time_active": smartMeat.smartmeat.stick1.timeActive
            },
            "stick2": {
              "active": smartMeat.smartmeat.stick2.active,
              "time_active": smartMeat.smartmeat.stick2.timeActive
            },
            "stick3": {
              "active": smartMeat.smartmeat.stick3.active,
              "time_active": smartMeat.smartmeat.stick3.timeActive
            },
            "stick4": {
              "active": smartMeat.smartmeat.stick4.active,
              "time_active": smartMeat.smartmeat.stick4.timeActive
            }
          }
        }
      ]);
      pprint("Message emitted from '$identifier'...");
    }
  }

  pprint(data) {
    setState(() {
      if (data is Map) {
        data = json.encode(data);
      }
      print(data);
      toPrint.add(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(
                Icons.refresh,
                size: 32,
                color: Colors.white,
              ),
              onPressed: () {
                initSocket("default");
              },
            ),
            isProbablyConnected("default")
                ? Icon(
                    Icons.wifi,
                    size: 32,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.signal_wifi_off,
                    size: 32,
                    color: Colors.white,
                  ),
          ],
          leading: Switch(
              activeColor: Colors.green,
              value: smartMeat.smartmeat.on,
              onChanged: (bool value) {
                // onChanged("default", value);
                toggleState("default", value);
              }),
          title: const Text('Smart Meat',
              style: TextStyle(
                  fontSize: 35.0, color: Colors.white, fontFamily: 'Pacifico'),
              textAlign: TextAlign.center,
              strutStyle: StrutStyle(height: 2.5, forceStrutHeight: true)),
          centerTitle: true,
          backgroundColor: Colors.red[900],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                width: _width,
                height: _height * 0.45,
                child: Churrasqueira(
                    smartMeat, tempo, flutterLocalNotificationsPlugin),
              ),
              Text(
                'Temperatura',
                style: TextStyle(
                  fontSize: 35.0,
                ),
              ),
              FlutterSlider(
                trackBar: FlutterSliderTrackBar(
                  activeTrackBarHeight: 18,
                  inactiveTrackBarHeight: 14,
                  inactiveTrackBar: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12,
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  activeTrackBar: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.redAccent),
                ),
                values: [0],
                max: 5,
                min: 0,
                selectByTap: true, // default is true
                jump: true,
                touchSize: 25,
                // visibleTouchArea: true,
                fixedValues: [
                  FlutterSliderFixedValue(percent: 0, value: "0"),
                  FlutterSliderFixedValue(percent: 25, value: "1"),
                  FlutterSliderFixedValue(percent: 50, value: "2"),
                  FlutterSliderFixedValue(percent: 75, value: "3"),
                  FlutterSliderFixedValue(percent: 100, value: "4"),
                ],
                // TODO make hatchmark appear
                hatchMark: FlutterSliderHatchMark(
                  distanceFromTrackBar: 5,
                  density: 0.5, // means 50 lines, from 0 to 100 percent
                  labels: [
                    FlutterSliderHatchMarkLabel(percent: 0, label: "Level 1"),
                    FlutterSliderHatchMarkLabel(percent: 25, label: "Level 2"),
                    FlutterSliderHatchMarkLabel(percent: 50, label: "Level 3"),
                    FlutterSliderHatchMarkLabel(percent: 75, label: "Level 4"),
                    FlutterSliderHatchMarkLabel(percent: 100, label: "Level 5"),
                  ],
                ),
                handlerAnimation: FlutterSliderHandlerAnimation(
                    curve: Curves.elasticOut,
                    reverseCurve: Curves.bounceIn,
                    duration: Duration(milliseconds: 500),
                    scale: 1.5),
                tooltip: FlutterSliderTooltip(
                    textStyle: TextStyle(fontSize: 20, color: Colors.white),
                    boxStyle: FlutterSliderTooltipBox(
                        decoration: BoxDecoration(
                            color: Colors.redAccent.withOpacity(0.5)))),
                onDragCompleted: (handlerIndex, lowerValue, upperValue) {
                  _level = int.parse(lowerValue);
                  sendMessage("default");
                  setState(() {
                    smartMeat.smartmeat.temperature = _level;
                  });
                },
              ),
              Text(
                "Level " + _level.toString(),
                // "Level " + smartMeat.smartmeat.temperature.toString(),
                style: TextStyle(
                  fontSize: 35.0,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomApp(),
        floatingActionButton: FloatButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
        // ),
        );
  }
}

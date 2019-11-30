import 'package:SmartMeat/screens/churrasqueira.dart';
import 'package:SmartMeat/screens/smartMeat/generalSmartMeat.dart';
import 'package:SmartMeat/widgets/bottom_app_bar.dart';
import 'package:SmartMeat/widgets/float_button.dart';
import 'package:flutter/material.dart';
import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
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
  //my ip inet = 192.168.15.?
  GeneralSmartMeat smartMeat;
  bool notificationState;
  // String uri = "http://192.168.15.2:8080/";
  // String uri = "http://192.168.15.2:8080/";
  // Emulator URI
  String uri = "http://10.0.2.2:8080/";

  List<String> toPrint = ["trying to connect"];
  SocketIOManager manager;
  Map<String, SocketIO> sockets = {};
  Map<String, bool> _isProbablyConnected = {};
  // List<bool> isSelected;
  int _level = 0;

  //Vai ser setado de acordo com o valor que vai chegar da churrasqueira
  //para saber se está ou não ligada, uma variavel para o estado da churrasqueira
  bool _state = false;

  String _jsonData =
      '{"smartmeat": { "on": false,"stick1": {"active": true,"time_active": "12:45"},"stick2": {"active": false,"time_active": "10:08"},"stick3": {"active": false,"time_active": "00:00"},"stick4": {"active": false,"time_active": "00:00"},"temperature": 3}}';

  void smartMeatData(jsonData) {
    print("Incoming data $_jsonData");
    setState(() {
      _jsonData = jsonData.toString();
    });
    var parsedJson = json.decode(_jsonData);
    smartMeat = GeneralSmartMeat.fromJson(parsedJson);
    scheduleNotification(smartMeat.smartmeat.stick1.active, 1);
    scheduleNotification(smartMeat.smartmeat.stick2.active, 2);
    scheduleNotification(smartMeat.smartmeat.stick3.active, 3);
    scheduleNotification(smartMeat.smartmeat.stick4.active, 4);
  }

  void onChanged(String identifier, bool value) {
    bool ipc = isProbablyConnected(identifier);
    setState(() {
      if (ipc != null) {
        this._state = value;
        sendMessage(identifier);
      }
    });
  }

  @override
  void initState() {
    super.initState();
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

  Future<void> scheduleNotification(bool stickState, int stick) async {
    int tempo;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tempo = (prefs.getInt('tempo'));
    notificationState = (prefs.getBool('notificacao'));

    if (notificationState == true && stickState == true) {
      if (tempo == 0) {
        prefs.setInt('tempo', 180);
        tempo = 180;
      }
      var scheduledNotificationDateTime =
          DateTime.now().add(Duration(seconds: tempo));
      var vibrationPattern = Int64List(4);
      vibrationPattern[0] = 0;
      vibrationPattern[1] = 1000;
      vibrationPattern[2] = 5000;
      vibrationPattern[3] = 2000;

      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          'your channel id', 'your channel name', 'your channel description',
          largeIconBitmapSource: BitmapSource.Drawable,
          vibrationPattern: vibrationPattern,
          enableLights: true,
          color: const Color.fromARGB(255, 255, 0, 0),
          ledColor: const Color.fromARGB(255, 255, 0, 0),
          ledOnMs: 1000,
          ledOffMs: 500);
      var iOSPlatformChannelSpecifics =
          IOSNotificationDetails(sound: "slow_spring_board.aiff");
      var platformChannelSpecifics = NotificationDetails(
          androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.schedule(
          stick,
          'Seu churrasco te espera!',
          'o seu espetinho ' + stick.toString() + ' ja esta pronto!',
          scheduledNotificationDateTime,
          platformChannelSpecifics);
    }
    if (stickState == false) {
      await flutterLocalNotificationsPlugin.cancel(stick);
    }
  }

  initSocket(String identifier) async {
    setState(() => _isProbablyConnected[identifier] = true);
    SocketIO socket = await manager.createInstance(SocketOptions(
        //Socket IO server URI
        uri,
        nameSpace: (identifier == "namespaced") ? "/adhara" : "/",
        //Query params - can be used for authentication
        query: {
          "auth": "--SOME AUTH STRING---",
          "info": "new connection from adhara-socketio",
          "timestamp": DateTime.now().toString()
        },
        //Enable or disable platform channel logging
        enableLogging: false,
        transports: [
          Transports.WEB_SOCKET /*, Transports.POLLING*/
        ] //Enable required transport
        ));
    socket.onConnect((data) {
      pprint("Connected...");
      pprint(data);
      // sendMessage("default");
    });
    socket.onConnectError(pprint);
    socket.onConnectTimeout(pprint);
    socket.onError(pprint);
    socket.onDisconnect(pprint);
    socket.on("type:string", (data) => pprint("type:string | $data"));
    socket.on("type:bool", (data) => pprint("type:bool | $data"));
    socket.on("type:number", (data) => pprint("type:number | $data"));
    socket.on("type:object", (data) => pprint("type:object | $data"));
    socket.on("type:list", (data) => pprint("type:list | $data"));
    // socket.on("message", (data) => pprint("MESSAGE RECEIVED $data"));
    socket.on("message", (data) => smartMeatData(data));
    socket.connect();
    sockets[identifier] = socket;
  }

  bool isProbablyConnected(String identifier) {
    return _isProbablyConnected[identifier] ?? false;
  }

  disconnect(String identifier) async {
    await manager.clearInstance(sockets[identifier]);
    setState(() => _isProbablyConnected[identifier] = false);
  }

  sendMessage(identifier) {
    if (sockets[identifier] != null) {
      pprint("sending message from '$identifier'...");
      sockets[identifier].emit("message", [
        {
          "smartmeat": {
            "on": _state,
            "temperature": _level,
            "stick1": {"active": false, "time_active": "00:00"},
            "stick2": {"active": false, "time_active": "00:00"},
            "stick3": {"active": false, "time_active": "00:00"},
            "stick4": {"active": false, "time_active": "00:00"}
          }
        }
      ]);
      pprint("Message emitted from '$identifier'...");
    }
  }

  sendMessageWithACK(identifier) {
    pprint("Sending ACK message from '$identifier'...");
    List msg = [
      "Hello world!",
      1,
      true,
      {"p": 1},
      [3, 'r']
    ];
    sockets[identifier].emitWithAck("ack-message", msg).then((data) {
      // this callback runs when this specific message is acknowledged by the server
      pprint("ACK recieved from '$identifier' for $msg: $data");
    });
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
    return Scaffold(
        appBar: AppBar(
          leading: Switch(
              activeColor: Colors.green,
              value: smartMeat.smartmeat.on,
              onChanged: (bool value) {
                onChanged("default", value);
              }),
          title: const Text('Smart Meat',
              style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.black87,
                  fontFamily: 'Pacifico'),
              textAlign: TextAlign.center,
              strutStyle: StrutStyle(height: 2.5, forceStrutHeight: true)),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                width: 500.0,
                height: 300.0,
                child: Churrasqueira(smartMeat),
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
                  setState(() {});
                },
              ),
              Text(
                "Level " + _level.toString(),
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

import 'package:SmartMeat/screens/churrasqueira.dart';
import 'package:SmartMeat/screens/smartMeat/generalSmartMeat.dart';
import 'package:SmartMeat/widgets/bottom_app_bar.dart';
import 'package:SmartMeat/widgets/float_button.dart';
import 'package:flutter/material.dart';
import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'dart:convert';

import 'package:flutter_xlider/flutter_xlider.dart';

class InformationRasp extends StatefulWidget {
  @override
  _InformationRaspState createState() => _InformationRaspState();
}

class _InformationRaspState extends State<InformationRasp> {
  //my ip inet = 192.168.15.?
  GeneralSmartMeat smartMeat;
  // String uri = "http://192.168.15.2:8080/";
  // String uri = "http://192.168.15.2:8080/";
  // Emulator URI
  String uri = "http://10.0.2.2:8080/";

  List<String> toPrint = ["trying to connect"];
  SocketIOManager manager;
  Map<String, SocketIO> sockets = {};
  Map<String, bool> _isProbablyConnected = {};
  // List<bool> isSelected;
  String _lowerValue;
  double _upperValue = 180;

  //Vai ser setado de acordo com o valor que vai chegar da churrasqueira
  //para saber se está ou não ligada, uma variavel para o estado da churrasqueira
  bool _state = false;
  int _temperature = 25;

  String jsonSmartMeat =
      '{"smartmeat": { "on": true,"stick1": {"active": true,"time_active": "12:45"},"stick2": {"active": true,"time_active": "10:08"},"stick3": {"active": false,"time_active": "00:00"},"stick4": {"active": false,"time_active": "00:00"},"temperature": 175}}';
  void smartMeatData() {
    String jsonData = jsonSmartMeat;
    var parsedJson = json.decode(jsonData);
    smartMeat = GeneralSmartMeat.fromJson(parsedJson);
  }

  void onChanged(String identifier, bool value) {
    bool ipc = isProbablyConnected(identifier);
    setState(() {
      if (ipc != null) {
        sendMessage(identifier);
        _state = value;
      }
    });
  }

  void subtractNumbers() {
    if (_temperature >= 25) {
      setState(() {
        _temperature = _temperature - 2;
        sendMessage("default");
      });
    }
  }

  void addNumbers() {
    if (_temperature <= 80) {
      setState(() {
        _temperature = _temperature + 2;
        sendMessage("default");
        initState();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    manager = SocketIOManager();
    initSocket("default");
    smartMeatData();
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
    socket.on("message", (data) => pprint("MESSAGE RECEIVED $data"));
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
            "temperature": _temperature,
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
                  activeTrackBarHeight: 30,
                  inactiveTrackBarHeight: 30,
                  inactiveTrackBar: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12,
                    border: Border.all(width: 3, color: Colors.yellow),
                  ),
                  activeTrackBar: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red),
                ),
                values: [10, 50],
                fixedValues: [
                  FlutterSliderFixedValue(percent: 0, value: "0"),
                  FlutterSliderFixedValue(percent: 25, value: "25 C°"),
                  FlutterSliderFixedValue(percent: 50, value: "50 C°"),
                  FlutterSliderFixedValue(percent: 75, value: "75 C°"),
                  FlutterSliderFixedValue(percent: 100, value: "100 C°"),
                ],
                handlerAnimation: FlutterSliderHandlerAnimation(
                    curve: Curves.elasticOut,
                    reverseCurve: Curves.bounceIn,
                    duration: Duration(milliseconds: 500),
                    scale: 1.5),
                tooltip: FlutterSliderTooltip(
                    textStyle: TextStyle(fontSize: 17, color: Colors.white),
                    boxStyle: FlutterSliderTooltipBox(
                        decoration: BoxDecoration(
                            color: Colors.redAccent.withOpacity(0.7)))),
                onDragging: (handlerIndex, lowerValue, upperValue) {
                  _lowerValue = lowerValue;
                  print(_lowerValue);
                  setState(() {});
                },
                // hatchMark: FlutterSliderHatchMark(
                //   distanceFromTrackBar: 10,
                //   density: 0.5, // means 50 lines, from 0 to 100 percent
                //   labels: [
                //     FlutterSliderHatchMarkLabel(percent: 0, label: 'Start'),
                //     FlutterSliderHatchMarkLabel(percent: 10, label: '10,000'),
                //     FlutterSliderHatchMarkLabel(percent: 50, label: '50 %'),
                //     FlutterSliderHatchMarkLabel(percent: 80, label: '80,000'),
                //     FlutterSliderHatchMarkLabel(percent: 100, label: 'Finish'),
                //   ],
                // ),
                max: 50,
                min: 0,
              )
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

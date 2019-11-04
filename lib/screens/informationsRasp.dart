import 'package:SmartMeat/screens/churrasqueira.dart';
import 'package:SmartMeat/screens/smartMeat/generalSmartMeat.dart';
import 'package:SmartMeat/widgets/bottom_app_bar.dart';
import 'package:SmartMeat/widgets/float_button.dart';
import 'package:flutter/material.dart';
import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'dart:convert';

class InformationRasp extends StatefulWidget {
  @override
  _InformationRaspState createState() => _InformationRaspState();
}

String jsonSmartMeat = 'vazio';

class _InformationRaspState extends State<InformationRasp> {
  //my ip inet = 192.168.15.?
  String uri = "http://192.168.15.2:7000/";
  List<String> toPrint = ["trying to connect"];
  SocketIOManager manager;
  Map<String, SocketIO> sockets = {};
  Map<String, bool> _isProbablyConnected = {};
  // List<bool> isSelected;

  //Vai ser setado de acordo com o valor que vai chegar da churrasqueira
  //para saber se está ou não ligada, uma variavel para o estado da churrasqueira
  bool _state = false;
  int _temperature = 25;

  GeneralSmartMeat smartMeatData() {
    String jsonData = jsonSmartMeat;
    var parsedJson = json.decode(jsonData);
    GeneralSmartMeat smartMeat = GeneralSmartMeat.fromJson(parsedJson);
    return smartMeat;
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
      });
    }
  }

  @override
  void initState() {
    super.initState();
    manager = SocketIOManager();
    initSocket("default");
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
      pprint("connected...");
      pprint(data);
      // sendMessage(identifier);
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
    socket.on("message", (data) => pprint(data));
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
              value: _state,
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
                child: Churrasqueira(),
              ),
              Text(
                'Temperatura',
                style: TextStyle(
                  fontSize: 35.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: subtractNumbers,
                    textColor: Colors.white,
                    color: Colors.red,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "-",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  Text(
                    '$_temperature°',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60.0,
                      fontFamily: 'Roboto',
                      color: Colors.black87,
                      backgroundColor: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: addNumbers,
                    child: Text(
                      "+",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ],
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

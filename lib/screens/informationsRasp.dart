import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:udp/udp.dart';


class InformationRasp extends StatefulWidget {
  @override
  _InformationRaspState createState() => _InformationRaspState();
}

class _InformationRaspState extends State<InformationRasp> {
  String message;
  // var str;
  
  informations() async {
      RawDatagramSocket socket;
        socket = await RawDatagramSocket.bind("0.0.0.0", 58332);
        await for (RawSocketEvent ev in socket.asBroadcastStream()) {          
          if (ev == RawSocketEvent.read) {
            try {
              Datagram dg = socket.receive();
              if (dg != null) {
                print("${dg.address} ${dg.port} ${dg.data}");
                socket.send(dg.data, dg.address, dg.port);
              }
            } catch (e) {
              print("#########$e");
            }
          }
        }

  //   var reciever = await UDP.bind(Endpoint.loopback(port: Port(58332)));
  //   print("$reciever.listen");

  //   await reciever.listen((datagram){
  //     str = String.fromCharCodes(datagram.data);
  //     // stdout.write(str);
  //     print("ola");
  //   }, Duration(seconds: 20));
    
    // RawDatagramSocket socket;
    // startServer(String host, int port) async {
    //   socket = await RawDatagramSocket.bind(host, port);
    //   await for (RawDatagramSocket ev in socket.asBroadcastStream()){
    //     if (ev == RawDatagramSocket.READ){
    //       try {
    //         Datagram dg = socket.receive();
    //         if(dg != null) {
    //           print("${dg.address} ${dg.port} $dg.data");
    //           socket.send(dg.data, dg.address, dg.port);
    //         }
    //       } catch (e){
    //         print("#####$e");
    //       }
    //     }
    //   }
    // }
    // RawDatagramSocket.bind(InternetAddress.anyIPv4, 58332).then((RawDatagramSocket socket){
    //   print('Datagram socket ready to receive');
    //   print('${socket.address.address}:${socket.port}');
    //   socket.listen((RawSocketEvent e){
    //     Datagram d = socket.receive();
    //     print("${d.data}");

    //     //if (d == null) return;
    //     setState(() {
    //         message = new String.fromCharCodes(d.data).trim();
    //     });

    //     print('Datagram from ${d.address.address}:${d.port}: $message');
    //     });
    //   });  
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("$message")]
                  ),
                ButtonBar(
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ButtonTheme(
                          minWidth: 300.0,
                          height: 100.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: Colors.white,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.camera_alt,
                                  size: 35,
                                ),
                                SizedBox(width: 40.0),
                                Text(
                                  'Testar Socket',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 25),
                                ),
                              ],
                            ),
                            onPressed: () {
                              informations();
                            },
                          ),
                        ),
                      ],
                    ),  
                ],
              ),
            
            ),   
    );
  }
}


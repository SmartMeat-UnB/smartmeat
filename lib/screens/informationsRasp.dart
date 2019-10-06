import 'dart:io';
import 'package:flutter/material.dart';


class informationRasp extends StatefulWidget {
  @override
  _informationRaspState createState() => _informationRaspState();
}

class _informationRaspState extends State<informationRasp> {
  String message;

  void informations(){
  RawDatagramSocket.bind(InternetAddress.ANY_IP_V4, 58332).then((RawDatagramSocket socket){
    print('Datagram socket ready to receive');
    print('${socket.address.address}:${socket.port}');
    socket.listen((RawSocketEvent e){
      Datagram d = socket.receive();
      if (d == null) return;
      setState(() {
          message = new String.fromCharCodes(d.data).trim();
      });

        print('Datagram from ${d.address.address}:${d.port}: ${message}');
      });
    });
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
                                  'Tirar Foto',
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


import 'package:flutter/material.dart';

class TutorialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildRow(int v) {

      return Row(                        
                children: <Widget>[
                  SizedBox(
                    width: 15,
                    height: 55,
                  ),
                   Icon(
                      Icons.wifi,
                        size: 40,
                        color: Colors.black,
                      ),
                  SizedBox(
                     width: 20,
                  ),
                  Text("Wi-Fi $v",
                    style: TextStyle(fontSize: 18)),] 
              );
    }
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
        title: Text('Wi-Fi',style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
      ),
      
       preferredSize:Size.fromHeight(100.0),
      ),    
      body: Container(
        child: Container(
          child: Column(
            children: <Widget>[
                Container( 
                  decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)),
                  child: 
                    Row(              
                      children: <Widget>[
                        SizedBox(
                          width: 15,
                        ),  
                        SizedBox(
                          height: 90,
                        ),
                        Text("Wi-Fi",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        SizedBox(
                          width: 220,
                        ),
                        Icon(
                          Icons.wifi,
                          size: 40,
                          color: Colors.greenAccent,
                        ), 
                        ],
                      ),
                    ), 
                    SizedBox(
                          height: 55,
                        ),         
                  Container(
                    child: Column(
                      children: <Widget>[
                        _buildRow(1),
                        _buildRow(2),
                        _buildRow(3),
                        _buildRow(4),
                        _buildRow(5),
                        _buildRow(6),
                      ],
                    ),
                  )
                  ],
            ),
          ),
        )
      );
    }
}

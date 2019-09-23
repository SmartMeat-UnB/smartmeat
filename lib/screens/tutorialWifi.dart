import 'package:flutter/material.dart';

class TutorialWifi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
                  height: 10,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                          "images/ok.jpg",
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
                Text("Tudo certo NOME\n vamos começar.\nO primeiro passo\n é conectar seu\n celular a\n churrasqueira via\n wifi",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300 ),
                textAlign: TextAlign.center,)
                 
              ],

            ),
             SizedBox(
                  height: 15,
                ),
            Row(
              
              children: <Widget>[
                SizedBox(
                  width: 280,
                ),
                IconButton(
                icon: Icon(
                  Icons.navigate_next,
                  size: 60,
                  color: Colors.grey,
                 ), 
                 onPressed: () {
                   Navigator.pushNamed(context, '/tutorial');
                 },
                ),
              ],            
            )
          ],
        ),
      ),
    );
  }
}

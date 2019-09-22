import 'package:flutter/material.dart';

class TutorialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
                  height: 10,
                ),
            Row(),
            SizedBox(
                  height: 20,
                ),
            Row(),
             SizedBox(
                  height: 15,
                ),
            Row()
          ],
        ),
      )
    );
  }
}

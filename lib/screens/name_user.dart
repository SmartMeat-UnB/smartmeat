
import 'package:flutter/material.dart';
import 'package:smartmeat/widgets/text_section.dart';
import 'package:smartmeat/widgets/image_banner.dart';
import 'package:smartmeat/widgets/buttons.dart';


class NameUser extends StatelessWidget {
TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 3,),
          ImageBanner("images/SmartMeat.png"),
          TextSection("Vamos iniciar.\nPor favor,\n digite seu nome\n no campo abaixo!"),
          TextField(
            controller:  nameController,
            onChanged: (v) =>  nameController.text = v,
            decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Insira seu nome',
            labelText: "      Nome:",
            labelStyle: TextStyle(height:0, fontSize: 20,color: Colors.black,),
            ),
          ),
         Botao('PRONTO!'),
        ],
      )
      );

  }
}

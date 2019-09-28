
import 'package:flutter/material.dart';
import 'package:smartmeat/widgets/text_section.dart';
import 'package:smartmeat/widgets/image_banner.dart';
import 'package:smartmeat/widgets/buttons.dart';


class NameUser extends StatelessWidget {

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
            decoration: InputDecoration(labelText: "Nome",),
          ),
         Botao('PRONTO!'),
        ],
      )
      );

  }
}

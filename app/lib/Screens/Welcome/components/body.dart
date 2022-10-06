import 'package:app/Screens/Welcome/components/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // Pegando o tamanho e a largura da tela
    Size size = MediaQuery.of(context).size;
    return Background(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Bem Vindo!",
          style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SvgPicture.asset("assets/icons/Thesis-pana.svg", height: size.height * 0.4,)
          ],
    ),
    );
  }
}



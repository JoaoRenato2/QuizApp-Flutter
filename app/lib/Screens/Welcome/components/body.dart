import 'package:app/Screens/Welcome/components/background.dart';
import 'package:app/components/rounded_button.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Pegando o tamanho e a largura da tela
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Bem Vindo!",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {},
            ),
            RoundedButton(
              text: "LOGIN",
              textColor: Colors.black,
              color: kPrimaryLightColor,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:app/Screens/Login/components/backgorund.dart';
import 'package:app/Screens/Signup/signup_screen.dart';
import 'package:app/components/rounded_button.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),

              
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: Container(
                  // margin: EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 5,
                            offset: Offset(1, 1),
                            color: kPrimaryLightColor.withOpacity(0.2))
                      ]),
                  child: TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: kPrimaryLightColor, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: kPrimaryLightColor, width: 1.0)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: Container(
                  decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 5,
                            offset: Offset(1, 1),
                            color: kPrimaryLightColor.withOpacity(0.2))
                      ]),
                  child: TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.0)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {},
              ),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SingUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback? press;

  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Não tem uma conta ?" : "Já possui uma conta ?",
          style: GoogleFonts.openSans(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 190, 136, 214),
            ),
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? " Crie Uma" : " Clique aqui",
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
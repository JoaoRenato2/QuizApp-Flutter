import 'package:app/Screens/Login/components/body.dart';
import 'package:app/Screens/Login/login_screen.dart';
import 'package:app/Screens/Signup/background.dart';
import 'package:app/auth_controller.dart';
import 'package:app/components/rounded_button.dart';
import 'package:app/constants.dart';
import 'package:app/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Validation validar = Validation();
  final Widget child;

  Body({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    // TODO: implement build
    return Background(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "assets/icons/signup.svg",
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
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.deepPurpleAccent,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: kPrimaryLightColor, width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: kPrimaryLightColor, width: 1.0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                          ),
                  validator: (email) => validar.campoEmail(email.toString()),
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
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: "Senha",
                      prefixIcon: Icon(
                        Icons.password_sharp,
                        color: Colors.deepPurpleAccent,
                      ),
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
              text: "SIGNUP",
              press: () {
                AuthController.instance.register(emailController.text.trim(),
                    passwordController.text.trim());
              },
            ),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

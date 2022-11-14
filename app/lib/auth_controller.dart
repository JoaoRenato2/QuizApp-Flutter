import 'dart:js';

import 'package:app/Screens/Login/login_screen.dart';
import 'package:app/Screens/Quiz/selection_quiz.dart';
import 'package:app/Screens/Welcome/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges()); // notificacao de login e logoff
    ever(_user,
        _initialScreen); // bindando callback de redirecionamento ao estado do user
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => WelcomeScreen());
    }
  }

  void register(String email, String password, BuildContext context) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const SelectionQuiz();
        },
      ));
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Account creation failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ));
    }
  }

  void login(String email, String password, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const SelectionQuiz();
        },
      ));
    } catch (e) {
      const sn = SnackBar(
        content: Text("Falha no login", textAlign: TextAlign.center),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      );

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(sn);
    }
  }

  String getEmail() {
    return FirebaseAuth.instance.currentUser!.email!;
  }

  void logOut(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return WelcomeScreen();
      },
    ));
  }
}

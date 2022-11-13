import 'package:app/Screens/Login/components/backgorund.dart';
import 'package:app/Screens/Quiz/quiz.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class SelectionQuiz extends StatelessWidget {
  const SelectionQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 229, 219, 236),
        appBar: AppBar(
          title: const Text('QuizApp'),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
        ),
        body: SafeArea(
            child: Column(
          children: [
            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 10,
                margin: EdgeInsets.all(10),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Quiz();
                        },
                      ),
                    );
                    debugPrint('Card tapped.');
                  },
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: Image.asset(
                      "assets/images/1_5-aoK8IBmXve5whBQM90GA.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
        drawer: SafeArea(
            child: Drawer(
                backgroundColor: Color.fromARGB(255, 229, 219, 236),
                child: ListView(children: [
                  const UserAccountsDrawerHeader(
                      accountName: Text('Seu nome e sobrenome'),
                      accountEmail: Text('seuemail@mail.com'),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/bart.jpg'),
                      ),
                      decoration: BoxDecoration(color: kPrimaryColor)),
                  ListTile(
                    leading: const Icon(Icons.exit_to_app),
                    title: const Text("Logout"),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      print("Logout");
                    },
                  ),
                ]))));
  }
}

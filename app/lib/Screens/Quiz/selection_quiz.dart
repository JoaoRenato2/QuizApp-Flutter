import 'package:app/Screens/Login/components/backgorund.dart';
import 'package:app/Screens/Quiz/quiz.dart';
import 'package:app/auth_controller.dart';
import 'package:app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class SelectionQuiz extends StatelessWidget {
  const SelectionQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // backgroundColor: Color.fromARGB(255, 229, 219, 236),
        appBar: AppBar(
          title: const Text('QuizApp'),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purpleAccent, kPrimaryColor],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          bottom: const TabBar(
              indicatorColor: Color.fromARGB(255, 83, 43, 151),
              indicatorWeight: 5,
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: "Home",
                ),
                Tab(
                  icon: Icon(Icons.face),
                  text: "Perfil",
                ),
                Tab(
                  icon: Icon(Icons.settings),
                  text: "Configurações",
                )
              ]),
        ),
        body: TabBarView(
          children: [
            const CardQuiz(),
            EditProfileUI(),
            SettingsPageUi(),
          ],
        ),

        drawer: SafeArea(
          child: Drawer(
            backgroundColor: const Color.fromARGB(255, 229, 219, 236),
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                    accountName: const Text('Nome'),
                    accountEmail: Text(AuthController.instance.getEmail()),
                    currentAccountPicture: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2018/04/18/18/56/user-3331256_960_720.png'),
                    ),
                    decoration: const BoxDecoration(color: kPrimaryColor)),
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text("Logout"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    print("Logout");
                    AuthController.instance.logOut(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardQuiz extends StatelessWidget {
  const CardQuiz({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          // child: Card(
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(10.0),
          //   ),
          //   elevation: 10,
          //   margin: EdgeInsets.all(10),
          //   child: InkWell(
          //     splashColor: Colors.blue.withAlpha(30),
          //     onTap: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) {
          //             return Quiz();
          //           },
          //         ),
          //       );
          //       debugPrint('Card tapped.');
          //     },
          //     child: SizedBox(
          //       width: 300,
          //       height: 100,
          //       child: Image.asset(
          //         "assets/images/1_5-aoK8IBmXve5whBQM90GA.png",
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),
          // ),
          child: GFCard(
            boxFit: BoxFit.cover,
            titlePosition: GFPosition.end,
            showOverlayImage: true,
            imageOverlay: const AssetImage(
              'assets/images/1_5-aoK8IBmXve5whBQM90GA.png',
            ),
            title: const GFListTile(
              titleText: 'Flutter',
              subTitleText: 'Desenvolvimento para Dispositivos Móveis',
            ),
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFButton(
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Quiz();
                        },
                      ),
                    );
                  },
                  text: 'Jogar',
                ),
                // GFAvatar(
                //   backgroundColor: GFColors.WARNING,
                //   child: Icon(
                //     Icons.home,
                //     color: Colors.white,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class EditProfileUI extends StatefulWidget {
  @override
  _EditProfileUIState createState() => _EditProfileUIState();
}

class _EditProfileUIState extends State<EditProfileUI> {
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2018/04/18/18/56/user-3331256_960_720.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 4, color: Colors.white),
                            color: kPrimaryColor),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              buildTextField("Nome Completo", "Exemplo", false),
              buildTextField("Email", "exemplo@gmail.com", false),
              buildTextField("Senha", "*******", true),
              buildTextField("Endereço", "Belo Horizonte", false),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      "Cancelar",
                      style: TextStyle(
                          fontSize: 15, letterSpacing: 2, color: Colors.black),
                    ),
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Salvar",
                      style: TextStyle(
                          fontSize: 15, letterSpacing: 2, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTexteField) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 30,
      ),
      child: TextFormField(
        obscureText: isPasswordTexteField ? isObscurePassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTexteField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscurePassword = !isObscurePassword;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
      ),
    );
  }
}

class SettingsPageUi extends StatefulWidget {
  @override
  _SettingsPageUiState createState() => _SettingsPageUiState();
}

class _SettingsPageUiState extends State<SettingsPageUi> {
  bool valNotify1 = false;
  bool valNotify2 = true;
  bool valNotify3 = false;

  onChangeFunction1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2) {
    setState(() {
      valNotify2 = newValue2;
    });
  }

  onChangeFunction3(bool newValue3) {
    setState(() {
      valNotify3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children: const [
                Icon(
                  Icons.person,
                  color: kPrimaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Conta",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(
              height: 20,
              thickness: 1,
              color: kPrimaryColor,
            ),
            const SizedBox(
              height: 10,
            ),
            buildAccountOption(context, "Trocar a senha"),
            buildAccountOption(context, "Configuração de Conteudo"),
            buildAccountOption(context, "Social"),
            buildAccountOption(context, "Idioma"),
            buildAccountOption(context, "Privacidade e Segurança"),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: const [
                Icon(
                  Icons.volume_up_outlined,
                  color: kPrimaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Notificação",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(
              height: 20,
              thickness: 1,
              color: kPrimaryColor,
            ),
            const SizedBox(
              height: 10,
            ),
            buildNotificationOption("Dark Mode", valNotify1, onChangeFunction1),
            buildNotificationOption(
                "Conta Ativa", valNotify2, onChangeFunction2),
            buildNotificationOption(
                "Oportunidade", valNotify3, onChangeFunction3),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  AuthController.instance.logOut(context);
                },
                child: const Text(
                  "SIGN OUT",
                  style: TextStyle(
                      fontSize: 16, letterSpacing: 2.2, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildNotificationOption(
      String title, bool value, Function onChangeMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600]),
          ),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: kPrimaryColor,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangeMethod(newValue);
              },
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("Opção 1"),
                    Text("Opção 2"),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: kPrimaryColor,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/models/question.dart';

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  List<Question> questions = [
    Question("Flutter é uma linguagem de programação", false),
    Question("Dart veio para competir com o javascript", true),
    Question("Dart é bom", false),
    Question("Dart foi criado pela Google", true),
    Question("NullException tem alguma utilidade", true),
    Question("O Widget Scaffold engloba o Widget Container", true)
  ];

  int questionIndex = 0;
  String answer = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Quiz",
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: <Widget>[
              Container(
                height: 600.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          "Questão # ${questionIndex + 1}",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w900,
                              fontSize: 16.0),
                        ),
                      ),
                      Text(
                        questions[questionIndex].question,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 20.0),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            answer,
                            style: TextStyle(
                                color: answer == "Correto!"
                                    ? Colors.green
                                    : Colors.red,
                                fontWeight: FontWeight.w900,
                                fontSize: 16.0),
                          ))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        color: const Color(0xff444444),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Verdadeiro",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      onTap: () {
                        if (questions[questionIndex].answer == true) {
                          setState(() {
                            if (questionIndex + 1 < questions.length) {
                              questionIndex++;
                            }
                            answer = "Correto!";
                          });
                        } else {
                          setState(() {
                            if (questionIndex + 1 < questions.length) {
                              questionIndex++;
                            }
                            answer = "Incorreto!";
                          });
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                        child: Container(
                          color: Colors.red,
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text("Falso",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w900)),
                          ),
                        ),
                        onTap: () {
                          if (questions[questionIndex].answer == false) {
                            setState(() {
                              if (questionIndex + 1 < questions.length) {
                                questionIndex++;
                              }
                              answer = "Correto!";
                            });
                          } else {
                            setState(() {
                              if (questionIndex + 1 < questions.length) {
                                questionIndex++;
                              }
                              answer = "Incorreto!";
                            });
                          }
                        }),
                  )
                ]),
              )
            ],
          ),
        ));
  }
}

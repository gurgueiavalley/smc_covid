import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smccovid/components/item_pergunta.dart';
import 'package:smccovid/models/pergunta.dart';

import '../components/custom-botton.dart';
import '../constants/constants.dart';
import '../constants/constants.dart';
import '../constants/constants.dart';
import 'dart:convert';

class Questionario extends StatefulWidget {
  @override
  _QuestionarioState createState() => _QuestionarioState();
}

var perguntasTeste = [
  {'pergunta': 'Alguém de sua família esta com gripe?', 'valor': false},
  {'pergunta': 'Teve febre nos últimos 5 dias?', 'valor': false},
  {
    'pergunta': 'Teve contato com pessoas que estiveram COVID 19?',
    'valor': false
  },
  {
    'pergunta': 'Possui problemas como, coração, obesidade, etc. ',
    'valor': false
  },
];
//var listaPerguntas = [];
Future<String> dados() async {
  var listaPerguntas = await hasuraConnect.query(Pergunta().listar());
  //final jsonResponse = json.decode(listaPerguntas);
  print(listaPerguntas);
  //perguntas = listaPerguntas;
  print(perguntas);
  //return listaPerguntas;
}

var perguntas = [];

class _QuestionarioState extends State<Questionario> {
  List _respostar = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: cor_base,
              height: MediaQuery.of(context).size.width / 2.5,
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Questionário',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 30,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width / 30),
                        height: MediaQuery.of(context).size.width / 2.5,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                            color: cor_base, shape: BoxShape.circle),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Icon(
                            Icons.message,
                            size: 80,
                            color: cor_base,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    CustomButton(
                      color: cor_base,
                      cor_indicador: Colors.white,
                      title: Text(
                        'Concluir',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

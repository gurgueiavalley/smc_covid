import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smccovid/components/item_pergunta.dart';
import 'package:smccovid/models/pergunta.dart';
import '../components/custom-botton.dart';
import '../constants/constants.dart';
import '../constants/constants.dart';

class Questionario extends StatefulWidget {
  @override
  _QuestionarioState createState() => _QuestionarioState();
}

var perguntasTeste = [
  {
    'pergunta': 'Você costuma realizar viagens em transporte coletivo?',
    'valor': false
  },
  {
    'pergunta':
        'Nos últimos 14 dias, você esteve em contato próximo com pessoa suspeita ou confirmada da COVID-19?',
    'valor': false
  },
  {
    'pergunta': 'Sente ou sentiu algum problema de saúde nos últimos 7 dias?',
    'valor': false
  },
  {
    'pergunta':
        'Você apresentou ou apresenta algum sinal/sintoma de síndrome gripal (febre, tosse, congestão nasal, dor garganta, dor cabeça, dor no corpo, falta de ar, perda do paladar, perda do olfato, diarreia, enjoo), nos últimos 14 dias?',
    'valor': false
  },
  {'pergunta': 'Realizou consulta médica?', 'valor': false},
  {'pergunta': 'Realizou teste para a COVID-19?', 'valor': false},
  {
    'pergunta':
        'Você esteve ou está em isolamento social com monitoramento da equipe de saúde do seu município, ou internação hospitalar?',
    'valor': false
  },
  {
    'pergunta': 'Possui problemas como, coração, obesidade, etc. ',
    'valor': true
  },
];
var lsb = [];

class _QuestionarioState extends State<Questionario> {
  List _respostar = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int taml = perguntasTeste.length;
    for (var i = 0; i < taml; i++) {
      lsb.add(false);
    }
    print(lsb);
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
                    for (int i = 0; i < perguntasTeste.length; i++)
                      ItemPergunta(
                        pergunta: perguntasTeste[i]['pergunta'],
                        valor: perguntasTeste[i]['valor'],
                        onPressed: () {
                          if (perguntasTeste[i]['valor']) {
                            perguntasTeste[i]['valor'] = false;
                          } else {
                            perguntasTeste[i]['valor'] = true;
                          }
                          setState(() {});
                        },
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
                      onPressed: () {
                        /*
                        passando as respostas para do usuario para o vetor lsb
                        */
                        for (int i = 0; i < perguntasTeste.length; i++)
                          lsb[i] = perguntasTeste[i]['valor'];

                        print('lsb inicial');
                        print(lsb);
                        print('dicionario perguntas');
                        print(perguntasTeste);
                        print('lsb final');
                        print(lsb);
                      },
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
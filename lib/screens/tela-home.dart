import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smccovid/components/botton-home.dart';
import 'package:smccovid/components/botton-out.dart';
import 'package:smccovid/components/sintomas.dart';
import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/screens/questionario-home.dart';
import 'package:smccovid/screens/sign_in.dart';
import 'package:smccovid/screens/tela-estatistica.dart';
import 'package:smccovid/screens/tela-login.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:smccovid/screens/tela-questionario.dart';
import 'package:smccovid/models/resposta.dart';
import '../models/resposta.dart';
import 'sign_in.dart';

class Tela_Home extends StatefulWidget {
  @override
  _Tela_HomeState createState() => _Tela_HomeState();
}

class _Tela_HomeState extends State<Tela_Home> {
  var cor;
  bool valor = true;
  Questionario questionario = Questionario();

  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();
    print('Sua localização');
    print(dados_localizacao);
    _aguardar().then((value) => setState(() {
          valor = value;
        }));

    _funcaoResposta().then((value) => setState(() {
          cor = value;
          print('cor do card: ' + cor);
        }));
  }

  Future _aguardar() async {
    await Future.delayed(Duration(seconds: 5));
    return valor = false;
  }

  Future _funcaoResposta() async {
    await Future.delayed(Duration(seconds: 3));
    var resposta = await hasuraConnect.query(Resposta().corResposta(idUsuario));
    return "${resposta['data']['respostas']}";
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
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
                            'Olá ',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 30,
                                color: Colors.white),
                          ),
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(child: Container()),
                          BottonOut(),
                        ],
                      ),
                      valor == true
                          ? Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10,
                                    )
                                  ],
                                ),
                                margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width / 15,
                                ),
                                height: MediaQuery.of(context).size.width / 2.5,
                                child: Center(
                                  child: CupertinoActivityIndicator(),
                                ),
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width / 15),
                              height: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 6,
                                      color: cor == '[{resposta: verde}]'
                                          ? Colors.green
                                          : cor == '[{resposta: amarelo}]'
                                              ? Colors.yellow[700]
                                              : Colors.red),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10,
                                    )
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          maxRadius: 40,
                                          backgroundColor: cor_base,
                                          backgroundImage:
                                              NetworkImage(imageUrl),
                                        ),
                                        cor == '[{resposta: amarelo}]'
                                            ? Text('Nivel 2',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.yellow.shade800,
                                                ))
                                            : cor == '[{resposta: verde}]'
                                                ? Text('Nivel 1',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.green.shade800,
                                                    ))
                                                : Text('Nivel 3',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.red.shade800,
                                                    ))
                                      ],
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.6,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                                child: cor ==
                                                        '[{resposta: amarelo}]'
                                                    ? AutoSizeText(
                                                        'Você se encaixa na categoria de risco.',
                                                        style: TextStyle(
                                                          color: Colors
                                                              .yellow.shade800,
                                                        ),
                                                        maxFontSize: 18,
                                                        minFontSize: 14,
                                                      )
                                                    : cor ==
                                                            '[{resposta: verde}]'
                                                        ? AutoSizeText(
                                                            'Você possivelmente não está com a COVID 19',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .green[700],
                                                            ),
                                                            maxFontSize: 18,
                                                            minFontSize: 14,
                                                          )
                                                        : AutoSizeText(
                                                            'Você tem uma grande possibilidade de está com a COVID 19',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .red.shade800,
                                                            ),
                                                            maxFontSize: 18,
                                                            minFontSize: 14,
                                                          )),
                                          ),
                                          Divider(
                                            color: Colors.black,
                                          ),
                                          cor == '[{resposta: vermelho}]'
                                              ? AutoSizeText(
                                                  'Procure um hospital para fazer um teste.',
                                                  style: TextStyle(
                                                    color: Colors.red.shade800,
                                                  ),
                                                )
                                              : cor == '[{resposta: verde}]'
                                                  ? AutoSizeText(
                                                      'Continue se cuidando.',
                                                      style: TextStyle(
                                                        color:
                                                            Colors.green[700],
                                                      ),
                                                    )
                                                  : AutoSizeText(
                                                      'Continue se cuidando ou procure um hospital para fazer um teste.',
                                                      style: TextStyle(
                                                        color: Colors
                                                            .yellow.shade800,
                                                      ),
                                                    ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.bottomRight,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 50,
                                            child: RaisedButton(
                                              child: Text(
                                                'Refaça o teste',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  child: QuestionarioHome(
                                                    refazerTeste: true,
                                                  ),
                                                );
                                              },
                                              color: cor_base,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            //color: Colors.red,
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CardSintomas(
                  img: 'assets/1.png',
                  titulo: 'Calafrio',
                ),
                CardSintomas(
                  img: 'assets/4.png',
                  titulo: 'Tosse',
                ),
                CardSintomas(
                  img: 'assets/5.png',
                  titulo: 'Febre',
                ),
                CardSintomas(
                  img: 'assets/6.png',
                  titulo: 'Tosse',
                ),
                CardSintomas(
                  img: 'assets/10.png',
                  titulo: 'Diarreia',
                ),
              ],
            ),
          ),
          Column(
            children: [
              BottonHome(
                icon: Icon(
                  Icons.assignment,
                  size: 40,
                  color: Colors.white,
                ),
                titulo: Text(
                  'Prevenção',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                onPressed: _launchURLPrevencao,
              ),
              BottonHome(
                icon: Icon(
                  Icons.info,
                  size: 40,
                  color: Colors.white,
                ),
                titulo: Text(
                  'Informações',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                onPressed: _launchURLInformacao,
              ),
              BottonHome(
                icon: Icon(
                  Icons.multiline_chart,
                  size: 40,
                  color: Colors.white,
                ),
                titulo: Text(
                  'Estastística',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    child: TelaEstatistica(),
                  );

                  /* Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaEstatistica(),
                    ),
                  ); */
                },
              ),
              SizedBox(
                height: 50,
              )
            ],
          )
        ],
      ),
    );
  }

  _launchURLInformacao() async {
    const url = 'https://www.paho.org/pt/covid19';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLPrevencao() async {
    const url = 'https://coronavirus.saude.gov.br/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

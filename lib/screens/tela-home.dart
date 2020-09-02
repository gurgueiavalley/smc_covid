import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:smccovid/components/botton-home.dart';
import 'package:smccovid/components/sintomas.dart';
import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/screens/sign_in.dart';
import 'package:smccovid/screens/tela-estatistica.dart';
import 'package:smccovid/screens/tela-login.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:smccovid/screens/tela-questionario.dart';
import 'package:smccovid/models/resposta.dart';

import '../models/resposta.dart';
import '../models/resposta.dart';
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
                            googleSignIn.currentUser.displayName,
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: () {
                              return _alerta();
                            },
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(imageUrl),
                            ),
                          )
                        ],
                      ),
                      valor == true
                          ? Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 7,
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
                                                  color: Colors.yellow[700],
                                                ))
                                            : cor == '[{resposta: verde}]'
                                                ? Text('Nivel 1',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.green[700],
                                                    ))
                                                : Text('Nivel 3',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red,
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
                                          Container(
                                              child: cor ==
                                                      '[{resposta: amarelo}]'
                                                  ? Text(
                                                      'Você tem uma possibilidade média de está com a COVID 19',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .yellow[700],
                                                          fontSize: 18),
                                                    )
                                                  : cor == '[{resposta: verde}]'
                                                      ? Text(
                                                          'Você possivelmente não está com a COVID 19',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .green[700],
                                                              fontSize: 18),
                                                        )
                                                      : Text(
                                                          'Você tem uma grande possibilidade de está com a COVID 19',
                                                          style: TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 16),
                                                        )),
                                          Divider(
                                            color: Colors.black,
                                          ),
                                          cor == '[{resposta: vermelho}]' ||
                                                  cor == '[{resposta: amarelo}]'
                                              ? Text(
                                                  'Procure um Hospital mais próximo.',
                                                  style: TextStyle(
                                                    color: cor_base,
                                                  ),
                                                )
                                              : Text(
                                                  '.',
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
                                                Navigator.pop(context);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Questionario()));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TelaEstatistica()));
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

  _alerta() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Align(
              alignment: Alignment.bottomLeft,
              child: AlertDialog(
                backgroundColor: cor_base,
                title: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          'assets/logo.png',
                          scale: 6,
                        ),
                      ),
                    ),
                    Text(
                      'Sair',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                content: Text('deseja sair da sua conta ?',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center),
                actions: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 50, right: 60),
                      child: Row(
                        children: [
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.pop(context);
                                  signOutGoogle();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Tela_Login()));
                                });
                              },
                              child: Text(
                                'Sair',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.start,
                              )),
                          FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancelar',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                                textAlign: TextAlign.start,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}

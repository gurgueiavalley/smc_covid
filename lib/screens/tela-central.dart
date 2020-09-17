import 'package:flutter/material.dart';
import 'package:smccovid/components/botton-out.dart';
import 'package:smccovid/components/botton-telefone.dart';
import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/screens/sign_in.dart';
import 'package:smccovid/screens/tela-login.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:smccovid/screens/tela-home.dart';

class Tela_Central extends StatefulWidget {
  @override
  _Tela_CentralState createState() => _Tela_CentralState();
}

class _Tela_CentralState extends State<Tela_Central> {
  Tela_Home tela_home = Tela_Home();
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
                        'Central',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      BottonOut()
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
                        child: Image.asset(
                          'assets/12.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  BottonTelefone(
                    titulo: 'SECRETARIA DE SAUDE',
                    onPressed: _launchURLSecretarSaude,
                    icon: Icons.phone,
                  ),
                  BottonTelefone(
                    titulo: 'HOSPITAL',
                    onPressed: _launchURLSecretarSaude,
                    icon: Icons.phone,
                  ),
                  BottonTelefone(
                    titulo: 'WHATSAPP COVID',
                    onPressed: _launchURLWhatsapp,
                    icon: Icons.phone,
                  ),
                  BottonTelefone(
                    titulo: 'PRONTO SOCORRO',
                    onPressed: _launchURLFazerLigacao,
                    icon: Icons.phone,
                  ),
                  BottonTelefone(
                    titulo: 'NOTÍCIAS IMPORTANTES',
                    onPressed: _launchURLInformacaoCorona,
                    icon: Icons.info,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  _launchURLInformacaoCorona() async {
    const url =
        'https://news.google.com/topics/CAAqBwgKMN30lwsw_J2vAw?hl=pt-BR&gl=BR&ceid=BR%3Apt-419';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLSecretarSaude() async {
    const url = 'https://www.conass.org.br/secretarios-estaduais-de-saude/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLFazerLigacao() async {
    const url = "tel:192";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLWhatsapp() async {
    const url =
        "https://api.whatsapp.com/send?phone=556199380031&text=oi&source=&data=&app_absent=";
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
                                  //Future.delayed(Duration(seconds: 1));
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

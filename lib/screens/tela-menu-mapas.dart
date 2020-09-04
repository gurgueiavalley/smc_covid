import 'package:flutter/material.dart';
import 'package:smccovid/components/botton-home.dart';
import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/screens/sign_in.dart';
import 'package:smccovid/screens/tela-aglomeracao.dart';
import 'package:smccovid/screens/tela-login.dart';
import 'package:smccovid/screens/tela-map.dart';

class MenuMapas extends StatefulWidget {
  @override
  _MenuMapasState createState() => _MenuMapasState();
}

class _MenuMapasState extends State<MenuMapas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        Container(
          color: cor_base,
          height: MediaQuery.of(context).size.width / 2.5,
        ),
        SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mapas',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 30,
                                color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              // return _alerta();
                              return _alerta();
                            },
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(imageUrl),
                            ),
                          )
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
                              'assets/logo.png',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      SafeArea(
                        child: BottonHome(
                          icon: Icon(
                            Icons.map,
                            size: 40,
                            color: Colors.white,
                          ),
                          titulo: Text(
                            'Aglomerações',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              child: TelaAglomeracao(),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SafeArea(
                        child: BottonHome(
                          icon: Icon(
                            Icons.map,
                            size: 40,
                            color: Colors.white,
                          ),
                          titulo: Text(
                            'Distribução de Casos',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              child: TelaMapa(),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      )
                    ])))
      ]),
    ));
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
                                  signOutGoogle();
                                  //Future.delayed(Duration(seconds: 1));
                                  Navigator.pop(context);
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

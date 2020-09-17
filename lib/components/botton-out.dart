import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/screens/sign_in.dart';
import 'package:smccovid/screens/tela-login.dart';

class BottonOut extends StatefulWidget {
  @override
  _BottonOutState createState() => _BottonOutState();
}

class _BottonOutState extends State<BottonOut> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      onPressed: _alerta,
    );
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
                content: Text('Deseja sair da sua conta ?',
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

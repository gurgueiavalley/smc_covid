import 'package:flutter/material.dart';
import 'package:smccovid/components/botton-home.dart';
import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/screens/sign_in.dart';
import 'package:smccovid/screens/tela-aglomeracao.dart';
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
                          CircleAvatar(
                            backgroundImage: NetworkImage(imageUrl),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TelaAglomeracao()));
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TelaMapa()));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      )
                    ]

                  )
                )
              )
            ]
          ),
        )
      );
    }
  }

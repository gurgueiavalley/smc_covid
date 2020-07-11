import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smccovid/constants/constants.dart';

class Nacional extends StatefulWidget {
  @override
  _NacionalState createState() => _NacionalState();

  novocontainer(MaterialColor red, Text text, Text text2) {}
}

class _NacionalState extends State<Nacional> {
  String pais;
  String casos;
  String mortes;
  String recuperados;

  Future<Map> apiCovid() async {
    http.Response respostas = await http
        .get('https://covid19-brazil-api.now.sh/api/report/v1/brazil');
    return json.decode(respostas.body);
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: FutureBuilder<Map>(
            future: apiCovid(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.none ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(300, 50, 100, 0)),
                    Text(
                      'Carregando Dados...',
                      style: TextStyle(color: cor_base, fontSize: 30),
                    ),
                    CircularProgressIndicator()
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Erro ao Carregar!", style: TextStyle(color: cor_base, fontSize: 30),),
                );
              
              } else {
                pais = snapshot.data['data']['country'].toString();
                casos = snapshot.data['data']['confirmed'].toString();
                mortes = snapshot.data['data']['deaths'].toString();
                recuperados = snapshot.data['data']['recovered'].toString();
                return Center(
                    child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      color: cor_base,
                      child: Center(
                        child: Text(
                          'Nacional',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: cor_base),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            novocontainer(
                                Colors.blue,
                                Text(
                                  "País ",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  pais,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blue),
                                )),
                            Divider(
                              color: Colors.transparent,
                              height: 10,
                              indent: 10,
                              thickness: 5,
                            ),
                            novocontainer(
                                Colors.red,
                                Text(
                                  "Casos ",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  casos,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.red),
                                )),
                            Divider(
                              color: Colors.transparent,
                              height: 10,
                              indent: 10,
                              thickness: 5,
                            ),
                            novocontainer(
                                Colors.green,
                                Text(
                                  "Curados ",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  recuperados,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.green),
                                )),
                            Divider(
                              color: Colors.transparent,
                              height: 10,
                              indent: 10,
                              thickness: 5,
                            ),
                            novocontainer(
                              Colors.black,
                              Text(
                                "Mortes ",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                mortes,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ));
              }
            }));
  }

  Widget novocontainer(Color cor, Text texto1, texto2) {
    return Padding(
        padding: EdgeInsets.fromLTRB(2, 5, 2, 0),
        child: Row(
          children: [
            Container(
                width: 120,
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 10, 0, 5),
                color: cor,
                child: Center(
                  child: texto1,
                )),
            Container(
              width: 176,
              height: 50,
              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: cor),
                borderRadius: BorderRadius.circular(0),
              ),
              child: Center(
                child: texto2,
              ),
            ),
          ],
        ));
  }
}

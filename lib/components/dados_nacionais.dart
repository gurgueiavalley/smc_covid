import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_masked_text/flutter_masked_text.dart';
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
                  child: Text(
                    "Erro ao Carregar!",
                    style: TextStyle(color: cor_base, fontSize: 30),
                  ),
                );
              } else {
                pais = snapshot.data['data']['country'].toString();
                casos = snapshot.data['data']['confirmed'].toString();
                mortes = snapshot.data['data']['deaths'].toString();
                recuperados = snapshot.data['data']['recovered'].toString();

                var controllerCasos = new MaskedTextController(text: casos, mask: '0.000.000');
                var controllerMortes = new MaskedTextController(text: mortes, mask: '000.000');
                var controllerRecuperados = new MaskedTextController(text: recuperados, mask: '0.000.000');


                return Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(15),
                      color: cor_base,
                      child: Text(
                        'Nacional',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: cor_base),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                              "Brasil",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blue),
                            ),
                          ),
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
                                controllerCasos.text,
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
                                controllerRecuperados.text,
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
                              controllerMortes.text,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            }));
  }

  Widget novocontainer(Color cor, Text texto1, texto2) {
    return Row(
      children: [
        Container(
            width: 120,
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 10, 0, 5),
            color: cor,
            child: Center(
              child: texto1,
            )),
        Expanded(
          child: Container(
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
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smccovid/constants/constants.dart';

class Regional extends StatefulWidget {
  @override
  _RegionalState createState() => _RegionalState();
}

class _RegionalState extends State<Regional> {
  String nomeCidade = "";
  var _estados = [
    'AC',
    'AL',
    'AP',
    'AM',
    'BA',
    'CE',
    'DF',
    'ES',
    'GO',
    'MA',
    'MT',
    'MS',
    'MG',
    'PA',
    'PB',
    'PR',
    'PE',
    'PI',
    'RJ',
    'RN',
    'RS',
    'RO',
    'RR',
    'SC',
    'SP',
    'SE',
    'TO'
  ];
  var _itemSelecionado = 'BA';

  Future<Map> apiCovid2() async {
    http.Response resp = await http.get(
        'https://covid19-brazil-api.now.sh/api/report/v1/brazil/uf/$_itemSelecionado');
    return json.decode(resp.body);
  }

  String estado;
  String casos;
  String mortes;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<Map>(
          future: apiCovid2(),
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
              return Text("Erro ao Carregar");
            } else {
              estado = snapshot.data['state'].toString();
              casos = snapshot.data['cases'].toString();
              mortes = snapshot.data['deaths'].toString();

              return Center(
                  child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    color: cor_base,
                    child: Center(
                      child: Text(
                        'Regional',
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 3,
                                    color: cor_base,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: criaDropDownButton(),
                            ),
                          ),
                          novocontainer(
                              Colors.blue,
                              Text(
                                "Estado ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              Text(
                                estado,
                                style: TextStyle(
                                    fontSize: estado.length <= 14                                             
                                        ? 25
                                        : 17,
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
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
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
                            thickness: 5,
                          ),
                          novocontainer(
                              Colors.black,
                              Text(
                                "Mortes ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              Text(
                                mortes,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                        ],
                      ))
                ],
              )
              );
            }
          }),
    );
  }

  criaDropDownButton() {
    return Container(
      child: Column(
        children: <Widget>[
          //Text("Selecione o Estado", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: cor_base),),

          DropdownButton<String>(
              focusColor: cor_base,
              dropdownColor: Colors.deepPurple[50],
              icon: Icon(
                Icons.arrow_drop_down,
                size: 45,
                color: cor_base,
              ),
              underline: Container(),
              items: _estados.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: TextStyle(
                        color: cor_base,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                );
              }).toList(),
              onChanged: (String novoItemSelecionado) {
                _dropDownItemSelected(novoItemSelecionado);
                setState(() {
                  this._itemSelecionado = novoItemSelecionado;
                });
              },
              value: _itemSelecionado),
        ],
      ),
    );
  }

  void _dropDownItemSelected(String novoItem) {
    setState(() {
      this._itemSelecionado = novoItem;
    });
  }

  Widget novocontainer(Color cor, Text texto1, texto2) {
    return Padding(
      padding: EdgeInsets.fromLTRB(2, 10, 2, 0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 10, 0, 5),
            color: cor,
            child: texto1,
          ),
          Container(
            width: 176,
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 10, 0, 5),
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: cor),
              borderRadius: BorderRadius.circular(0),
            ),
            child: texto2,
          ),
        ],
      ),
    );
  }
}

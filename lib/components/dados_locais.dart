import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smccovid/constants/constants.dart';
import 'dart:convert';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:smccovid/components/dados_nacionais.dart';
import 'package:smccovid/constants/constants.dart';

class Dados_locais extends StatefulWidget {

  @override
  _Dados_locaisState createState() => _Dados_locaisState();
}

class _Dados_locaisState extends State<Dados_locais> {
  @override
  
  
  String local;
  String cidade;
  String ccc = 'aaaa';
  
  Future<Map> apiCovid() async {
    http.Response resposta = await http
        .get('https://brasil.io/api/dataset/covid19/caso/data/?city=$local');
    return json.decode(resposta.body);
  }
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<LocationData>(
        future: Location().getLocation(),
        builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.data.latitude != null &&
            snapshot.data.longitude != null) {
            local = dados_localizacao['subAdministrativeArea'];
            print(local);

        return FutureBuilder(
        future: apiCovid(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.none
          || snapshot.connectionState == ConnectionState.waiting){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(300, 50, 100, 0)),
                    Text(
                      'Carregando Dados...',
                      style: TextStyle(color: cor_base, fontSize: 30),
                    ),
                    CircularProgressIndicator()
                  ],
                )
              ],
            );
          }else if(snapshot.hasError){
            return Center(
              child: Text("Erro ao Carregar",),
            );
          }else if(dados_localizacao['country']!='Brazil'){
            return Center(
              child: Text("Sem Localização!", style: TextStyle(color: cor_base, fontSize: 30),),
            );
          }
          else if(snapshot.data['results'][0]['city'].toString()==null){
            return Center(
              child: Text("Sem Localização!", style: TextStyle(color: cor_base, fontSize: 30),),
            );
          }
          else{
         
            cidade = snapshot.data['results'][0]['city'].toString();
            String confirmados = snapshot.data['results'][0]['confirmed'].toString();
            String mortes = snapshot.data['results'][0]['deaths'].toString();
            String populacao = snapshot.data['results'][0]['estimated_population_2019'].toString();
  
             return Center(
                    child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      color: cor_base,
                      child: Center(
                        child: Text(
                          'Local',
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
                                  "Cidade",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  cidade,
                                  style: TextStyle(
                                      fontSize: 
                                      cidade.length <= 10 ?
                                      22: 15,
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
                                Colors.yellow[800],
                                Text(
                                  "População",
                                  style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  populacao,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.yellow[800]),
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
                                  confirmados,
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
        }
        );
        
            }else{
              return Center(
               child: CircularProgressIndicator(),
              );
            }
            }
        
        )
      
      
    );
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
            )
            ]
          )
        );
      }
    }
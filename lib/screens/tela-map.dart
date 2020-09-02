import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:smccovid/components/custom-map.dart';
import 'package:smccovid/components/dados_locais.dart';
import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/screens/sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:smccovid/screens/tela-login.dart';
import '../constants/constants.dart';

class TelaMapa extends StatefulWidget {
  @override
  _TelaMapaState createState() => _TelaMapaState();
}

class _TelaMapaState extends State<TelaMapa> {
  
  Dados_locais dd = Dados_locais();
  Future dadosLocais()async{
    http.Response response = await http.get('https://brasil.io/api/dataset/covid19/caso/data/?city=${dados_localizacao['subAdministrativeArea']}');
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [         

          SafeArea(child: MapCustom(),)
,
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
                        'Mapa',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                            color: Colors.white),
                      ),
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
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width / 15),
                    height: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.black45, blurRadius: 10)
                        ]),
                    child: FutureBuilder<dynamic>(
                      future: dadosLocais(),
                      builder: (context, snapshot){
                        if(snapshot.connectionState == ConnectionState.none ||
                          snapshot.connectionState == ConnectionState.waiting
                        ){
                          return Center(child: Text("Carregando informações", style: TextStyle(color: cor_base, fontSize: 20),),);
                        }else if(snapshot.hasData){
                           String confirmados =  snapshot.data['results'][0]['confirmed'].toString();
                      String mortes = snapshot.data['results'][0]['deaths'].toString();
                      String populacao = snapshot.data['results'][0]['estimated_population_2019'].toString();
                      return  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${dados_localizacao['subAdministrativeArea']}-${dados_localizacao['administrativeArea']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    color: cor_base),
                              ),
                              Text(
                                'Habitantes: $populacao',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    color: Colors.yellow[800]),
                              ),
                              
                              Text(
                                'Confirmados: $confirmados',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    color: Colors.red),
                              ),
                              
                              Text(
                                'Óbtos: $mortes',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 18),
                              ),
                            ],
                          ),
                          Icon(
                            Entypo.location_pin,
                            color: cor_base,
                            size: 80,
                          )
                        ],
                      ),
                    );
                        }
                        else{
                         return Center(child: Text("Erro ao obter informações", style: TextStyle(color: cor_base, fontSize: 20),),);

                        }
                     
                      }
                      //
                      
                      ) 
                    
                  )
                ],
              ),
            ),
          ),
        
        ],
      ),
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

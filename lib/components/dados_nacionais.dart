import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smccovid/constants/constants.dart';

class Nacional extends StatefulWidget {
  @override
  _NacionalState createState() => _NacionalState();
}

class _NacionalState extends State<Nacional> {

  String pais;
  String casos;
  String mortes;
  String recuperados;
  
  Future<Map> apiCovid() async{
    http.Response resposta = await http.get('https://covid19-brazil-api.now.sh/api/report/v1/brazil');
    return json.decode(resposta.body);
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {

      return FutureBuilder<Map>(
            future: apiCovid(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.none ||
                snapshot.connectionState == ConnectionState.waiting){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(300, 50, 100, 0)),
                      Text(
                        'Carregando Dados...',
                        style: TextStyle(color: cor_base, fontSize: 30),
                      ),CircularProgressIndicator()
                    ],
                  );
              }else if(snapshot.hasError){
                return Text("Erro ao Carregar");
              }else{
                pais = snapshot.data['data']['country'].toString();
                casos = snapshot.data['data']['confirmed'].toString();
                mortes = snapshot.data['data']['deaths'].toString(); 
                recuperados = snapshot.data['data']['recovered'].toString();
                return Center( 
                 child: Container(
                   padding: EdgeInsets.all(20),
                   decoration: BoxDecoration(
                    border: Border.all(
                     width: 3,
                     color: cor_base
                    ),
                    borderRadius: BorderRadius.circular(20),
                   ),

                   child: 
                   Expanded(child: 
                   Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       novocontainer(Colors.blue, Text("País: " +pais, style:TextStyle(fontSize: 25),),),
                       Divider(color: Colors.transparent, height: 10, indent: 10, thickness: 5,),
                       novocontainer(Colors.red, Text("Casos: " +casos, style:TextStyle(fontSize: 25),),),
                       Divider(color: Colors.transparent, height: 10, indent: 10, thickness: 5,),
                      novocontainer(Colors.green, Text("curados: " +recuperados, style:TextStyle(fontSize: 25),),),
                       Divider(color: Colors.transparent, height: 10, indent: 10, thickness: 5,),
                       novocontainer(Colors.black, Text("Mortes: " +mortes, style:TextStyle(fontSize: 25),),),

                     ],

                   ),
                
                   ),
              
                 )
                   
                );
              }
            
            });
  }
  Widget novocontainer(Color cor, Text texto){
      return Padding(padding: EdgeInsets.fromLTRB(2, 10, 2, 0),
      child: Container(width: 240,
        padding: EdgeInsets.fromLTRB(10, 10, 0, 5),
        decoration: BoxDecoration(
          border: Border.all(
                     width: 3,
                     color: cor
                    ),
                    borderRadius: BorderRadius.circular(10),
        ),child: 
        texto,
        
        
      ),
      
      
      ) ;
  }
}
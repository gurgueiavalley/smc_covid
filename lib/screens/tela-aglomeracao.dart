
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:location/location.dart';
import 'package:smccovid/components/custom-map-aglomeracao.dart';
import 'package:smccovid/components/custom-map.dart';
import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/models/aglomeracao.dart';
import 'package:smccovid/screens/sign_in.dart';
import 'package:smccovid/screens/tela-map.dart';

class TelaAglomeracao extends StatefulWidget {
  @override
  _TelaAglomeracaoState createState() => _TelaAglomeracaoState();
}

class _TelaAglomeracaoState extends State<TelaAglomeracao> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
      SafeArea(
        child: CustomMapAglomeracao()
      ),
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
                          'Aglomerações',
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
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width / 15),
                      height: MediaQuery.of(context).size.width / 3.5,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Colors.black45, blurRadius: 10)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Adicionar Ponto De Aglomeração',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18,
                                      color: cor_base),
                                ),
                              ],
                            ),
                            GestureDetector(
                              child: Icon(
                                Icons.add_location,
                                color: cor_base,
                                size: 80,
                              ),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0))),
                                        scrollable: true,
                                        backgroundColor: cor_base,
                                        title: Text(
                                          "Deseja notificar uma aglomeração neste endereço?",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        content: Container(
                                          height: 220,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                '${dados_localizacao['thoroughfare']}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                '${dados_localizacao['subAdministrativeArea']}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                '${dados_localizacao['administrativeArea']}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 10)),
                                              Theme(
                                                  data: ThemeData(
                                                    primaryColor: Colors.black,
                                                    hintColor: Colors.black,
                                                  ),
                                                  child: TextField(
                                                      controller: controller,
                                                      cursorWidth: 2,
                                                      cursorColor: Colors.white,
                                                      keyboardType:
                                                          TextInputType
                                                              .multiline,
                                                      maxLines: null,
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                      maxLength: 100,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                        labelText: "Descrição",
                                                        labelStyle: TextStyle(
                                                            color:
                                                                Colors.white),
                                                        hintStyle: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      )))
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                              onPressed: () {
                                                controller.text = "";
                                                Navigator.pop(context);
                                              },
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              color: Colors.red,
                                              child: Text("Cancelar")),
                                          FlatButton(
                                            onPressed: (){
                                              Aglomeracao a = Aglomeracao();
                                              a.id_google = "${idUsuario}";
                                              a.latitude = dados_localizacao['position']['latitude'];
                                              a.longitude = dados_localizacao['position']['longitude'];
                                              a.descricao = controller.text;
                                              a.data_hora = DateTime.now();
                                              a.cadastrar(a);
                                              controller.text = "";
                                              Navigator.pop(context);
                                              
                                            },
                                            color: Colors.green,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(30)
                                            ),
                                            child: Text("Cadastrar")
                                          ),
                                        ],
                                      );
                                    });
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ]))),
    ]));
  }
}

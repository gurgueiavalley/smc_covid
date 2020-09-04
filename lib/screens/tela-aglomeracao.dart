import 'package:flutter/material.dart';
import 'package:smccovid/components/custom-map-aglomeracao.dart';
import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/models/aglomeracao.dart';
import 'package:smccovid/screens/sign_in.dart';
import 'package:smccovid/screens/tela-login.dart';

class TelaAglomeracao extends StatefulWidget {
  @override
  _TelaAglomeracaoState createState() => _TelaAglomeracaoState();
}

class _TelaAglomeracaoState extends State<TelaAglomeracao> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: cor_base,
          icon: Icon(Icons.add_location_alt),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  scrollable: true,
                  backgroundColor: cor_base,
                  title: Text(
                    "Deseja notificar uma aglomeração neste endereço?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  content: Container(
                    height: 220,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Theme(
                            data: ThemeData(
                              primaryColor: Colors.black,
                              hintColor: Colors.black,
                            ),
                            child: TextField(
                                controller: controller,
                                cursorWidth: 2,
                                cursorColor: Colors.white,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                style: TextStyle(color: Colors.white),
                                maxLength: 100,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  labelText: "Descrição",
                                  labelStyle: TextStyle(color: Colors.white),
                                  hintStyle: TextStyle(color: Colors.black),
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
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.red,
                        child: Text("Cancelar")),
                    FlatButton(
                        onPressed: () {
                          Aglomeracao a = Aglomeracao();
                          a.id_google = "${idUsuario}";
                          a.latitude =
                              dados_localizacao['position']['latitude'];
                          a.longitude =
                              dados_localizacao['position']['longitude'];
                          a.descricao = controller.text;
                          a.data_hora = DateTime.now();
                          a.cadastrar(a);
                          controller.text = "";
                          Navigator.pop(context);
                        },
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text("Cadastrar")),
                  ],
                );
              },
            );
          },
          label: Text('Sinalizar Aglomeração'),
        ),
        appBar: AppBar(
          backgroundColor: cor_base,
          title: Text(
            'Aglomerações',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ],
        ),
        body: CustomMapAglomeracao());
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
                                  Navigator.pop(context);
                                  signOutGoogle();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Tela_Login()),
                                  );
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

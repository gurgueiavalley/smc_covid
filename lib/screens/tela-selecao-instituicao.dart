import 'package:flutter/material.dart';
import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/models/instituicao.dart';
import 'package:smccovid/screens/tela-selecao-campus.dart';

import 'tela-login.dart';

class TelaSelecaoInstituicao extends StatefulWidget {
  @override
  _TelaSelecaoInstituicaoState createState() => _TelaSelecaoInstituicaoState();
}

class _TelaSelecaoInstituicaoState extends State<TelaSelecaoInstituicao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
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
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Escolha sua instituição: ",
                            style: TextStyle(fontSize: 19),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 1.7,
                        child: FutureBuilder(
                          future: hasuraConnect.query(Instituicao().listar()),
                          builder: (_, dados) {
                            //print(dados);
                            if (dados.hasData) {
                              return GridView.builder(
                                  scrollDirection: Axis.vertical,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 5.0,
                                          mainAxisSpacing: 4.0),
                                  itemCount:
                                      dados.data['data']['instituicoes'].length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        elevation: 10,
                                        child: GridTile(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Image.network(
                                              dados.data['data']['instituicoes']
                                                  [index]['img'],
                                              width: 120,
                                            ),
                                            Text(
                                              dados.data['data']['instituicoes']
                                                  [index]['nome'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        )),
                                      ),
                                      onTap: () {
                                        int id = dados.data['data']
                                            ['instituicoes'][index]['id'];
                                        String nome = dados.data['data']
                                            ['instituicoes'][index]['nome'];

                                        if (nome == 'IFPI') {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TelaSelecaoCampus(idInstitucao: id,),
                                              ));
                                        } else {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Tela_Login(
                                                          idInstitucao: id)));
                                        }

                                        print(dados.data['data']['instituicoes']
                                            [index]['id']);
                                        print(dados.data['data']['instituicoes']
                                            [index]['nome']);
                                      },
                                    );
                                  });
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                    ]))),
      ]),
    ));
  }
}

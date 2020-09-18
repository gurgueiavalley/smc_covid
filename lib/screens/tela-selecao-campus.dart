import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:smccovid/components/custom-botton.dart';
import 'package:smccovid/constants/constants.dart';

class TelaSelecaoCampus extends StatefulWidget {
  @override
  _TelaSelecaoCampusState createState() => _TelaSelecaoCampusState();
}

class _TelaSelecaoCampusState extends State<TelaSelecaoCampus> {
  String valorDropdownCampus = "Selecione o seu campus";
  String valorDropdownOcupacao = "Selecione sua ocupação";
  bool valor_switch = false;
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
                        height: MediaQuery.of(context).size.width / 5,
                      ),
                      
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0.2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Campus: ",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                DropdownButton<String>(
                                  value: valorDropdownCampus,
                                  icon: Icon(
                                    Icons.arrow_downward,
                                    color: cor_base,
                                  ),
                                  iconSize: 24,
                                  elevation: 5,
                                  style:
                                  TextStyle(color: cor_base, fontSize: 20),
                                  onChanged: (String novoValor) {
                                    setState(() {
                                      valorDropdownCampus = novoValor;
                                    });
                                  },
                                  items: <String>[
                                    'Selecione o seu campus',
                                    'ANGICAL',
                                    'CAMPO MAIOR',
                                    'COCAL',
                                    'CORRENTE',
                                    'TERESINA DIRCEU ARCOVERDE',
                                    'FLORIANO',
                                    'JOSÉ DE FREITAS',
                                    'OEIRAS',
                                    'PARNAÍBA',
                                    'PAULISTANA',
                                    'PEDRO II',
                                    'PICOS',
                                    'PIO IX',
                                    'PIRIPIRI',
                                    'SÃO JOÃO',
                                    'SÃO RAIMUNDO NONATO',
                                    'TERESINA CENTRAL',
                                    'TERESINA ZONA SUL',
                                    'URUÇUÍ',
                                    'VALENÇA'
                                  ].map<DropdownMenuItem<String>>(
                                      (String valor) {
                                    return DropdownMenuItem<String>(
                                      value: valor,
                                      child: Text(valor),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Ocupação: ",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                DropdownButton<String>(
                                  value: valorDropdownOcupacao,
                                  icon: Icon(
                                    Icons.arrow_downward,
                                    color: cor_base,
                                  ),
                                  iconSize: 24,
                                  elevation: 5,
                                  style:
                                      TextStyle(color: cor_base, fontSize: 20),
                                  onChanged: (String novoValor) {
                                    setState(() {
                                      valorDropdownOcupacao = novoValor;
                                    });
                                  },
                                  items: <String>[
                                    'Selecione sua ocupação',
                                    'Aluno',
                                    'Professor',
                                    'Terceirizado',
                                    'Tec. Administrativo',
                                    'Setor Saúde'
                                  ].map<DropdownMenuItem<String>>(
                                      (String valor) {
                                    return DropdownMenuItem<String>(
                                      value: valor,
                                      child: Text(valor),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Você testou positivo para covid-19 e se recuperou ?",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Switch(
                                  activeColor: cor_base,
                                  value: valor_switch,
                                  onChanged: (value) {
                                    setState(() {
                                      valor_switch = value;
                                    });
                                  })
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3.5,
                      ),
                      CustomButton(
                          icon: Icon(
                            MaterialCommunityIcons.content_save,
                            color: cor_base,
                            size: 35,
                          ),
                          title: Text(
                            'CONTINUAR',
                            style: TextStyle(
                                color: cor_base,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            print(valorDropdownCampus);
                            print(valorDropdownOcupacao);
                            print(valor_switch);
                          })
                    ]
                    )
                  )
                ),
              ]
            ),
          )     
        );
      }
    }

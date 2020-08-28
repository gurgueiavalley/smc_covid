import 'package:flutter/material.dart';
import 'package:smccovid/components/custom-botton.dart';
import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/screens/sign_in.dart';

class TelaInformacao extends StatefulWidget {
  @override
  _TelaInformacaoState createState() => _TelaInformacaoState();
}

class _TelaInformacaoState extends State<TelaInformacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
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
                        'Informações',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(imageUrl),
                      )
                    ],
                  ),
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
                          'assets/ifpi.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Este projeto foi desenvolvido pelos alunos do curso de ADS do IFPI - Campus Corrente, ' +
                        'com o intuído de ajudar a população com orientações sobre prevenção e combate a ' +
                        'COVID-19, assim como, o monitoramento dos usuários em relação a doença. ',
                    style: TextStyle(color: cor_base, fontSize: 20),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  CustomButton(
                    color: cor_base,
                    title: Text(
                      'Apoie essa idéia!',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

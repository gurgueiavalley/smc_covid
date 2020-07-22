import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smccovid/components/item_pergunta.dart';
import 'package:smccovid/models/pergunta.dart';
import 'package:smccovid/models/resposta.dart';
import 'package:smccovid/models/usuario.dart';
import 'package:smccovid/screens/home.dart';
import 'package:smccovid/screens/sign_in.dart';
import 'package:smccovid/screens/verificar_questionario.dart';
import '../components/custom-botton.dart';
import '../constants/constants.dart';

class Questionario extends StatefulWidget {
  @override
  _QuestionarioState createState() => _QuestionarioState();
}

var perguntasTeste = [
  {
    'pergunta': 'Você costuma realizar viagens em transporte coletivo?',
    'valor': false
  },
  {
    'pergunta':
        'Nos últimos 14 dias, você esteve em contato próximo com pessoa suspeita ou confirmada da COVID-19?',
    'valor': false
  },
  {
    'pergunta': 'Sente ou sentiu algum problema de saúde nos últimos 7 dias?',
    'valor': false
  },
  {
    'pergunta':
        'Você apresentou ou apresenta algum sinal/sintoma de síndrome gripal (febre, tosse, congestão nasal, dor garganta, dor cabeça, dor no corpo, falta de ar, perda do paladar, perda do olfato, diarreia, enjoo), nos últimos 14 dias?',
    'valor': false
  },
  {'pergunta': 'Realizou consulta médica?', 'valor': false},
  {'pergunta': 'Realizou teste para a COVID-19?', 'valor': false},
  {
    'pergunta':
        'Você esteve ou está em isolamento social com monitoramento da equipe de saúde do seu município, ou internação hospitalar?',
    'valor': false
  },
  {
    'pergunta': 'Possui problemas como, coração, obesidade, etc. ',
    'valor': false
  },
];
var lsb = [];

class _QuestionarioState extends State<Questionario> {
  List _respostar = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int taml = perguntasTeste.length;
    for (var i = 0; i < taml; i++) {
      lsb.add(false);
    }
  }

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
                          'Questionário',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 30,
                              color: Colors.white),
                        ),
                        Expanded(child: Container()),
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
                          child: Icon(
                            Icons.message,
                            size: 80,
                            color: cor_base,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    for (int i = 0; i < perguntasTeste.length; i++)
                      ItemPergunta(
                        pergunta: perguntasTeste[i]['pergunta'],
                        valor: perguntasTeste[i]['valor'],
                        onPressed: () {
                          if (perguntasTeste[i]['valor']) {
                            perguntasTeste[i]['valor'] = false;
                          } else {
                            perguntasTeste[i]['valor'] = true;
                          }
                          setState(() {});
                        },
                      ),
                    SizedBox(
                      height: 50,
                    ),
                    CustomButton(
                      color: cor_base,
                      cor_indicador: Colors.white,
                      title: Text(
                        'Concluir',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        /*
                        passando as respostas do usuario para o vetor lsb
                        */
                        int cont = 0;
                        for (int i = 0; i < perguntasTeste.length; i++) {
                          lsb[i] = perguntasTeste[i]['valor'];
                          if (lsb[i] == true) cont++;
                        }
                        //instanciando a classe respostas
                        Resposta resposta = Resposta();
                        int totaltrue = perguntasTeste.length - cont;
                        String resultadoQ = '';
                        if (totaltrue >= 7) {
                          resultadoQ = 'verde';
                        } else if (totaltrue >= 2 && totaltrue <= 6) {
                          resultadoQ = 'amarelo';
                        } else if (totaltrue > 0 && totaltrue <= 1) {
                          resultadoQ = 'vermelho';
                        }
                        resposta.respostas = resultadoQ;
                        resposta.data = new DateTime.now();
                        resposta.idUsuario = idUsuario;

                        VerificarQuestionario vrq = VerificarQuestionario();
                        var situacao =
                            await vrq.verficarRespostaUsuario(idUsuario);
                        if (situacao) {
                          resposta.editar(resposta, idUsuario);
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        } else {
                          resposta.cadastrar(resposta);
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        }
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

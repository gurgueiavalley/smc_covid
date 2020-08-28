import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:smccovid/components/custom-botton.dart';
import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/models/resposta.dart';
import 'package:smccovid/screens/home.dart';
import 'package:smccovid/screens/tela-questionario.dart';
import 'package:smccovid/screens/verificar-login.dart';
import 'package:smccovid/screens/verificar_questionario.dart';
import '../models/contactchecklist.dart';
import '../models/contactchecklist.dart';
import '../models/contactchecklist.dart';
import '../models/contactchecklist.dart';
import '../models/instituicao.dart';
import '../models/instituicao.dart';
import '../models/usuario.dart';
import 'sign_in.dart';
import 'sign_in.dart';

class Tela_Login extends StatefulWidget {
  @override
  _Tela_LoginState createState() => _Tela_LoginState();
  int idInstitucao;
  Tela_Login({Key key, @required this.idInstitucao}) : super(key: key);
}

class _Tela_LoginState extends State<Tela_Login> {
  bool _press = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cor_base,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          Container(
            width: MediaQuery.of(context).size.width / 2.5,
            height: MediaQuery.of(context).size.width / 2.5,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                'assets/logo.png',
              ),
            ),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          ),
          SizedBox(
            height: 70,
          ),
          CustomButton(
            icon: Icon(
              MaterialCommunityIcons.gmail,
              color: cor_base,
              size: 35,
            ),
            title: Text(
              'GMAIL',
              style: TextStyle(
                  color: cor_base, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              signInWithGoogle().whenComplete(() async {
                print('Passou');

                //pegando dados da tabela resposta no banco
                /* var dados = await hasuraConnect.query(
                  Resposta().verificaResposta(
                    idUsuario,
                  ),
                ); */

                //Cadastrando Usuario no banco sqlite
                ContactCheckList check = ContactCheckList();
                Contact contact = Contact();
                contact.idGoogle = idUsuario;
                contact.check = true;

                print(idUsuario);

                bool a = await verificarPrimeiroAcesso();

                if (a == false) {
                  await check.saveContact(contact);
                }
                //Mostrando todos os usuarios no sqlite.
                print(check.getAllContacts());

                //Verificando se o usuario já foi cadastrado.
                var verificaUsuario =
                    await hasuraConnect.query(Usuario().buscar(idUsuario));
                print(
                    "Qtd user:  ${verificaUsuario['data']['usuarios'].length}");
                if (verificaUsuario['data']['usuarios'].length == 1) {
                  VerificarQuestionario vrq = VerificarQuestionario();
                  var situacao = await vrq.verficarRespostaUsuario(idUsuario);
                  if (situacao) {
                    var situacaoQuestionatio =
                        await vrq.verificaDataRespostaUsuario(
                      idUsuario,
                    );
                    if (situacaoQuestionatio) {
                      print('sim 1');
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return Questionario();
                          },
                        ),
                      );
                    } else {
                      print('sim 2');
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return Home();
                          },
                        ),
                      );
                    }
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return Questionario();
                        },
                      ),
                    );
                  }
                } else {
                  print('sim 3');
                  Usuario usuario = Usuario();
                  usuario.idGoogle = idUsuario;
                  usuario.nome = name;
                  usuario.email = email;
                  usuario.idade = 18;
                  usuario.latitude = dados_localizacao['position']['latitude'];
                  usuario.longitude =
                      dados_localizacao['position']['longitude'];
                  /*Mudar quando tiver pegando o id da instituicao*/
                  usuario.idInstituicao = widget.idInstitucao;
                  //cadastrando o usuario na tabela usuarios
                  usuario.cadastrar(usuario);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return Questionario();
                      },
                    ),
                  );
                }
              });
            },
          ),
          SizedBox(
            height: 30,
          ),
          CustomButton(
            icon: Icon(
              MaterialCommunityIcons.facebook,
              color: cor_base,
              size: 35,
            ),
            title: Text(
              'FACEBOOK',
              style: TextStyle(
                color: cor_base,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: _press
                ? () {
                    print('pressionado');
                    _press = false;
                    setState(
                      () {},
                    );
                  }
                : null,
          ),
          Expanded(
            child: Container(),
          ),
          Text(
            'By ADS V',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

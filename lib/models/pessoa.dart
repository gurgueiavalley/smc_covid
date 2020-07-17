import 'package:smccovid/models/instituicao.dart';

class Pessoa {
  int id;
  String nome;
  String email;
  //Instituicao instituicao;

  Pessoa(int id, String nome, String email) {
    this.nome = nome;
    this.email = email;
    //this.instituicao = instituicao;
  }
}

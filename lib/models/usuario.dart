import 'package:smccovid/constants/constants.dart';

import 'instituicao.dart';
import 'pessoa.dart';

class Usuario extends Pessoa {
  /* Variaveis da classe Usuario  */
  String idGoogle;
  int idade;
  double latitude;
  double longitude;
  int idInstituicao;
  /* Construtor da classe Usuario  */
  Usuario(
      {int id,
      String nome,
      String email,
      int idInstituicao,
      String idGoogle,
      int idade,
      double latitude,
      double longitude})
      : super(id, nome, email);

  /*  Método cadastrar Usuario  */
  cadastrar(Usuario usr) async {
    String query = """
     mutation MyMutation {
      insert_usuarios(objects: {
        id_google: "${usr.idGoogle}", 
        email: "${usr.email}", 
        id_instituicao: "${usr.idInstituicao}", 
        idade: ${usr.idade}, 
        latitude: "${usr.latitude}", 
        longitude: "${usr.longitude}", 
        nome: "${usr.nome}"}) {
    affected_rows
  }
}

    """;
    var res = await hasuraConnect.mutation(query);
    return true;
  }

  /* Método listar Usuarios */
  listar() {
    String query = """subscription MySubscription {
      usuarios {
        id
        nome
        email
      }
    }
    """;
    return query;
  }

//Buscar Usuario

  buscar(String idGoogle) {
    String query = """
    query MyQuery {
      usuarios(where: {id_google: {_eq: "$idGoogle"}}) {
        id_google
        id_instituicao
        idade
        latitude
        longitude
        nome
        email
      }
    }
  """;

    return query;
  }

  /* Método excluir Usuario */
  excluir(int id) async {
    String query = """
      mutation MyMutation {
        delete_usuarios(where: {id: {_eq: $id }}) {
          affected_rows
        }
      }
    """;
    var res = await hasuraConnect.mutation(query);
    return true;
  }

  /* Método editar Usuario */
  editar(Usuario usr, int id) async {
    String query = """
      mutation MyMutation {
        update_usuarios(where: {id: {_eq: $id }},
         _set: {
          nome: "${usr.nome}", 
          email: "${usr.email}", 
          idade: "${usr.idade}", 
          id_google: "${usr.idGoogle}", 
          latitude: "${usr.latitude}", 
          longitude: "${usr.longitude}", 
          id_instituicao: "${usr.idInstituicao}"           
        }){
          affected_rows
        }
      }
    """;
    var res = await hasuraConnect.mutation(query);
    return true;
  }
}

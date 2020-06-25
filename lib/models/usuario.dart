
import 'package:smccovid/constants/constants.dart';

import 'instituicao.dart';
import 'pessoa.dart';

class Usuario extends Pessoa {
  /* Variaveis da classe Usuario  */
  String idGoogle;
  int idade;
  double latitude;
  double longitude;

  /* Construtor da classe Usuario  */
  Usuario({int id, String nome, String email, Instituicao instituicao, String idGoogle, int idade, double latitude, double longitude}) : super(id, nome, email, instituicao);
  
  /*  Método cadastrar Usuario  */
  cadastrar(Usuario usr) async {
    String query = """
      mutation MyMutation {
        insert_usuarios(objects: {
          nome: "${usr.nome}", 
          email: "${usr.email}", 
          id_instituicao: "${usr.instituicao.id}", 
          id_google: "${usr.idGoogle}", 
          idade: "${usr.idade}", 
          latitude: "${usr.latitude}", 
          longitude: "${usr.longitude}" 
        }) {
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
          id_instituicao: "${usr.instituicao.id}"           
        }){
          affected_rows
        }
      }
    """;
    var res = await hasuraConnect.mutation(query);
    return true;  
  }

}
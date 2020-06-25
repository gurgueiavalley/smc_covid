import 'package:smccovid/constants/constants.dart';

class Administrador{
  int id;
  String nome; 
  String email;
  String senha;

  Administrador(int id, String nome, String email, String senha);


  /*  Método cadastrar Administrador  */
  cadastrar(Administrador administrador) async {
    String query = """
      mutation MyMutation {
        insert_administrador(objects: {
          nome: "${administrador.nome}", 
          email: "${administrador.email}",
          senha: "${administrador.senha}"
        }) {
          affected_rows
        }
      }
    """;
    var res = await hasuraConnect.mutation(query);
    return true;
  }

  /* Método listar Administradores */
  listar() {
    String query = """subscription MySubscription {
      administrador {
        id
        nome
        email
      }
    }
    """;
    return query;
  }

  /* Método excluir Administrador */
  excluir(int id) async {
    String query = """
      mutation MyMutation {
        delete_administrador(where: {id: {_eq: $id }}) {
          affected_rows
        }
      }
    """;
    var res = await hasuraConnect.mutation(query);
    return true;
  }

  /* Método editar Administrador */
  editar(Administrador administrador, int id) async {
    String query = """
      mutation MyMutation {
        update_administrador(where: {id: {_eq: $id }},
         _set: {
          nome: "${administrador.nome}", 
          email: "${administrador.email}", 
          senha: "${administrador.senha}"           
        }){
          affected_rows
        }
      }
    """;
    var res = await hasuraConnect.mutation(query);
    return true;  
  }

}
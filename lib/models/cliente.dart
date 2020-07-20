import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/models/instituicao.dart';

import 'pessoa.dart';

class Cliente extends Pessoa {
  String senha;
  int idInstituicao;

  /* Construtor da classe Cliente */
  Cliente({int id, String nome, String email, int idInstituicao, String senha})
      : super(id, nome, email);

  /*  Método cadastrar Cliente  */
  cadastrar(Cliente cliente) async {
    String query = """
      mutation MyMutation {
        insert_clientes(objects: {
          nome: "${cliente.nome}", 
          email: "${cliente.email}",
          id_instituicao: "${cliente.idInstituicao}",
          senha: "${cliente.senha}"
        }) {
          affected_rows
        }
      }
    """;
    var res = await hasuraConnect.mutation(query);
    return true;
  }

  /* Método listar Clientes */
  listar() {
    String query = """subscription MySubscription {
      clientes {
        id
        nome
        email
      }
    }
    """;
    return query;
  }

  /* Método excluir Cliente */
  excluir(int id) async {
    String query = """
      mutation MyMutation {
        delete_clientes(where: {id: {_eq: $id }}) {
          affected_rows
        }
      }
    """;
    var res = await hasuraConnect.mutation(query);
    return true;
  }

  /* Método editar Cliente */
  editar(Cliente cliente, int id) async {
    String query = """
      mutation MyMutation {
        update_clientes(where: {id: {_eq: $id }},
         _set: {
          nome: "${cliente.nome}", 
          email: "${cliente.email}", 
          id_instituicao: "${cliente.idInstituicao}"           
          senha: "${cliente.senha}"           
        }){
          affected_rows
        }
      }
    """;
    var res = await hasuraConnect.mutation(query);
    return true;
  }
}

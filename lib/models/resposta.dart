import 'package:smccovid/constants/constants.dart';

class Resposta {
  int id;
  String idUsuario;
  DateTime data;
  String respostas;

  /* Construtor da classe Resposta */
  Resposta({int id, String idUsuario, DateTime data, String resposta});

  /*  Método cadastrar Cliente  */
  cadastrar(Resposta resposta) async {
    String query = """
      mutation MyMutation {
        insert_respostas(objects: {
          id_usuario: "${resposta.idUsuario}", 
          data: "${resposta.data}",
          resposta: "${resposta.respostas}"
        }) {
          affected_rows
        }
      }
    """;
    var res = await hasuraConnect.mutation(query);
    return true;
  }

  /* Método editar Resposta */
  editar(Resposta resposta, String idUsuario) async {
    String query = """
      mutation MyMutation {
        update_respostas(where: {id_usuario: {_eq: "$idUsuario" }},
         _set: {
          data: "${resposta.data}", 
          resposta: "${resposta.respostas}"          
        }){
          affected_rows
        }
      }
    """;
    var res = await hasuraConnect.mutation(query);
    return true;
  }

  /*Método verifica se o usuário já possui resposta*/
  verificaResposta(String idUsuario) {
    String query = """ 
    query MyQuery {
        respostas(where: {id_usuario: {_eq: "$idUsuario"}}) {
          id_usuario
          data
        }
      }
    """;
    return query;
  }
}

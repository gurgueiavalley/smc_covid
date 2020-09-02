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
          id_google: "${resposta.idUsuario}", 
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
        update_respostas(where: {id_google: {_eq: "$idUsuario" }},
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
        respostas(where: {id_google: {_eq: "$idUsuario"}}) {
          id_google
          data
          resposta
          
        }
      }
    """;
    return query;
  }
  corResposta(String idUsuario) {
    String query = """ 
    query MyQuery {
        respostas(where: {id_google: {_eq: "$idUsuario"}}) {
          resposta
          
        }
      }
    """;
    return query;
  }
  
}

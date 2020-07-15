import 'package:hasura_connect/hasura_connect.dart';
import 'package:smccovid/constants/constants.dart';

class Aglomeracao {
  int id;
  int id_usuario;
  double latitude;
  double longitude;
  String descricao;

  Aglomeracao({this.id, this.id_usuario, this.latitude, this.longitude, this.descricao});


  listar(){
    String query = """ 
      query MyQuery {
        aglomeracao {
          id
          id_usuario
          latitude
          longitude
          descricao
        }
      }
    """;
    return query;
  }

  cadastrar(Aglomeracao a){
    String query = """
      mutation MyMutation {
        insert_aglomeracao(objects: {
          id_usuario: ${a.id_usuario}, 
          latitude: "${a.latitude}", 
          longitude: "${a.longitude}", 
          descricao: "${a.descricao}"
          }
        ) {
          affected_rows
        }
      }
    
    """;
    var res = hasuraConnect.mutation(query);
  }

}
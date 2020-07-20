import 'package:hasura_connect/hasura_connect.dart';
import 'package:smccovid/constants/constants.dart';

class Aglomeracao {
  String id_google;
  double latitude;
  double longitude;
  String descricao;
  DateTime data_hora;

  Aglomeracao({this.id_google, this.latitude, this.longitude, this.descricao, this.data_hora});


  listar(){
    String query = """ 
      query MyQuery {
        aglomeracoes {
          id_google
          latitude
          longitude
          data_hora
          descricao
          id
        }
      }
    """;
    return query;
  }

  cadastrar(Aglomeracao a){
    String query = """
      mutation MyMutation {
        insert_aglomeracoes(
          objects: { 
            id_google: "${a.id_google}", 
            latitude: "${a.latitude}", 
            longitude: "${a.longitude}", 
            descricao: "${a.descricao}", 
            data_hora: "${a.data_hora}"
          }
        ) {
          affected_rows
        }
      }
    """;
    var res = hasuraConnect.mutation(query);
  }
}
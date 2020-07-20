class Instituicao {
  int id;
  String nome;
  String descricao;

  Instituicao({this.id,  this.nome, this.descricao});

  listar(){
    String query = """
      query MyQuery {
        instituicoes {
          id
          nome
          descricao
          img
        }
      }
    """;

    return query;
  }


}
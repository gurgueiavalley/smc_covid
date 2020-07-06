class Pergunta {
  int id;
  String descricao;
  bool resposta;

  /* Construtor da classe Pergunta */
  Pergunta({int id, String descricao, bool resposta});

  /* Método listar Perguntas */
  listar() {
    String query = """query MyQuery {
        pergunta {
          descricao
          valor
        }
      }
    """;
    return query;
  }
}

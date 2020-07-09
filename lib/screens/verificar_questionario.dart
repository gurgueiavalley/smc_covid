import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/models/resposta.dart';

class VerificarQuestionario {
  verficarRespostaUsuario(String idUsuario) async {
    //pegando dados da tabela resposta no banco
    var dados =
        await hasuraConnect.query(Resposta().verificaResposta(idUsuario));

    return dados;
  }
}

/*
                //pegando dados da tabela resposta no banco
                var dados = await hasuraConnect
                    .query(Resposta().verificaResposta(idUsuario));

                var databanco = dados['data']['respostas'][0]['data'];
                //retirando o '-' da data do banco
                String dataBancoString = databanco.replaceAll('-', '');
                //Data de String para int
                int dataBancoInt = int.parse(dataBancoString);
                print(dataBancoInt);
                //data de hoje
                DateTime today = new DateTime.now();
                //data reduzida de hoje menos -7
                DateTime dataReduzida = today.add(new Duration(days: -7));
                String dataReduzidaString = dataReduzida.toString();

                var newFormat = DateFormat("yyyy-MM-dd");
                String updatedDt = newFormat.format(dataReduzida);

                dataReduzidaString = updatedDt.replaceAll('-', '');
                int dataReduzidaInt = int.parse(dataReduzidaString);
                print(dataReduzidaInt);
                print(dataReduzidaInt.runtimeType); 
*/

import '../models/contactchecklist.dart';

Future<bool> verificarPrimeiroAcesso() async {
  ContactCheckList dados = ContactCheckList();
  List dado = await dados.getAllContacts(); 
  print(dado);
  if(dado.length == 1){
    return true;
  }else{
    return false;
  }
}
import '../models/contactchecklist.dart';

Future<bool> verificarPrimeiroAcesso() async {
  ContactCheckList dados = ContactCheckList();
  List dado = await dados.getAllContacts();
  if (dado.length == 1) {
    return true;
  } else {
    return false;
  }
}

import 'package:flutter/material.dart';
import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/models/usuario.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Usuários'),),    

      body: StreamBuilder(
        stream: hasuraConnect.subscription(Usuario().listar()),
        builder: (_, d){
          if (d.hasData) {
            print(d.data);
            return ListView.builder(
                    itemCount: d.data['data']['usuarios'].length,
                    itemBuilder: (_, i){
                      return ListTile(
                        title: Text(d.data['data']['usuarios'][i]['nome']),
                      );
                    }
            );
          } else {
            print("nao conectado com banco");
             return Center(child: Text("Nao conectou ao banco"),);
          }

        },
      ),

    );
  } 


}
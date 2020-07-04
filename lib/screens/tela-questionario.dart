import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Questionario extends StatefulWidget {
  @override
  _QuestionarioState createState() => _QuestionarioState();
}

class _QuestionarioState extends State<Questionario> {
  bool respota1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Questinário IFCovid-19"),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "Você está com febre?",
            style: TextStyle(fontSize: 20),
          ),
          Switch(
            value: respota1,
            onChanged: (value) {
              setState(() {
                respota1 = value;
                print(respota1);
              });
            },
          ),
        ],
      ),
    );
  }
}

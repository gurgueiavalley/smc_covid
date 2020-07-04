import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemPergunta extends StatefulWidget {
  final pergunta;
  final valor;
  final onPressed;
  const ItemPergunta({Key key, this.pergunta, this.valor, this.onPressed}) : super(key: key);


  @override
  _ItemPerguntaState createState() => _ItemPerguntaState();
}

class _ItemPerguntaState extends State<ItemPergunta> {
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onPressed();
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                width: MediaQuery.of(context).size.width * 0.7,
                child: AutoSizeText(widget.pergunta,
                  style: TextStyle(color: Colors.black45, fontSize: 20),
                  wrapWords: true,
                )),
            CupertinoSwitch(
                value: widget.valor,
                onChanged: (x) {
                  widget.onPressed();
                }
            )
          ],
        ),
        height: 100,
        decoration: BoxDecoration(
            //color: Colors.red,
            border: Border(bottom: BorderSide(color: Colors.black12))),
      ),
    );
  }
}

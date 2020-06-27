import 'package:flutter/material.dart';
import 'package:smccovid/constants/constants.dart';

class CardSintomas extends StatelessWidget {
  final img;
  final titulo;
  const CardSintomas({Key key, this.img, this.titulo}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(img, width: 100,), 
          SizedBox(height: 10,),
          Text(titulo, style: TextStyle(color: cor_base),)
        ],
      ),
      
    );
  }
}
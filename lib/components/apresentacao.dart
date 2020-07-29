import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:smccovid/constants/constants.dart';

class CardApresentacao extends StatelessWidget {
  final textoL;
  final textoR;
  final img;
  const CardApresentacao({Key key, this.textoL, this.textoR, this.img}) : super(key: key);
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Image.asset('assets/logo.png', width: 120,),
            ),
          ),

          Container(
            //width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.width*0.4,
            child: AutoSizeText(textoL, style: TextStyle(fontSize: 25, color: cor_base),)),              

         


          AutoSizeText(textoR==null?'':textoR, style: TextStyle(fontSize: 18, color: cor_base, ), textAlign: TextAlign.right,),
          Expanded(child: Container()),


          Center(child: img),

          Container(height: MediaQuery.of(context).size.width/6,)

          



        ],
      ),
    ),




    
    );
  }
}
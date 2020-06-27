import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smccovid/constants/constants.dart';

class BottonTelefone extends StatefulWidget {
  final titulo;
  final onPressed;
  const BottonTelefone({Key key, this.titulo, this.onPressed}) : super(key: key);

  
  @override
  _BottonTelefoneState createState() => _BottonTelefoneState();
}

class _BottonTelefoneState extends State<BottonTelefone> {
  



  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap: widget.onPressed,
    child: Container(
    margin: EdgeInsets.only(top: 20),
    //alignment: Alignment.center,   
    height: 100,    
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(5),
              height: 80,     
              width: MediaQuery.of(context).size.width*.9,            
              decoration: BoxDecoration(   
                color: Colors.white,  
                           
                borderRadius: BorderRadius.circular(50), 
                border: Border.all(
                  color: cor_base, 
                  width: 3
                )
              ),

              child: Align(
                alignment: Alignment(0.1, 0),
                child: Text(widget.titulo, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: cor_base),),
              ),

            ), 


            Container(
              height: 100,
              width: 100,            
              decoration: BoxDecoration(                
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: cor_base, 
                  width: 3, 
                  
                )
              ),
              child: Icon(Icons.phone, size: 50,color: cor_base,),
            ),
          ],
        ),




      ],
    ),
    
    ),
    );
  }
}
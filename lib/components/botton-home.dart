import 'package:flutter/material.dart';
import 'package:smccovid/constants/constants.dart';

class BottonHome extends StatelessWidget {
  final icon;
  final titulo;
  final onPressed;
  const BottonHome({Key key, this.icon, this.titulo, this.onPressed}) : super(key: key);
 


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 100,
      decoration: BoxDecoration(
        color: cor_base, 
        borderRadius: BorderRadius.circular(15),

      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: MaterialButton(
        onPressed:onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon, 
            titulo,           
            Container()


          ],
        ),
      ),
      ),
      
    );
  }
}
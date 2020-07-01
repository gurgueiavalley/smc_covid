import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smccovid/components/custom-botton.dart';
import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/screens/sign_in.dart';
import 'package:smccovid/components/dados_nacionais.dart';
import 'package:smccovid/components/dados_regionais.dart';


class TelaEstatistica extends StatefulWidget {
  @override
  _TelaEstatisticaState createState() => _TelaEstatisticaState();
}

class _TelaEstatisticaState extends State<TelaEstatistica> {

  
  int _current = 0;
  List imgList = [
    Nacional(),
    Regional(),
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Stack(
        children: [
          Container(
            color: cor_base,
            height: MediaQuery.of(context).size.width/2.5,
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Estatisticas', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Colors.white),),
                    CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                    )
                  ],
                ),

                Center(
                  child: Container(                   
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.width/30),               
                    height: MediaQuery.of(context).size.width/2.5,
                    width: MediaQuery.of(context).size.width/2.5,
                    decoration: BoxDecoration(
                      color: cor_base, 
                      shape: BoxShape.circle                      
                    ),

                    child: Container( 
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(5),  
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      shape: BoxShape.circle                      
                    ),
                    //child: Image.asset('assets/ifpi.png',),
   
                  ),

                  ),
                ),
      
              ],
          ),
          
            ),
          ) , 
    
        Container(padding: EdgeInsets.only(top: 250, left: 0, right: 0),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            CarouselSlider(
              items: imgList.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 1.0),
                      
                      child: imgUrl,
                    );
                  },
                );
              }).toList(), 
              options: 
              CarouselOptions(  
              height: 360.0,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: false,
              reverse: false,
              enableInfiniteScroll: false,
             autoPlayInterval: Duration(seconds: 2),
             // autoPlayAnimationDuration: Duration(milliseconds: 2000),
              //pauseAutoPlayOnTouch: Duration(seconds: 10),
              scrollDirection: Axis.horizontal,
        
            ),
            
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                   color: _current == index ? Colors.grey : cor_base,
                  ),
                );
              }),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
         ), 
        )
        
        ],
      ),
      )

      
    );
  }
 
}
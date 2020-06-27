import 'package:flutter/material.dart';
import 'package:smccovid/components/botton-telefone.dart';
import 'package:smccovid/constants/constants.dart';

class Tela_Central extends StatefulWidget {
  @override
  _Tela_CentralState createState() => _Tela_CentralState();
}

class _Tela_CentralState extends State<Tela_Central> {
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
                    Text('Central', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Colors.white),),
                    CircleAvatar(
                      backgroundImage: NetworkImage('https://f.i.uol.com.br/fotografia/2019/07/31/15645726645d417bf8a4451_1564572664_1x1_md.jpg'),
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
                    child: Image.asset('assets/12.png',),


                    

                  ),

                  



                    

                  ),
                ), 
                SizedBox(height: 50,),

                BottonTelefone(
                  titulo: 'SECRETARIA DE SAUDE',
                  onPressed: (){
                    
                  },
                ), 
                BottonTelefone(
                  titulo: 'HOSPITAL',
                  onPressed: (){

                  },
                ), 
                BottonTelefone(
                  titulo: 'PRONTO SOCORRO',
                  onPressed: (){

                  },
                ), 

                



              ],
          ),
            ),
          )  
        

        ],
      ),
      )


      
    );
  }
}
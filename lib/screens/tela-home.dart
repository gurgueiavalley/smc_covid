import 'package:flutter/material.dart';
import 'package:smccovid/components/botton-home.dart';
import 'package:smccovid/components/sintomas.dart';
import 'package:smccovid/constants/constants.dart';

class Tela_Home extends StatefulWidget {
  @override
  _Tela_HomeState createState() => _Tela_HomeState();
}

class _Tela_HomeState extends State<Tela_Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      children: [
        Stack(
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
                        Text('Olá,', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Colors.white),),
                        CircleAvatar(
                          backgroundImage: NetworkImage('https://f.i.uol.com.br/fotografia/2019/07/31/15645726645d417bf8a4451_1564572664_1x1_md.jpg'),
                        )
                      ],
                    ),

                    Container(                   
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.width/15),               
                      height: MediaQuery.of(context).size.width/2.5,
                      decoration: BoxDecoration(
                        color: Colors.white, 
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10
                          )
                        ]
                      ),





                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.account_circle, size: 100,color: Colors.red,), 
                                Text('Nível 03', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),)
                                
                              ],
                            ), 
                            
                            Container(
                              width: MediaQuery.of(context).size.width/1.6,   
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(        
                                                           
                                    child: Text('Você tem uma grande possibilidade de está com a COVID 19', style: TextStyle(color: Colors.red),)
                                  ), 

                                  Divider(color: Colors.black,), 

                                  Text('Procure um Hospital mais próximos.', style: TextStyle(color: cor_base),),

                                  SizedBox(height: 10,),


                                  Container(
                                    alignment: Alignment.bottomRight,
                                    width: MediaQuery.of(context).size.width/1.5,  
                                    height: 50,
                                   
                                    child: RaisedButton(
                                      child: Text('Refaça o teste', style: TextStyle(color: Colors.white),),
                                      onPressed: (){},
                                      color: cor_base,
                                    ),
                                  )

                                 
                                  

                                 
                                  
                                ],
                              ),
                            ), 

                            


                          ],
                        ),
                      ),


                    ), 

                    
                    



                  ],
              ),
                ),
              )  
            

            ],
          ),


          Container(
            //color: Colors.red,
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CardSintomas(
                  img: 'assets/1.png',
                  titulo: 'Calafrio',
                ),

                CardSintomas(
                  img: 'assets/4.png',
                  titulo: 'Tosse',
                ),

                CardSintomas(
                  img: 'assets/5.png',
                  titulo: 'Febre',
                ),

                CardSintomas(
                  img: 'assets/6.png',
                  titulo: 'Tosse',
                ),

                CardSintomas(
                  img: 'assets/10.png',
                  titulo: 'Diarreia',
                ),
                

              ],
            ),
          ), 


          Column(
            children: [

              BottonHome(
                icon:  Icon(Icons.assignment, size: 40,color: Colors.white,),
                titulo: Text('Prevenção', style: TextStyle(fontSize: 30, color: Colors.white),),
                onPressed: (){
                  
                },
              ),
              BottonHome(
                icon:  Icon(Icons.info, size: 40,color: Colors.white,),
                titulo: Text('Informações', style: TextStyle(fontSize: 30, color: Colors.white),),
                onPressed: (){
                  
                },
              ),
              BottonHome(
                icon:  Icon(Icons.multiline_chart, size: 40,color: Colors.white,),
                titulo: Text('Estastística', style: TextStyle(fontSize: 30, color: Colors.white),),
                onPressed: (){
                  
                },
              ),

              SizedBox(height: 50,)


            ],
          )




      ],
    ),
    );
  }
}
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smccovid/components/apresentacao.dart';
import 'package:smccovid/constants/constants.dart';

import '../models/contactchecklist.dart';
import '../models/contactchecklist.dart';
import 'tela-selecao-instituicao.dart';


class Tela_Apresentacao extends StatefulWidget {
  @override
  _Tela_ApresentacaoState createState() => _Tela_ApresentacaoState();
}

class _Tela_ApresentacaoState extends State<Tela_Apresentacao> {
  PageController _pageController = PageController();
  double _dots = 0;



  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (x){
          if (x.velocity.pixelsPerSecond.dx>0 && _pageController.page<5) {
            print('voltar');            
            setState(() {
              _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.linear);
              
            });
            
          }else{
            print('Frente');            
            setState(() {
            _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear);
              
            });
          }          

        },
        
        child: Stack(
        children: [
          PageView(
            controller: _pageController,
            allowImplicitScrolling: true,
            children: [
              CardApresentacao(
                img: Image.asset('assets/p1.png', width: MediaQuery.of(context).size.width * 0.3,),
                textoL: 'Descubra o nível de exposição que você teve com pessoas infectadas.',
                textoR: 'Descubra o nível de exposição que você teve com pessoas infectadas.',
              ),
              CardApresentacao(
                img: Image.asset('assets/p2.png', width: 200,),
                textoL: 'Veja o histórico dos locais \nque você pretende \nir visitar',),
              CardApresentacao(
                img: Image.asset('assets/p3.png', width: 200,),
                textoL: 'Crie e gerencie alertas para monitorar o risco dos \nlugares que você \nprecisa ir.',
              ),

              CardApresentacao(
                img: Image.asset('assets/p4.png', width: 200,),
                textoL: 'Seja notificado se perto existe algum caso confirmado \nde contaminação pelo coronavírus',),

              CardApresentacao(
                img: Image.asset('assets/p5.png', width: 200,),
                textoL: 'É possível acompanhar e cadastrar as aglomerações \nem tempo real pelo \nnosso site através \ndo mapa',
              ),

            
            ],

            onPageChanged: (x){
              setState(() {
                _dots = x.toDouble();
               
              });

            },

          ),

          Align(
                alignment: Alignment(-30,2.3),               
                child: Container(
                  height: 382,
                  width: 382,
                  decoration: BoxDecoration(
                    color: cor_base,
                    shape: BoxShape.circle
                  ),

                  child: Stack(
                    children: [

                      Align(
                        alignment: Alignment(0.25,-0.7),
                        child: DotsIndicator(
                        dotsCount: 5,
                        position: _dots,
                        decorator: DotsDecorator(
                          activeColor: Colors.white,
                          size: const Size.square(9.0),
                          activeSize: const Size(18.0, 9.0),
                          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                      )



                    ],
                  ),



                ),
          ),


          Align(
                alignment: Alignment(0.9,0.98),               
                child: OutlineButton.icon(

                  icon: Icon(Icons.arrow_forward, color: Colors.grey,),
                  onPressed: (){
                    ContactCheckList check = ContactCheckList();
                    check.initDb();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TelaSelecaoInstituicao()));
                  },                  
                  label: Text('Pular', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
                  borderSide: BorderSide(
                    color: Colors.grey[300]
                  ),
                )
          ),





        ],
      ),
      )

      



      
    );
  }
}
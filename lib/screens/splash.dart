import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/screens/tela-login.dart';


class Tela_Splash extends StatefulWidget {
  @override
  _Tela_SplashState createState() => _Tela_SplashState();
}

class _Tela_SplashState extends State<Tela_Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cor_base,

      body: FutureBuilder<LocationData>(
        future: Location().getLocation(),
        builder: (_, d){
          if (d.hasData) {         
            print(d.data.latitude);               
            return FutureBuilder<List<Placemark>>(    
              future: Geolocator().placemarkFromCoordinates(d.data.latitude, d.data.longitude),
              builder: (_, d){
                if (d.hasData) {                 
                  dados_localizacao = d.data.elementAt(0).toJson();

                  return Tela_Login();                  
                } else {
                  return Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Estamos quase pronto...', style: TextStyle(color: Colors.white),),
                    SizedBox(height: 30,),
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ],
                ));
                }
                
              },
            );

            
          } else {
            return Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Buscando sua localização', style: TextStyle(color: Colors.white),),
                SizedBox(height: 30,),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ],
            ));
          }
        },
      ),

      




      
    );
  }
}
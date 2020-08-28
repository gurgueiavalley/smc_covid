import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/models/contactchecklist.dart';
import 'package:smccovid/screens/sign_in.dart';
import 'package:smccovid/screens/tela-login.dart';
import 'package:smccovid/screens/tela_apresentacao.dart';
import 'package:smccovid/screens/verificar-login.dart';

import 'tela-login.dart';

class Tela_Splash extends StatefulWidget {
  @override
  _Tela_SplashState createState() => _Tela_SplashState();
}

class _Tela_SplashState extends State<Tela_Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cor_base,
      //carregando dados de localização do usuario
      body: FutureBuilder<LocationData>(
        future: Location().getLocation(),
        builder: (_, d) {
          if (d.hasData) {
            print(d.data.latitude);
            return FutureBuilder<List<Placemark>>(
              future: Geolocator().placemarkFromCoordinates(
                d.data.latitude,
                d.data.longitude,
              ),
              builder: (_, d) {
                if (d.hasData) {
                  dados_localizacao = d.data.elementAt(0).toJson();
                  return FutureBuilder(
                    future: verificarPrimeiroAcesso(),
                    builder: (_, d) {
                      if (d.data == true) {
                        return Tela_Login(
                          idInstitucao: null,
                        );
                      } else {
                        return Tela_Apresentacao();
                      }
                    },
                  );
                } else {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Estamos quase prontos...',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ],
                  ));
                }
              },
            );
          } else {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Buscando sua localização',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 30,
                ),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/screens/tela_apresentacao.dart';

import 'screens/splash.dart';
import 'screens/tela-login.dart';

main(List<String> args) {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(systemNavigationBarColor: cor_base));

  runApp(MaterialApp(
    //home: Tela_Apresentacao(),
    //home: Tela_Login(),
    home: Tela_Splash(),
    debugShowCheckedModeBanner: false,
  ));
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/screens/home.dart';
import 'package:smccovid/screens/splash.dart';
import 'package:smccovid/screens/tela-login.dart';
import 'package:smccovid/screens/tela_login.dart';
import 'package:smccovid/screens/test.dart';

import 'screens/tela-home.dart';
import 'screens/tela-questionario.dart';

main(List<String> args) {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(systemNavigationBarColor: cor_base));

  runApp(MaterialApp(
    //home: Tela_Splash(),
    home: Tela_Login(),
    debugShowCheckedModeBanner: false,
  ));
}

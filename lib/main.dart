import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smccovid/constants/constants.dart';

import 'screens/splash.dart';

main(List<String> args) {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(systemNavigationBarColor: cor_base));

  runApp(MaterialApp(
    //home: Tela_Apresentacao(),
    //home: Tela_Login(),
    home: Tela_Splash(),
    // home: test(),
    debugShowCheckedModeBanner: false,
  ));
}

/*
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: _launchURL,
          child: Text('open'),
        ),
      ),
    ),
  ));
}

_launchURL() async {
  const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
*/

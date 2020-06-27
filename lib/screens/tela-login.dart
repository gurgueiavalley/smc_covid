import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:smccovid/components/custom-botton.dart';
import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/screens/tela-map.dart';
import 'sign_in.dart';

class Tela_Login extends StatefulWidget {
  @override
  _Tela_LoginState createState() => _Tela_LoginState();
}

class _Tela_LoginState extends State<Tela_Login> {
  bool _press = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cor_base,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          Container(
            width: MediaQuery.of(context).size.width / 2.5,
            height: MediaQuery.of(context).size.width / 2.5,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                'assets/logo.png',
              ),
            ),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          ),
          SizedBox(
            height: 70,
          ),
          CustomButton(
            icon: Icon(
              MaterialCommunityIcons.gmail,
              color: cor_base,
              size: 35,
            ),
            title: Text(
              'GMAIL',
              style: TextStyle(
                  color: cor_base, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              signInWithGoogle().whenComplete(() {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return TelaMapa();
                    },
                  ),
                );
              });
            },
          ),
          SizedBox(
            height: 30,
          ),
          CustomButton(
            icon: Icon(
              MaterialCommunityIcons.facebook,
              color: cor_base,
              size: 35,
            ),
            title: Text(
              'FACEBOOK',
              style: TextStyle(
                  color: cor_base, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            onPressed: _press
                ? () {
                    print('pressionado');
                    _press = false;
                    setState(() {});
                  }
                : null,
          ),
          Expanded(child: Container()),
          Text(
            'By ADS V',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

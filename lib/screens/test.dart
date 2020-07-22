import 'package:flutter/material.dart';
import 'package:smccovid/screens/sign_in.dart';
import 'package:smccovid/screens/verificar-login.dart';

import '../models/contactchecklist.dart';
import '../models/contactchecklist.dart';

class test extends StatefulWidget {
  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ContactCheckList c = ContactCheckList();
    c.deleteContact(1);
  
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

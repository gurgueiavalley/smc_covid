import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/screens/tela-central.dart';
import 'package:smccovid/screens/tela-home.dart';
import 'package:smccovid/screens/tela-infor.dart';
import 'package:smccovid/screens/tela-menu-mapas.dart';

import '../constants/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PersistentTabController _controller;

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      items: _navBarsItems(),
      screens: _buildScreens(),
      handleAndroidBackButtonPress: true,
      iconSize: 26.0,
      popAllScreensOnTapOfSelectedTab: true,
      onItemSelected: (index) {
        print(index);
      },
    );
  }

  List<Widget> _buildScreens() {
    return [Tela_Home(), Tela_Central(), MenuMapas(), TelaInformacao()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColor: cor_base,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.lightbulb_outline),
        title: ("Central"),
        activeColor: cor_base,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.map),
        title: ("Mapa"),
        activeColor: cor_base,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.info),
        title: ("Infor."),
        activeColor: cor_base,
      ),
    ];
  }
}

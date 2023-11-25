
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarItems {
  AppBarItems();
  static const Map<String, Widget> appBarIcons = {
    'Inicio': Icon(FontAwesomeIcons.house, size: 150,),
    'Transferencia': Icon(Icons.swap_vert, size: 150,),
    'Cuenta': Icon(FontAwesomeIcons.person, size: 150,)
  };
}

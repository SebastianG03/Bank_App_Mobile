
import 'package:flutter/material.dart';

class BottomNavigationBarItemModel {

  static BottomNavigationBarItem buildBarItem(BuildContext context, IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
class BottomNavigationBarItemModel1 extends StatelessWidget {

  BottomNavigationBarItemModel1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
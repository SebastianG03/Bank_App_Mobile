import 'package:bank_app_mobile/theme.dart';
import 'package:flutter/material.dart';

import '../../model/models.dart';
import 'package:bank_app_mobile/views/views_user.dart';
import 'package:bank_app_mobile/utils/app_bar_items.dart';

class HomeScreen extends StatefulWidget {
  BankAccount bankAccount;
  User user;

  HomeScreen({super.key, required this.user, required this.bankAccount});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            EstadosCuenta(user: widget.user, bankAccount: widget.bankAccount),
            TransferenciasView(user: widget.user, bankAccount: widget.bankAccount),
            CuentaUsuarioView(user: widget.user, bankAccount: widget.bankAccount),
          ],
        ),
        bottomNavigationBar: bottomBar(context),
    );
  }



  Widget bottomBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.shifting,
      selectedItemColor: CustomTheme.selected,
      iconSize: 40,
      onTap: (value) => setState(() => _selectedIndex = value),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: AppBarItems.appBarIcons['Inicio']!,
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: AppBarItems.appBarIcons['Transferencia']!,
          label: 'Transferencias',
        ),
        BottomNavigationBarItem(
          icon: AppBarItems.appBarIcons['Cuenta']!,
          label: 'Cuenta',
        ),
      ],
    );
  }
}



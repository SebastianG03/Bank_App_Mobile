import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/theme/theme.dart';
import '../utils/utils.dart';
import '../views/views_user.dart';

class CustomBottomBar extends StatelessWidget {
  final int idUser;
  const CustomBottomBar({super.key, required this.idUser});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: CustomTheme.selected,
      backgroundColor: CustomTheme.appBar,
      currentIndex: getCurrentIndex(context),
      iconSize: 40,
      elevation: 1,
      onTap: (index) => _onItemTapped(context, index),
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

  void _onItemTapped(BuildContext context, int index) {
    switch(index) {
      case 0:
        context.goNamed(CuentaUsuarioView.name, pathParameters: {'idUser': idUser.toString()});
        break;
      case 1:
        context.goNamed(TransferenciasView.name, pathParameters: {'idUser': idUser.toString()});
        break;
      case 2:
        context.goNamed(CuentaUsuarioView.name, pathParameters: {'idUser': idUser.toString()});
        break;
    }
  }

  int getCurrentIndex(BuildContext context) {
    final String? router = GoRouterState.of(context).name;

    if (router == CuentaUsuarioView.name) {
      return 0;
    } else if (router == TransferenciasView.name) {
      return 1;
    } else if (router == CuentaUsuarioView.name) {
      return 2;
    } else {
      return 0;
    }
  }
}

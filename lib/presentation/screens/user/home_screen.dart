import 'package:bank_app_mobile/config/theme/theme.dart';
import 'package:bank_app_mobile/presentation/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../model/models.dart';
import '../../views/views_user.dart';


class HomeScreen extends StatefulWidget {
  late BankAccount bankAccount;
  late User user;
  static const name = 'home';

  HomeScreen({super.key, required int idUser}) {
    user = Util().users.firstWhere((element) => element.idUser == idUser);
    bankAccount = Util().bankAccounts.firstWhere((element) => element.idUser == idUser);
  }


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            EstadosCuenta(idUser: widget.user.idUser!),
            TransferenciasView(idUser: widget.user.idUser!),
            CuentaUsuarioView(idUser: widget.user.idUser!),
          ],
        ),
        bottomNavigationBar: _bottomBar(context),
      ),
    );
  }



  Widget _bottomBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: CustomTheme.selected,
      backgroundColor: CustomTheme.appBar,
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
import 'package:flutter/material.dart';

import '../../model/models.dart';
import '../../utils/utils.dart';

class CuentaUsuarioView extends StatelessWidget {

  late final BankAccount bankAccount;
  late final User user;
  List<String> option = ["Modificar Cuenta", "Eliminar Cuenta", "Cerrar Sesión "];
  static const name = 'Cuenta de usuario';

  CuentaUsuarioView({super.key, required int idUser}) {
    user = Util().users.firstWhere((element) => element.idUser == idUser);
    bankAccount = Util().bankAccounts.firstWhere((element) => element.idUser == user.idUser);
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 10, right: 10),
        scrollDirection: Axis.vertical,
        separatorBuilder: (_, __) => const Divider(),
        itemCount: option.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(option[i], style: const TextStyle(fontSize: 18),),
          trailing: const Icon(Icons.arrow_forward_ios_outlined),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../../model/models.dart';

class CuentaUsuarioView extends StatelessWidget {

  BankAccount bankAccount;
  User user;
  List<String> option = ["Modificar Cuenta", "Eliminar Cuenta", "Informacion "];

  CuentaUsuarioView({super.key, required this.user, required this.bankAccount});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        separatorBuilder: (_, __) => const Divider(),
        itemCount: option.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(option[i], style: const TextStyle(fontSize: 20),),
        ),
      ),
    );
  }
}
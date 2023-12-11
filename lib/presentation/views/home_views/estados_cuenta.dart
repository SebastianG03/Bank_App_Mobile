import 'package:flutter/material.dart';
import 'package:bank_app_mobile/infrastructure/model/models.dart' show BankAccount, User;
import 'package:bank_app_mobile/infrastructure/utils/utils.dart' show Util;
import '../../widgets/widgets.dart' show BAccountCardModel;

class EstadosCuenta extends StatelessWidget {
  late User user;
  late BankAccount bankAccount;
  static const name = 'Estados de cuenta';

  EstadosCuenta({super.key, required int idUser}) {
    user = Util().users.firstWhere((element) => element.idUser == idUser);
    bankAccount = Util().bankAccounts.firstWhere((element) => element.idUser == user.idUser);
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 150,
      width: 400,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: BAccountCardModel(bankAccount: bankAccount, user: user),
      ),
    );
  }
}



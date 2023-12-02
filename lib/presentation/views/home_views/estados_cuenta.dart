import 'package:flutter/material.dart';
import '../../model/models.dart';
import '../../utils/utils.dart';
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
      height: 100,
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BAccountCardModel(bankAccount: bankAccount, user: user).buildCardModel(context),
      ),
    );
  }
}



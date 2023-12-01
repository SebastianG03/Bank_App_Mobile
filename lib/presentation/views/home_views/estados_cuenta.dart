import 'package:flutter/material.dart';
import 'package:bank_app_mobile/screens/user/historial_transferencias_screen.dart';
import 'package:go_router/go_router.dart';

import '../../../../model/models.dart';
import '../../utils/utils.dart';

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
        child: _CardModel(bankAccount: bankAccount, user: user).buildCardModel(context),
      ),
    );
  }
}

class _CardModel {
  BankAccount bankAccount;
  User user;

  _CardModel({required this.bankAccount, required this.user});

  Widget buildCardModel(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GestureDetector(
        onTap: () => context.pushNamed(HistorialTransferencias.name,
            pathParameters: {'idAccount': '${bankAccount.idAccount}'}),
        child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Cuenta de ahorro',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '${bankAccount.accountNumber}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Container(width: MediaQuery.of(context).size.width * 0.05,),
              Text(
                'USD ' '${bankAccount.accountAmount}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



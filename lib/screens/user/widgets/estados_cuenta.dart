import 'package:flutter/material.dart';
import 'package:bank_app_mobile/screens/user/historial_transferencias_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../model/models.dart';

class EstadosCuenta extends StatelessWidget {
  User user;
  BankAccount bankAccount;
  EstadosCuenta({super.key, required this.user, required this.bankAccount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CardModel(bankAccount: bankAccount).buildCardModel(context),
    );
  }
}

class CardModel {
  BankAccount bankAccount;

  CardModel({required this.bankAccount});

  Widget buildCardModel(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HistorialTransferencias())),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Container(width: 100,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${bankAccount.accountAmount}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



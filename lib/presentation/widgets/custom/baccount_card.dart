
import 'package:bank_app_mobile/infrastructure/model/models.dart' show User, BankAccount;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screens/screens.dart';

class BAccountCardModel extends StatelessWidget {
  BankAccount bankAccount;
  User user;

  BAccountCardModel({super.key, required this.bankAccount, required this.user});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GestureDetector(
        onTap: () => context.pushNamed(HistorialTransferencias.name,
            pathParameters: {'idBankAccount': bankAccount.idAccount.toString()}),
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

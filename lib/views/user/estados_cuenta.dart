import 'package:flutter/material.dart';
import 'package:bank_app_mobile/screens/user/historial_transferencias_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../model/models.dart';

class EstadosCuenta extends StatelessWidget {
  User user;
  BankAccount bankAccount;
  EstadosCuenta({super.key, required this.user, required this.bankAccount});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 100,
      width: 400,
      child: CardModel(bankAccount: bankAccount).buildCardModel(context),
    );
  }
}

class CardModel {
  BankAccount bankAccount;

  CardModel({required this.bankAccount});

  Widget buildCardModel(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HistorialTransferencias())),
        child: Card(
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



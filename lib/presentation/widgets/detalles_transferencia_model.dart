import 'package:flutter/material.dart';

import '../../config/theme/theme.dart';
import '../model/models.dart';

class DetallesTransferencia {

  static void detallesTransferencia({required BuildContext context, required Transferencia transferencia}) {

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(12.0), ),
        titlePadding: const EdgeInsets.all(15),
        actionsPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),

        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(transferencia.amount.toString(), textAlign: TextAlign.center,),
            const SizedBox(width: 20,),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Icon(
                Icons.account_balance,
                color: CustomTheme.alertButtonText,
                size: 20,
              ),
            )
          ],
        ),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transferencia.dateIssue.toString(),
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 14,
                  fontFamily: 'WorkSansMedium',
                ),
              ),
              const SizedBox(height: 30,),
              Text(
                transferencia.idAccountReceiver.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'WorkSansMedium',
                ),
              ),
            ],
          ),
        ),

        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cerrar',
                style: TextStyle(
                  color: CustomTheme.alertButtonText,
                  fontSize: 18,
                  fontFamily: 'WorkSansSemiBold',
                ),
              )
          ),
        ],
      ),
    );
  }
}
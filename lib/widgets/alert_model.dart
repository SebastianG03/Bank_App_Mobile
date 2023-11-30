import 'package:bank_app_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Alerts {

  static void androidAlertDialog({required BuildContext context, required String title,
    required String message}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(12.0), ),
        titlePadding: const EdgeInsets.all(15),
        actionsPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, textAlign: TextAlign.center,),
            const SizedBox(width: 20,),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Icon(
                FontAwesomeIcons.bell,
                color: CustomTheme.alertButtonText,
                size: 20,
              ),
            )
          ],
        ),

        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message),
              const SizedBox( height: 10,),
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
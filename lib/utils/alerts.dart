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
        title: Container(
          color: CustomTheme.alertTitleBackground,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(title, textAlign: TextAlign.center,),
              const Icon(
                FontAwesomeIcons.bell,
                color: Colors.black,
                size: 40,
              ),
            ],
          ),
        ),

        content: Container(
          color: CustomTheme.alertBackground,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(message),
                const SizedBox( height: 10,),
              ],
            ),
          ),
        ),

        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cerrar',
                style: TextStyle(
                  color: CustomTheme.alertButtonText,
                  fontSize: 16,
                  fontFamily: 'WorkSansSemiBold',
                ),
              )
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class CustomSnackBar {

  CustomSnackBar(BuildContext context, Widget content,
  {SnackBarAction? snackBarAction, Color backgroundColor = Colors.green}) {
    final SnackBar snackBar = SnackBar(
      content: content,
      action: snackBarAction,
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
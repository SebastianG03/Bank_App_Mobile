import 'package:flutter/material.dart';

class MaterialButtonModel extends StatelessWidget {

  Color? highlightColor = Colors.transparent;
  Color? splashColor;
  Color? buttonColor;
  int? model;
  String content;
  Color textColor;
  double fontSize = 25.0;
  String? fontFamily = 'WorkSansBold';
  Function onPressed;
  EdgeInsetsGeometry padding;


  MaterialButtonModel({super.key , this.model = 1, this.highlightColor, this.splashColor, this.buttonColor, required this.content,
      required this.textColor, required this.fontSize, this.fontFamily, required this.onPressed, required this.padding});

  @override
  Widget build(BuildContext context) {
    return (model == 1) ? materialButtonModel1(context) : materialButtonModel2(context);
  }

  Widget materialButtonModel1(BuildContext) {
    return MaterialButton(
      highlightColor: highlightColor,
      splashColor: splashColor,
      mouseCursor: SystemMouseCursors.click,
      onPressed: onPressed(),
      child: Padding(
        padding: padding,
        child: Text(
          content,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontFamily: fontFamily,
          ),
        ),
      ),
    );
  }

  Widget materialButtonModel2(BuildContext context) {
    return MaterialButton(
      padding: padding,
      mouseCursor: SystemMouseCursors.click,
      highlightColor: highlightColor,
      splashColor: splashColor,
      color: buttonColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      onPressed: onPressed(),
      child: Text(
        content,
        style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontFamily: fontFamily
        ),
      ),
    );
  }
}
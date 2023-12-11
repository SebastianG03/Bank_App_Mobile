import 'package:flutter/material.dart';

class MaterialButtonModel extends StatelessWidget {

  Color? highlightColor = Colors.transparent;
  final Color? splashColor;
  final Color? buttonColor;
  final int? model;
  final String content;
  final Color textColor;
  double fontSize = 25.0;
  String? fontFamily = 'WorkSansBold';
  final void Function()? onPressed;
  final EdgeInsetsGeometry padding;

  /// [MaterialButtonModel]
  /// cuando el model es 1, el boton debe colocarse dentro de un container para ser visible.
  /// Cuando el model es 2, utiliza un formato común de MaterialButton
  ///
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
      onPressed: () => onPressed!(),
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
      onPressed: () => onPressed!(),
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
import 'package:flutter/material.dart';

class CustomTheme {
  const CustomTheme();

  static const Color loginGradientStart = Color(0xFFfbab66);
  static const Color loginGradientEnd = Color(0xFFf7418c);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color background = Color(0xFFF3F3F3);
  static const Color appBar = Color(0xFF860A35);
  static const Color buttonPrimary = Color(0xFFAF2655);
  static const Color buttonSecondary = Color(0xFFA3B763);
  static const Color selected = Color(0xFFD93668);
  static const Color alertBackground = Color(0x99B2AFAF);
  static const Color alertTitleBackground = Color(0xFFB2AFAF);
  static const Color alertButtonText = Color(0xFF374472);
  static const Color outlineBorderPrimary = Color(0xFF0DC3E8);


  static const LinearGradient primaryGradient = LinearGradient(
    colors: <Color>[loginGradientStart, loginGradientEnd],
    stops: <double>[0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static BoxDecoration loginPageBtnContainerDecoration = const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    boxShadow: <BoxShadow> [
      BoxShadow(
        color: CustomTheme.loginGradientStart,
        offset: Offset(1.0, 6.0),
        blurRadius: 20.0,
      ),
      BoxShadow(
        color: CustomTheme.loginGradientEnd,
        offset: Offset(1.0, 6.0),
        blurRadius: 20.0,
      ),
    ],
    gradient: LinearGradient(
        colors: <Color> [
          CustomTheme.loginGradientEnd,
          CustomTheme.loginGradientStart
        ],
        begin: FractionalOffset(0.2, 0.2),
        end: FractionalOffset(1.0, 1.0),
        stops: <double>[0.0, 1.0],
        tileMode: TileMode.clamp
    ),
  );

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: outlineBorderPrimary),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0)
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0)
        ),
      )
    )
  );

}

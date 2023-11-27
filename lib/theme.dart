import 'dart:ui';

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


  static const LinearGradient primaryGradient = LinearGradient(
    colors: <Color>[loginGradientStart, loginGradientEnd],
    stops: <double>[0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

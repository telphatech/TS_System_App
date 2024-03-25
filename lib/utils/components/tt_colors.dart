import 'package:flutter/material.dart';

class TTColors {
  TTColors._();

  //******************  BASIC COLORS ******************
  static const Color primary = Color.fromRGBO(157, 37, 116, 1);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFF4b68ff);
  static const Color success = Color(0xFF4CAF50);
  static const Color danger = Color(0xFFD32F2F);
  static const Color warning = Color(0xFFFF9800);
  static const Color star = Colors.amber;
  static const Color grey = Colors.grey;
  static const Color green = Colors.green;
  static const Color orange = Colors.orange;

  //******************  TEXT COLORS ******************
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C7570);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static Color white01 = Colors.white.withOpacity(0.1);
  static const Color transparent = Colors.transparent;

  //******************  BACKGROUND COLORS ******************
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  /// BACKGROUND CONTAINER COLORS
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = Colors.white.withOpacity(0.1);

  /// BUTTON COLORS
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6c7570);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  /// BORDER COLORS
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);
}

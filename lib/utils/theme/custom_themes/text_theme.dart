import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class MTextTheme {
  MTextTheme._();

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(
        fontSize: 32, fontWeight: FontWeight.bold, color: TTColors.black),
    headlineMedium: GoogleFonts.poppins(
        fontSize: 24, fontWeight: FontWeight.w600, color: TTColors.black),
    headlineSmall: GoogleFonts.poppins(
        fontSize: 24, fontWeight: FontWeight.w400, color: TTColors.black),
    titleLarge: GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.w600, color: TTColors.black),
    titleMedium: GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.bold, color: TTColors.black),
    titleSmall: GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.w400, color: TTColors.black),
    bodyLarge: GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.w600, color: TTColors.black),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.bold, color: TTColors.black),
    bodySmall: GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.w600, color: TTColors.black),
    labelLarge: GoogleFonts.poppins(
        fontSize: 12, fontWeight: FontWeight.normal, color: TTColors.black),
    labelMedium: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: TTColors.black.withOpacity(0.5)),
  );
}

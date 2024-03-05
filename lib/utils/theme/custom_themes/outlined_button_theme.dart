import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class MOutlinedButtonTheme {
  MOutlinedButtonTheme._();

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: TTColors.white,
      side: const BorderSide(color: TTColors.primary),
      textStyle: GoogleFonts.poppins(
          fontSize: 16, color: TTColors.white, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class MElevatedButtonTheme {
  MElevatedButtonTheme._();

  /// Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: TTColors.white,
        backgroundColor: TTColors.primary,
        disabledForegroundColor: TTColors.grey,
        disabledBackgroundColor: Colors.grey,
        side: const BorderSide(color: TTColors.primary),
        padding: const EdgeInsets.all(10),
        textStyle: GoogleFonts.poppins(
            fontSize: 16, color: TTColors.white, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
  );
}

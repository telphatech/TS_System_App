import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class MTextFormFieldTheme {
  MTextFormFieldTheme._();

  /// DARK THEME
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: TTColors.black,
    suffixIconColor: TTColors.black,
    labelStyle: GoogleFonts.poppins(fontSize: 14, color: TTColors.black),
    hintStyle: GoogleFonts.poppins(fontSize: 14, color: TTColors.black),
    floatingLabelStyle:
        GoogleFonts.poppins(color: TTColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: TTColors.black),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: TTColors.black),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: TTColors.black),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: TTColors.danger),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2, color: TTColors.orange),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class MChipTheme {
  MChipTheme._();

  static ChipThemeData darkChipTheme = ChipThemeData(
      disabledColor: TTColors.grey,
      labelStyle: GoogleFonts.poppins(color: TTColors.white),
      selectedColor: TTColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      checkmarkColor: TTColors.white);
}

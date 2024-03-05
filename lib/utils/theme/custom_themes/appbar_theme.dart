import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class MAppBarTheme {
  MAppBarTheme._();

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: TTColors.primary,
    surfaceTintColor: TTColors.primary,
    iconTheme: const IconThemeData(color: TTColors.white, size: 24),
    actionsIconTheme: const IconThemeData(color: TTColors.white, size: 24),
    titleTextStyle: GoogleFonts.poppins(
        fontSize: 18, fontWeight: FontWeight.w600, color: TTColors.white),
  );
}

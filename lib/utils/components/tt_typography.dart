import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class TTypography {
  TTypography._();

  static final TextStyle h1 =
      GoogleFonts.poppins(color: TTColors.primary, fontWeight: FontWeight.bold);

  static final TextStyle normal = GoogleFonts.poppins(fontSize: 16);

  static final TextStyle text14 = GoogleFonts.poppins(fontSize: 14);
  static final TextStyle text20Bold =
      GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold);
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class TTypography {
  TTypography._();

  static final TextStyle h1 =
      GoogleFonts.poppins(color: TTColors.primary, fontWeight: FontWeight.bold);

  static final TextStyle h2 = GoogleFonts.poppins(
      color: TTColors.primary, fontWeight: FontWeight.bold, fontSize: 48);

  static final TextStyle normal = GoogleFonts.poppins(fontSize: 16);

  static final TextStyle text14 = GoogleFonts.poppins(fontSize: 14);

  static final TextStyle text14Color = GoogleFonts.poppins(
    fontSize: 14,
    color: TTColors.white,
  );

  static final TextStyle text14Grey = GoogleFonts.poppins(
    fontSize: 14,
    color: TTColors.textSecondary,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle text16Color = GoogleFonts.poppins(
    fontSize: 16,
    color: TTColors.white,
  );

  static final TextStyle text16Grey = GoogleFonts.poppins(
    fontSize: 16,
    color: const Color.fromARGB(255, 108, 108, 108),
  );

  static final TextStyle text16Black = GoogleFonts.poppins(
    fontSize: 16,
    color: TTColors.black,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle text18Black = GoogleFonts.poppins(
      fontSize: 18, color: TTColors.black, fontWeight: FontWeight.w600);

  static final TextStyle text18Primary = GoogleFonts.poppins(
      fontSize: 18, color: TTColors.primary, fontWeight: FontWeight.w600);

  static final TextStyle text20Bold =
      GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold);

  static final TextStyle text20BoldColor = GoogleFonts.poppins(
      color: TTColors.white, fontSize: 20, fontWeight: FontWeight.bold);

  static final TextStyle text20PrimaryColor = GoogleFonts.poppins(
      color: TTColors.primary, fontSize: 20, fontWeight: FontWeight.bold);

  static final TextStyle text20BlackColor = GoogleFonts.poppins(
      color: TTColors.black, fontSize: 20, fontWeight: FontWeight.w600);

  static final TextStyle text20GreyColor = GoogleFonts.poppins(
      color: TTColors.textSecondary, fontSize: 20, fontWeight: FontWeight.w600);

  static final TextStyle text22Black = GoogleFonts.poppins(
    fontSize: 22,
    color: TTColors.black,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle text30Black = GoogleFonts.poppins(
    fontSize: 30,
    color: TTColors.black,
    fontWeight: FontWeight.w600,
  );
}

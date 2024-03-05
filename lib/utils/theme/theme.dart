import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/theme/custom_themes/appbar_theme.dart';
import 'package:ts_system/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:ts_system/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:ts_system/utils/theme/custom_themes/chip_theme.dart';
import 'package:ts_system/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:ts_system/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:ts_system/utils/theme/custom_themes/text_field_theme.dart';
import 'package:ts_system/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'poppins',
    brightness: Brightness.light,
    primaryColor: TTColors.primary,
    scaffoldBackgroundColor: TTColors.white,
    textTheme: MTextTheme.darkTextTheme,
    elevatedButtonTheme: MElevatedButtonTheme.darkElevatedButtonTheme,
    bottomSheetTheme: MBottomSheetTheme.darkBottomSheetTheme,
    appBarTheme: MAppBarTheme.darkAppBarTheme,
    checkboxTheme: MCheckboxTheme.darkCheckboxTheme,
    chipTheme: MChipTheme.darkChipTheme,
    outlinedButtonTheme: MOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: MTextFormFieldTheme.darkInputDecorationTheme,
  );
}

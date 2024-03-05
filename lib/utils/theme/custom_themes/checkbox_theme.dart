import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class MCheckboxTheme {
  MCheckboxTheme._();

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return TTColors.white;
      } else {
        return TTColors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return TTColors.primary;
      } else {
        return TTColors.white;
      }
    }),
  );
}

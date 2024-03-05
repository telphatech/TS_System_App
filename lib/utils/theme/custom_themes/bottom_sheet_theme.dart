import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class MBottomSheetTheme {
  MBottomSheetTheme._();

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: TTColors.white,
    modalBackgroundColor: TTColors.white,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}

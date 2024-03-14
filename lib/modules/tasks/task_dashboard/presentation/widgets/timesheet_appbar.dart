import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_typography.dart';

class TimesheetAppbar extends StatelessWidget {
  const TimesheetAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: TTColors.white,
      leading: const Icon(TTIcons.arrowback, color: TTColors.black),
      title: Text('Timesheet', style: TTypography.text22Black),
      centerTitle: true,
    );
  }
}

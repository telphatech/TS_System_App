import 'package:flutter/material.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';

class TimesheetAppbar extends StatelessWidget {
  const TimesheetAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: TTColors.primary,
      title: Text('Timesheet',
          style: TTypography.normal.copyWith(color: TTColors.white)),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: AppInputField(
              enabledBorderColor: Colors.grey[100],
              hint: 'Search',
              hintStyle: TextStyle(
                color: Colors.grey[500] ?? Colors.grey,
              ),
              inputBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: TTColors.accent),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              color: TTColors.white,
              leading: const Icon(Icons.search_rounded, color: TTColors.grey),
            ),
          ),
        ),
      ),
    );
  }
}

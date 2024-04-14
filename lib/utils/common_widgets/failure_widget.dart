import 'package:flutter/material.dart';
import 'package:ts_system/utils/common_widgets/alert_style.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_string.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelpers.screenHeight(context) * 0.48,
      child: Scaffold(
        body: InkWell(
          onTap: onTap,
          child: TTAlert.style(
            style: TTAlertStyle.danger,
            title: AppUtils.oopsText,
            message: AppUtils.resourceErrorMessage,
            titleTextStyle: TTypography.normal.copyWith(
              color: TTColors.black,
            ),
          ),
        ),
      ),
    );
  }
}

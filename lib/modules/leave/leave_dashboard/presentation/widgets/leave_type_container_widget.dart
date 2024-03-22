import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class LeaveTypeContainerWidget extends StatelessWidget {
  const LeaveTypeContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 05.0,
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: TTColors.primary),
          color: TTColors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            CircularPercentIndicator(
              percent: 50 / 100,
              circularStrokeCap: CircularStrokeCap.round,
              fillColor: TTColors.transparent,
              animation: true,
              animationDuration: 1000,
              center: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "5",
                      style: TTypography.normal.copyWith(
                        fontWeight: FontWeight.w400,
                        color: TTColors.primary,
                      ),
                    ),
                    TextSpan(
                      text: "/",
                      style: TTypography.normal.copyWith(
                        fontWeight: FontWeight.w400,
                        color: TTColors.primary.withOpacity(0.4),
                      ),
                    ),
                    TextSpan(
                      text: "10",
                      style: TTypography.normal.copyWith(
                        fontWeight: FontWeight.w400,
                        color: TTColors.primary.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
              radius: 40,
              progressColor: TTColors.primary,
              backgroundColor: TTColors.white,
            ),
            UIHelpers.verticalSpaceMedium,
            Expanded(
              child: Text(
                "Sick Leave",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TTypography.text14Color.copyWith(
                  fontWeight: FontWeight.w300,
                  color: TTColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

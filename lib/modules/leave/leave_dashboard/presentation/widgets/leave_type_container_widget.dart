import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class LeaveTypeContainerWidget extends StatelessWidget {
  final String? leaveType;
  final num? available;
  final num? total;
  const LeaveTypeContainerWidget({
    super.key,
    required this.leaveType,
    required this.available,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    double percentage = double.parse("$available") / double.parse("$total");
    print(available);
    print(total);
    print(percentage);
    if (percentage <= 0.0 ||
        percentage > 1.0 ||
        double.parse("${total ?? 0}") <= 0) {
      percentage = 0.0;
    }
    return Card(
      elevation: 05.0,
      child: Container(
        width: 130,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: TTColors.darkContainer,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            CircularPercentIndicator(
              percent: percentage,
              circularStrokeCap: CircularStrokeCap.round,
              fillColor: TTColors.transparent,
              animation: true,
              animationDuration: 1000,
              center: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: available.toString(),
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
                      text: total.toString(),
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
                leaveType ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TTypography.normal.copyWith(
                  fontWeight: FontWeight.w300,
                  color: TTColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String leaveName(String type) {
    if (type == "casual") {
      return "Casual";
    } else if (type == "sick") {
      return "Sick";
    } else if (type == "unleave") {
      return "Earned";
    }
    return '';
  }
}

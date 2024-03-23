import 'package:flutter/material.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/views/leave_dashboard_mobile_view.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class LeavesTileWidget extends StatelessWidget {
  const LeavesTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
      padding: const EdgeInsets.fromLTRB(12, 11, 07, 12),
      decoration: BoxDecoration(
        color: TTColors.white,
        border: Border.all(
          width: 1,
          color: const Color.fromRGBO(174, 174, 174, 0.3),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.bodyBold("Casual Leave"),
              UIHelpers.verticalSpaceTiny,
              AppText.bodyBold("12 Feb 2023 to 14 Feb 2023"),
            ],
          ),
          Container(
            width: 120,
            height: 40,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: getStatusColor("Approved"),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Approved",
                style: TTypography.normal.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: getTextStatusColor("Approved"),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

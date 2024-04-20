import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/entities/fetch_leave_attributes.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/widgets/configuration_text_status.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class ApplicationListWidget extends StatelessWidget {
  final FetchLeaveAttributesItems? fetchLeavesAttributesItems;
  const ApplicationListWidget({
    required this.fetchLeavesAttributesItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int calculateTotalDays(DateTime fromDate, DateTime toDate) {
      final difference = toDate.difference(fromDate).inDays;
      return max(1, difference + 1);
    }

    final fromDay = DateFormat('dd')
        .format(fetchLeavesAttributesItems?.leaveFrom ?? DateTime.now());
    final toDay = DateFormat('dd')
        .format(fetchLeavesAttributesItems?.leaveTo ?? DateTime.now());
    final fromMonth = DateFormat('MMM')
        .format(fetchLeavesAttributesItems?.leaveFrom ?? DateTime.now());
    return InkWell(
      onTap: () {
        serviceLocator<AppRouter>().popAndPush(LeaveDetailsMobileView(
            uId: fetchLeavesAttributesItems?.leaveId ?? ""));
      },
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Icon(
                  Icons.calendar_month_rounded,
                  size: UIHelpers.screenWidth(context) * 0.10,
                  color: TTColors.primary,
                ),
                UIHelpers.verticalSpaceTiny,
                Text(
                  fetchLeavesAttributesItems?.leaveType ?? "",
                  style: TTypography.normal.copyWith(
                    fontWeight: FontWeight.w300,
                    color: TTColors.primary,
                    fontSize: UIHelpers.screenWidth(context) * 0.03,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            UIHelpers.horizontalSpaceRegular,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: UIHelpers.screenWidth(context) * 0.30,
                    child: Text(
                      "$fromDay - $toDay $fromMonth\n${calculateTotalDays(fetchLeavesAttributesItems?.leaveFrom ?? DateTime.now(), fetchLeavesAttributesItems?.leaveTo ?? DateTime.now())} Days",
                      style: TTypography.normal.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                        color: TTColors.primary,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                  Container(
                    width: UIHelpers.screenWidth(context) * 0.30,
                    height: 40,
                    decoration: BoxDecoration(
                      color: getStatusColor(
                          fetchLeavesAttributesItems?.leaveStatus ?? ""),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        fetchLeavesAttributesItems?.leaveStatus ?? "",
                        style: TTypography.normal.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: getTextStatusColor(
                              fetchLeavesAttributesItems?.leaveStatus ?? ""),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

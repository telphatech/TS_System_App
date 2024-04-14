import 'package:flutter/material.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/widgets/configuration_text_status.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class ApplicationListWidget extends StatelessWidget {
  const ApplicationListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // serviceLocator<AppRouter>().push(
        //     LeaveDetailsView(
        //         uid: leave.uId ?? ""));
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
                  size: UIHelpers.screenWidth(context) * 0.06,
                  color: TTColors.primary,
                ),
                UIHelpers.verticalSpaceTiny,
                Text(
                  "Casual",
                  style: TTypography.normal.copyWith(
                    fontWeight: FontWeight.w300,
                    color: TTColors.primary,
                    fontSize: UIHelpers.screenWidth(context) * 0.03,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            UIHelpers.horizontalSpaceSmall,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.calendar_month_rounded,
                            size: 15,
                            color: TTColors.grey,
                          ),
                          UIHelpers.horizontalSpaceTiny,
                          SizedBox(
                            width: UIHelpers.screenWidth(context) * 0.20,
                            child: Text(
                              "12 - 14 Apr",
                              style: TTypography.normal.copyWith(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: TTColors.primary,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ),
                        ],
                      ),
                      UIHelpers.verticalSpaceTiny,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.calendar_month_rounded,
                            size: 16,
                            color: TTColors.grey,
                          ),
                          UIHelpers.horizontalSpaceTiny,
                          Text(
                            "${10} days",
                            style: TTypography.normal.copyWith(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              color: TTColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: UIHelpers.screenWidth(context) * 0.30,
                    height: 40,
                    decoration: BoxDecoration(
                      color: getStatusColor("Pending"),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        "Pending",
                        style: TTypography.normal.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: getTextStatusColor("Pending"),
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

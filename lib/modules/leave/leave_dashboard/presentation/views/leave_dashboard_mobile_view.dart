import 'package:flutter/material.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/menu_drawer.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/widgets/leave_appbar.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/widgets/leave_type_container_widget.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class LeaveDashboardMobileView extends StatelessWidget {
  const LeaveDashboardMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight),
          child: LeaveAppBar()),
      body: Column(
        children: [
          UIHelpers.verticalSpaceRegular,
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: AppText.body5("Balance Leaves")),
                AppText.body5underline("Leaves Policies",
                    color: TTColors.primary),
              ],
            ),
          ),
          UIHelpers.verticalSpaceRegular,
          SizedBox(
            height: 170,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const LeaveTypeContainerWidget();
              },
              separatorBuilder: (context, index) =>
                  UIHelpers.horizontalSpaceSmall,
              itemCount: 10,
            ),
          ),
          UIHelpers.verticalSpaceRegular,
          Flexible(
            child: RefreshIndicator(
              onRefresh: () async {},
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return UIHelpers.verticalSpaceRegular;
                  },
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      padding: const EdgeInsets.fromLTRB(12, 11, 07, 12),
                      decoration: BoxDecoration(
                        color: TTColors.white,
                        border: Border.all(
                          width: 1,
                          color: const Color.fromRGBO(174, 174, 174, 0.3),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.sick),
                              UIHelpers.horizontalSpaceTiny,
                              AppText.bodyBold("Casual Leave"),
                            ],
                          ),
                          UIHelpers.verticalSpaceTiny,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.calendar_month_rounded),
                              UIHelpers.horizontalSpaceTiny,
                              AppText.bodyBold("12 Feb to 14 Feb"),
                            ],
                          ),
                          UIHelpers.verticalSpaceTiny,
                          Container(
                            width: double.infinity,
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
                          UIHelpers.verticalSpaceSmall,
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: TTColors.primary,
        onPressed: () {
          serviceLocator<AppRouter>().push(const ApplyLeaveMobileView());
        },
        child: const Icon(
          Icons.add,
          color: TTColors.white,
        ),
      ),
    );
  }
}

Color? getStatusColor(String status) {
  if (status == "Approved") {
    return const Color.fromRGBO(226, 242, 225, 1);
  } else if (status == "Pending" || status == "Applied") {
    return const Color.fromRGBO(237, 240, 204, 1);
  }

  return const Color.fromRGBO(249, 224, 224, 1);
}

Color? getTextStatusColor(String status) {
  if (status == "Approved") {
    return const Color.fromRGBO(82, 196, 26, 1);
  } else if (status == "Pending") {
    return const Color.fromRGBO(125, 131, 148, 1);
  } else if (status == "Rejected") {
    return const Color.fromRGBO(255, 77, 79, 1);
  }
  return const Color.fromRGBO(125, 131, 148, 1);
}

import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:ts_system/modules/leave/apply_leave/presentation/pages/leave_policies.dart';
=======
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/home/dashboard/presentation/widgets/menu_drawer.dart';
>>>>>>> Stashed changes
import 'package:ts_system/modules/leave/leave_dashboard/presentation/widgets/leave_appbar.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LeaveDashboardMobileView extends StatelessWidget {
  const LeaveDashboardMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size(double.infinity, kToolbarHeight),
            child: LeaveAppBar()),
        body: LeaveDashboardBody(),
      ),
    );
  }
}

class BalanceLeaveCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LeaveDashboardPadding();
  }
}

class LeaveCard extends StatelessWidget {
  final String leaveType;
  final IconData icon;
  final String date;
  final int days;
  final LeaveStatus status;

  const LeaveCard({
    required this.leaveType,
    required this.icon,
    required this.date,
    required this.days,
    required this.status,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (status) {
      case LeaveStatus.Pending:
        statusColor = TTColors.secondary!;
        break;
      case LeaveStatus.Approved:
        statusColor = TTColors.success!;
        break;
      case LeaveStatus.Cancelled:
        statusColor = TTColors.danger!;
        break;
    }

    return Card(
      color: TTColors.white,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
=======
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        UIHelpers.hideKeyBoard();
        serviceLocator<AppRouter>().popAndPush(DashboardMobileView());
      },
      child: Scaffold(
        drawer: MenuDrawer(),
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, kToolbarHeight),
            child: LeaveAppBar()),
        body: Column(
>>>>>>> Stashed changes
          children: [
            UIHelpers.verticalSpaceRegular,
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.body5("Balance Leaves"),
                  AppText.body5underline(
                    "Leaves Policies",
                    color: TTColors.primary,
                  ),
<<<<<<< Updated upstream
                  Text(
                    leaveType,
                    style: TextStyle(color: TTColors.primary),
                  ),
=======
>>>>>>> Stashed changes
                ],
              ),
            ),
            UIHelpers.verticalSpaceRegular,
            Container(
              height: 170,
              margin: const EdgeInsets.symmetric(
                horizontal: 05,
              ),
              width: UIHelpers.screenWidth(context),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
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
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_month_rounded,
                                color: TTColors.black,
                                size: 20,
                              ),
                              UIHelpers.horizontalSpaceSmall,
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
                        ],
                      ),
                    ),
                  );
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: UIHelpers.screenWidth(context) * 0.30,
                              height: 40,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: TTColors.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Casual Leave",
                                  style: TTypography.normal.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: TTColors.white,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                            UIHelpers.horizontalSpaceSmall,
                            SizedBox(
                              width: UIHelpers.screenWidth(context) * 0.30,
                              child: Text(
                                "12 Feb to 14 Feb",
                                style: TTypography.normal.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: TTColors.black,
                                  overflow: TextOverflow.clip,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            UIHelpers.horizontalSpaceSmall,
                            Container(
                              width: UIHelpers.screenWidth(context) * 0.20,
                              height: 40,
                              decoration: BoxDecoration(
                                color: TTColors.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "10 days",
                                  style: TTypography.normal.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: TTColors.white,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
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
          child: Icon(
            Icons.add,
            color: TTColors.white,
          ),
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

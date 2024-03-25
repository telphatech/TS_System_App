import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/menu_drawer.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/widgets/desktop_app_bar.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/widgets/apply_leave_dialog.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/widgets/calendar_widget.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/widgets/leave_tile_widget.dart';

import 'package:ts_system/modules/leave/leave_dashboard/presentation/widgets/leave_type_container_widget.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class LeaveDashboardDesktopView extends StatelessWidget {
  const LeaveDashboardDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: AppBarDesktopWidget(),
      ),
      drawer: const MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 170,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const LeaveTypeContainerWidget();
                      },
                      separatorBuilder: (context, index) =>
                          UIHelpers.horizontalSpaceSmall,
                      itemCount: 3,
                    ),
                  ),
                  UIHelpers.verticalSpaceMedium,
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: DefaultTabController(
                        length: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TabBar(
                                  unselectedLabelStyle: TTypography.normal
                                      .copyWith(
                                          color: TTColors.grey,
                                          fontWeight: FontWeight.w400),
                                  labelStyle: TTypography.normal.copyWith(
                                      color: TTColors.primary,
                                      fontWeight: FontWeight.w400),
                                  indicatorSize: TabBarIndicatorSize.label,
                                  indicatorColor: TTColors.primary,
                                  tabs: const [
                                    Tab(
                                      text: "Leaves",
                                      icon: Icon(Icons.minimize_rounded),
                                    ),
                                    Tab(
                                      text: "Requests",
                                      icon: Icon(Icons.request_page_rounded),
                                    ),
                                    Tab(
                                      text: "Holidays",
                                      icon: Icon(Icons.holiday_village_rounded),
                                    )
                                  ]),
                              Flexible(
                                child: TabBarView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    RefreshIndicator(
                                      onRefresh: () async {},
                                      child: ListView.separated(
                                          separatorBuilder: (context, index) {
                                            return UIHelpers
                                                .verticalSpaceRegular;
                                          },
                                          itemCount: 10,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return const LeavesTileWidget();
                                          }),
                                    ),
                                    RefreshIndicator(
                                      onRefresh: () async {},
                                      child: ListView.separated(
                                          separatorBuilder: (context, index) {
                                            return UIHelpers
                                                .verticalSpaceRegular;
                                          },
                                          itemCount: 10,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return const LeavesTileWidget();
                                          }),
                                    ),
                                    RefreshIndicator(
                                      onRefresh: () async {},
                                      child: ListView.builder(
                                          itemCount: 10,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return const LeavesTileWidget();
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.primaryBodyLabel("Reporting To: Vaibhav Wable"),
                  UIHelpers.verticalSpaceMedium,
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                dialogTheme: const DialogTheme(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                              ),
                              child: const Dialog(
                                child: ApplyLeaveDialog(),
                              ),
                            );
                          },
                        );
                      },
                      backgroundColor: TTColors.primary,
                      borderColor: TTColors.primary,
                      iconColor: TTColors.white,
                      child: const Text('Leave',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  UIHelpers.verticalSpaceMedium,
                  const CalendarWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

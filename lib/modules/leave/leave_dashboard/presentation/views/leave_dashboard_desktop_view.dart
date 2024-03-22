import 'package:flutter/material.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/menu_drawer.dart';
import 'package:ts_system/modules/employee/employee_panel/presentation/widgets/employee_desktop_widget.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/widgets/leave_tile_widget.dart';

import 'package:ts_system/modules/leave/leave_dashboard/presentation/widgets/leave_type_container_widget.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';
import 'package:calendar_view/calendar_view.dart';

DateTime get _now => DateTime.now();

class LeaveDashboardDesktopView extends StatelessWidget {
  const LeaveDashboardDesktopView({Key? key});

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
                  // Leave Types Section
                  SizedBox(
                    height: 170,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        // Replace with your LeaveTypeContainerWidget
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
                  // Reporting Section
                  AppText.body("Reporting to: Vaibhav Wable"),
                  UIHelpers.verticalSpaceSmall,
                  // Leave Button
                  SizedBox(
                    width: 250,
                    child: CustomElevatedButton(
                      onPressed: () {},
                      backgroundColor: TTColors.primary,
                      borderColor: TTColors.primary,
                      iconColor: TTColors.white,
                      child: const Text('Leave',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  UIHelpers.verticalSpaceSmall,
                  Expanded(
                    flex: 1,
                    child: MonthView(
                      controller: EventController()..addAll(_events),
                      cellBuilder: (date, events, isToday, isInMonth) {
                        return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: isToday ? TTColors.primary : TTColors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(
                              color: isToday ? TTColors.white : Colors.black,
                              fontWeight:
                                  isToday ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        );
                      },
                      showBorder: true,
                      minMonth: DateTime(1990),
                      maxMonth: DateTime(2050),
                      initialMonth: DateTime.now(),
                      cellAspectRatio: 1,
                      startDay: WeekDays.sunday,
                      headerBuilder: MonthHeader.hidden,
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

List<CalendarEventData> _events = [
  CalendarEventData(
    date: _now,
    title: "Project meeting",
    description: "Today is project meeting.",
    startTime: DateTime(_now.year, _now.month, _now.day, 18, 30),
    endTime: DateTime(_now.year, _now.month, _now.day, 22),
  ),
  CalendarEventData(
    date: _now.add(const Duration(days: 1)),
    startTime: DateTime(_now.year, _now.month, _now.day, 18),
    endTime: DateTime(_now.year, _now.month, _now.day, 19),
    title: "Wedding anniversary",
    description: "Attend uncle's wedding anniversary.",
  ),
  CalendarEventData(
    date: _now,
    startTime: DateTime(_now.year, _now.month, _now.day, 14),
    endTime: DateTime(_now.year, _now.month, _now.day, 17),
    title: "Football Tournament",
    description: "Go to football tournament.",
  ),
  CalendarEventData(
    date: _now.add(const Duration(days: 3)),
    startTime: DateTime(
        _now.add(const Duration(days: 3)).year,
        _now.add(const Duration(days: 3)).month,
        _now.add(const Duration(days: 3)).day,
        10),
    endTime: DateTime(
        _now.add(const Duration(days: 3)).year,
        _now.add(const Duration(days: 3)).month,
        _now.add(const Duration(days: 3)).day,
        14),
    title: "Sprint Meeting.",
    description: "Last day of project submission for last year.",
  ),
  CalendarEventData(
    date: _now.subtract(const Duration(days: 2)),
    startTime: DateTime(
        _now.subtract(const Duration(days: 2)).year,
        _now.subtract(const Duration(days: 2)).month,
        _now.subtract(const Duration(days: 2)).day,
        14),
    endTime: DateTime(
        _now.subtract(const Duration(days: 2)).year,
        _now.subtract(const Duration(days: 2)).month,
        _now.subtract(const Duration(days: 2)).day,
        16),
    title: "Team Meeting",
    description: "Team Meeting",
  ),
  CalendarEventData(
    date: _now.subtract(const Duration(days: 2)),
    startTime: DateTime(
        _now.subtract(const Duration(days: 2)).year,
        _now.subtract(const Duration(days: 2)).month,
        _now.subtract(const Duration(days: 2)).day,
        10),
    endTime: DateTime(
        _now.subtract(const Duration(days: 2)).year,
        _now.subtract(const Duration(days: 2)).month,
        _now.subtract(const Duration(days: 2)).day,
        12),
    title: "Chemistry Viva",
    description: "Today is Joe's birthday.",
  ),
];

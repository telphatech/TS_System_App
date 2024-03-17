import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/home/dashboard/presentation/widgets/menu_drawer.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/widgets/calender_view.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/widgets/floating_button.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/widgets/task_lists.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/widgets/timesheet_appbar.dart';
import 'package:ts_system/utils/common_widgets/empty_widget.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class TaskDashboard extends StatefulWidget {
  const TaskDashboard({super.key});

  @override
  State<TaskDashboard> createState() => _TaskDashboardState();
}

class _TaskDashboardState extends State<TaskDashboard> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    bool isSameDay(DateTime date1, DateTime date2) {
      return date1.year == date2.year &&
          date1.month == date2.month &&
          date1.day == date2.day;
    }

    // final DateTime selectedDate =
    //     Provider.of<TimesheetBloc>(context).getSelectedDate;
    final DateTime currentDate = DateTime.now();

    final bool isCurrentDate = isSameDay(currentDate, DateTime.now());
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        UIHelpers.hideKeyBoard();
        serviceLocator<AppRouter>().popAndPush(DashboardMobileView());
      },
      child: Scaffold(
        drawer: const MenuDrawer(),
        appBar: PreferredSize(
          preferredSize:
              Size(double.infinity, UIHelpers.screenHeight(context) * 0.18),
          child: const TimesheetAppbar(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CalenderView(),
            UIHelpers.verticalSpaceSmall,
            Visibility(visible: false, child: emptyWidget()),
            const Visibility(visible: true, child: TaskLists()),
          ],
        ),
        floatingActionButton: isCurrentDate == true
            ? TaskDashboardFloatingButton(
                onTap: () {
                  serviceLocator<AppRouter>().push(const AddTaskMobileView());
                },
              )
            : null,
      ),
    );
  }
}

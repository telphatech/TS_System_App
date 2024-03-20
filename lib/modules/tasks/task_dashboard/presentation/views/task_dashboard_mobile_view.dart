import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/menu_drawer.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/bloc/bloc/task_bloc.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/bloc/bloc/task_event.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/bloc/bloc/task_state.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/widgets/calender_view.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/widgets/floating_button.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/widgets/task_lists.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/widgets/timesheet_appbar.dart';
import 'package:ts_system/utils/common_widgets/empty_widget.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class TaskDashboard extends StatefulWidget {
  const TaskDashboard({super.key});

  @override
  State<TaskDashboard> createState() => _TaskDashboardState();
}

class _TaskDashboardState extends State<TaskDashboard> {
  DateTime selected = DateTime.now();

  @override
  Widget build(BuildContext context) {
    bool isSameDay(DateTime date1, DateTime date2) {
      return date1.year == date2.year &&
          date1.month == date2.month &&
          date1.day == date2.day;
    }

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        UIHelpers.hideKeyBoard();
        serviceLocator<AppRouter>().popAndPush(DashboardMobileView());
      },
      child: BlocProvider(
        create: (context) =>
            TaskBloc()..add(TaskInitialEvent(employeeUID: "employeeUID")),
        child: BlocConsumer<TaskBloc, TaskState>(
          listener: (context, state) {},
          builder: (context, state) {
            final DateTime selectedDate =
                Provider.of<TaskBloc>(context, listen: false).getSelectedDate;
            DateTime currentDate = DateTime.now();

            final bool isCurrentDate = isSameDay(currentDate, selectedDate);
            return Scaffold(
              drawer: const MenuDrawer(),
              appBar: PreferredSize(
                preferredSize: Size(
                    double.infinity, UIHelpers.screenHeight(context) * 0.15),
                child: const TimesheetAppbar(),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            style: TTypography.text18Black.copyWith(
                                color: TTColors.primary,
                                fontSize:
                                    UIHelpers.screenWidth(context) * 0.040),
                            DateFormat('d MMMM y').format(
                                Provider.of<TaskBloc>(context, listen: true)
                                    .getSelectedDate),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 13, 20, 25),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              BlocProvider.of<TaskBloc>(context, listen: false)
                                  .setSelectedDate(DateTime.now());
                              BlocProvider.of<TaskBloc>(context)
                                  .add(TaskInitialEvent(
                                employeeUID: "",
                                dateList: [
                                  DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'")
                                      .format(BlocProvider.of<TaskBloc>(context,
                                              listen: false)
                                          .getSelectedDate),
                                ],
                              ));
                            });
                          },
                          child: const Icon(Icons.sort_rounded,
                              size: 30, color: TTColors.primary),
                        ),
                      ),
                    ],
                  ),
                  const CalenderView(),
                  UIHelpers.verticalSpaceSmall,
                  Visibility(visible: false, child: emptyWidget()),
                  const Visibility(visible: true, child: TaskLists()),
                ],
              ),
              floatingActionButton: isCurrentDate == true
                  ? TaskDashboardFloatingButton(
                      onTap: () {
                        serviceLocator<AppRouter>()
                            .push(const AddTaskMobileView());
                      },
                    )
                  : null,
            );
          },
        ),
      ),
    );
  }
}

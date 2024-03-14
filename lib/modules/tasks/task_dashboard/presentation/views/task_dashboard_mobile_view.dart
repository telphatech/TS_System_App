import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/widgets/date_day_container.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/widgets/floating_button.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/widgets/listview_time_cards.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/widgets/searchfield.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/widgets/timesheet_appbar.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
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
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight),
          child: TimesheetAppbar()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SearchField(),
          UIHelpers.verticalSpaceSmall,
          Container(
            color: TTColors.borderSecondary,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    DateFormat('dd MMMM yyyy').format(DateTime.now()),
                    overflow: TextOverflow.ellipsis,
                    style: TTypography.text22Black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  icon: const Icon(TTIcons.filter,
                      color: TTColors.black, size: 28),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            child: Container(
              color: TTColors.borderSecondary,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    DateTime(DateTime.now().year, DateTime.now().month + 1, 0)
                        .day,
                itemBuilder: (context, index) {
                  DateTime currentDate = DateTime(
                      DateTime.now().year, DateTime.now().month, index + 1);
                  String formattedDate = DateFormat('dd').format(currentDate);
                  String formattedDay = DateFormat('E').format(currentDate);

                  bool isSelected = currentDate.year == selectedDate.year &&
                      currentDate.month == selectedDate.month &&
                      currentDate.day == selectedDate.day;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDate = currentDate;
                      });
                    },
                    child: DateDayContainer(
                        isSelected: isSelected,
                        formattedDate: formattedDate,
                        formattedDay: formattedDay),
                  );
                },
              ),
            ),
          ),
          ListviewTimeCards(selectedDate: selectedDate),
        ],
      ),
      floatingActionButton: const TaskDashboardFloatingButton(),
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2001),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}

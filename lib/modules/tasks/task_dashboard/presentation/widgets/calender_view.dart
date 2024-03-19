import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/bloc/bloc/task_bloc.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/bloc/bloc/task_event.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/bloc/bloc/task_state.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({
    Key? key,
  });

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {},
      builder: (context, state) {
        return EasyDateTimeLine(
          key: UniqueKey(),
          initialDate:
              BlocProvider.of<TaskBloc>(context, listen: false).getSelectedDate,
          disabledDates: generateDisabledDates(),
          onDateChange: (selectedDate) {
            setState(() {
              BlocProvider.of<TaskBloc>(context).setSelectedDate(selectedDate);
              BlocProvider.of<TaskBloc>(context).add(TaskInitialEvent(
                employeeUID: "",
                dateList: [
                  DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(selectedDate),
                ],
              ));
              BlocProvider.of<TaskBloc>(context).getSelectedDate = selectedDate;
            });
          },
          activeColor: TTColors.primary,
          headerProps: const EasyHeaderProps(
            showHeader: false,
            dateFormatter: DateFormatter.fullDateDMonthAsStrY(),
          ),
          dayProps: EasyDayProps(
            height: 56.0,
            width: 56.0,
            dayStructure: DayStructure.dayNumDayStr,
            disabledDayStyle: DayStyle(
                borderRadius: 48.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: Colors.grey[100] ?? TTColors.grey)),
                dayStrStyle: TTypography.normal.copyWith(color: TTColors.grey),
                dayNumStyle:
                    TTypography.normal.copyWith(color: TTColors.primary)),
            inactiveDayStyle: DayStyle(
                borderRadius: 48.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: Colors.grey[100] ?? TTColors.grey)),
                dayStrStyle:
                    TTypography.normal.copyWith(color: TTColors.primary),
                dayNumStyle:
                    TTypography.normal.copyWith(color: TTColors.primary)),
            todayStyle: DayStyle(
              dayStrStyle: TTypography.normal.copyWith(color: TTColors.primary),
              dayNumStyle: TTypography.normal.copyWith(color: TTColors.primary),
            ),
            activeDayStyle: DayStyle(
              borderRadius: 48.0,
              decoration: BoxDecoration(
                  color: TTColors.primary,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[100] ?? TTColors.grey)),
              dayStrStyle: TTypography.normal.copyWith(color: TTColors.white),
              dayNumStyle: TTypography.normal.copyWith(color: TTColors.white),
            ),
          ),
        );
      },
    );
  }
}

List<DateTime> generateDisabledDates() {
  List<DateTime> disabledDates = [];
  DateTime currentDate = DateTime.now().add(const Duration(days: 1));

  for (int i = 0; i < 31; i++) {
    disabledDates.add(currentDate);
    currentDate = currentDate.add(const Duration(days: 1));
  }

  return disabledDates;
}

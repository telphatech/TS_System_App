import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/bloc/bloc/task_bloc.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/bloc/bloc/task_event.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';

class TimesheetAppbar extends StatefulWidget {
  const TimesheetAppbar({
    super.key,
  });

  @override
  State<TimesheetAppbar> createState() => _TimesheetAppbarState();
}

class _TimesheetAppbarState extends State<TimesheetAppbar> {
  DateTime selected = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: TTColors.primary,
      title: Text('Timesheet',
          style: TTypography.normal.copyWith(color: TTColors.white)),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: AppInputField(
              enabledBorderColor: Colors.grey[100],
              hint: 'Search',
              trailing: IconButton(
                icon: const Icon(Icons.calendar_month, color: TTColors.primary),
                onPressed: () async {
                  selected = BlocProvider.of<TaskBloc>(context, listen: false)
                      .getSelectedDate;
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selected,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                    builder: (BuildContext context, Widget? child) => Theme(
                      data: ThemeData.light().copyWith(
                        primaryColor: TTColors.primary,
                        hintColor: TTColors.primary,
                        colorScheme: const ColorScheme.light(
                          primary: TTColors.primary,
                        ),
                      ),
                      child: child!,
                    ),
                  );

                  if (pickedDate != null && pickedDate != selected) {
                    setState(() {
                      selected = pickedDate;
                      BlocProvider.of<TaskBloc>(context)
                          .setSelectedDate(selected);
                      BlocProvider.of<TaskBloc>(context).add(TaskInitialEvent(
                        employeeUID: "",
                        dateList: DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'")
                            .format(selected),
                      ));
                    });
                  }
                },
              ),
              hintStyle: TextStyle(
                color: Colors.grey[500] ?? Colors.grey,
              ),
              inputBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: TTColors.accent),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              color: TTColors.white,
              leading: const Icon(Icons.search_rounded, color: TTColors.grey),
            ),
          ),
        ),
      ),
    );
  }
}

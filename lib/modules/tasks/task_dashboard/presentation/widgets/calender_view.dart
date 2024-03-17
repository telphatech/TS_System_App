import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class CalenderView extends StatelessWidget {
  const CalenderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      disabledDates: generateDisabledDates(),
      onDateChange: (selectedDate) {
        print(selectedDate);
      },
      activeColor: TTColors.primary,
      headerProps: EasyHeaderProps(
        selectedDateStyle: TextStyle(
            color: TTColors.primary,
            fontSize: UIHelpers.getResponsiveFontSize(context) * 0.60),
        padding: const EdgeInsets.all(10),
        monthStyle: TextStyle(
            color: TTColors.primary,
            fontSize: UIHelpers.getResponsiveFontSize(context) * 0.60),
        monthPickerType: MonthPickerType.switcher,
        showHeader: true,
        dateFormatter: const DateFormatter.fullDateDMonthAsStrY(),
      ),
      dayProps: EasyDayProps(
        height: 56.0,
        width: 56.0,
        dayStructure: DayStructure.dayNumDayStr,
        disabledDayStyle: DayStyle(
            borderRadius: 48.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[100] ?? TTColors.grey)),
            dayStrStyle: TTypography.normal.copyWith(color: TTColors.grey),
            dayNumStyle: TTypography.normal.copyWith(color: TTColors.primary)),
        inactiveDayStyle: DayStyle(
            borderRadius: 48.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[100] ?? TTColors.grey)),
            dayStrStyle: TTypography.normal.copyWith(color: TTColors.primary),
            dayNumStyle: TTypography.normal.copyWith(color: TTColors.primary)),
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
  }
}

List<DateTime> generateDisabledDates() {
  List<DateTime> disabledDates = [];
  DateTime now = DateTime.now();
  int currentMonth = now.month;
  int currentYear = now.year;
  int currentDay = now.day + 1;
  int maxMonth = 12;
  int maxDays = 31;

  for (int month = currentMonth; month <= maxMonth; month++) {
    int daysInMonth =
        month < 12 ? DateTime(currentYear, month + 1, 0).day : maxDays;
    int startDay = month == currentMonth ? currentDay : 1;
    for (int day = startDay; day <= daysInMonth; day++) {
      disabledDates.add(DateTime(currentYear, month, day));
    }
  }

  return disabledDates;
}

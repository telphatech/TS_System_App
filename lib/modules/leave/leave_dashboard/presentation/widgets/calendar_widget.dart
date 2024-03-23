import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: MonthView(
        controller: EventController(),
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
                fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
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
    );
  }
}

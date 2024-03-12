import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class DateDayContainer extends StatelessWidget {
  const DateDayContainer({
    super.key,
    required this.isSelected,
    required this.formattedDate,
    required this.formattedDay,
  });

  final bool isSelected;
  final String formattedDate;
  final String formattedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: isSelected ? TTColors.primary : null,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            formattedDate,
            style: TextStyle(
              color: isSelected ? TTColors.white : TTColors.primary,
              fontWeight: FontWeight.w700,
              fontSize: 17,
            ),
          ),
          Text(
            formattedDay,
            style: TextStyle(
              color: isSelected ? TTColors.white : TTColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}

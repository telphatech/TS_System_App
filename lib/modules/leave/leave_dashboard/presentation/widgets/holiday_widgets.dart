import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class HolidayWidget extends StatelessWidget {
  const HolidayWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> holidays = [
      {"occasion": "New Year's Day", "date": "2024-01-01", "day": "Tue"},
      {"occasion": "Valentine's Day", "date": "2024-02-14", "day": "Wed"},
      {"occasion": "Independence Day", "date": "2024-07-04", "day": "Thur"},
      {"occasion": "Valentine's Day", "date": "2024-02-14", "day": "Wed"},
      {"occasion": "Independence Day", "date": "2024-07-04", "day": "Thur"},
      {"occasion": "Valentine's Day", "date": "2024-02-14", "day": "Wed"},
      {"occasion": "Independence Day", "date": "2024-07-04", "day": "Thur"},
      {"occasion": "Maharashtra Day", "date": "2024-02-14", "day": "Wed"},
      {"occasion": "Diwali Day", "date": "2024-07-04", "day": "Thur"},
    ];

    return Column(
      children: [
        Container(
          color: TTColors.grey,
          padding: const EdgeInsets.all(08.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "Occasion",
                  style: TTypography.normal.copyWith(
                    fontWeight: FontWeight.bold,
                    color: TTColors.white,
                  ),
                ),
              ),
              UIHelpers.horizontalSpaceSmall,
              Expanded(
                flex: 2,
                child: Text(
                  "Date",
                  style: TTypography.normal.copyWith(
                    fontWeight: FontWeight.bold,
                    color: TTColors.white,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Day",
                  style: TTypography.normal.copyWith(
                    fontWeight: FontWeight.bold,
                    color: TTColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: ListView.separated(
            itemBuilder: (context, index) {
              final holiday = holidays[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        holiday["occasion"],
                        style: TTypography.normal.copyWith(
                          fontWeight: FontWeight.w400,
                          color: TTColors.black,
                        ),
                      ),
                    ),
                    UIHelpers.horizontalSpaceSmall,
                    Expanded(
                      flex: 2,
                      child: Text(
                        DateFormat('dd MMM yyyy')
                            .format(DateTime.parse(holiday["date"])),
                        style: TTypography.normal.copyWith(
                          fontWeight: FontWeight.w400,
                          color: TTColors.black,
                        ),
                      ),
                    ),
                    UIHelpers.verticalSpaceSmall,
                    Expanded(
                      child: Text(
                        holiday["day"],
                        style: TTypography.normal.copyWith(
                          fontWeight: FontWeight.w400,
                          color: TTColors.black,
                        ),
                      ),
                    ),
                    UIHelpers.verticalSpaceSmall,
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) =>
                UIHelpers.verticalSpaceRegular,
            itemCount: holidays.length,
          ),
        ),
      ],
    );
  }
}

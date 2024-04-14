import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class HolidayWidget extends StatelessWidget {
  const HolidayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(08.0),
          decoration: BoxDecoration(
              color: TTColors.primary, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "Occasion",
                  style: TTypography.normal.copyWith(
                    fontWeight: FontWeight.w500,
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
                    fontWeight: FontWeight.w500,
                    color: TTColors.white,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Day",
                  style: TTypography.normal.copyWith(
                    fontWeight: FontWeight.w500,
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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Independent Day",
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
                        DateFormat('dd/MM/yyyy')
                            .format(DateTime.parse("2024-04-04")),
                        style: TTypography.normal.copyWith(
                          fontWeight: FontWeight.w400,
                          color: TTColors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Friday",
                        style: TTypography.normal.copyWith(
                          fontWeight: FontWeight.w400,
                          color: TTColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) =>
                UIHelpers.verticalSpaceRegular,
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}

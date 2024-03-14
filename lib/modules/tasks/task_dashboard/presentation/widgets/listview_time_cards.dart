import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class ListviewTimeCards extends StatelessWidget {
  const ListviewTimeCards({
    super.key,
    required this.selectedDate,
  });

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2000,
                  width: 100,
                  child: Container(
                    color: TTColors.borderSecondary,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        DateTime startTime = DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                          9,
                          0,
                        );

                        DateTime currentDate =
                            startTime.add(Duration(hours: index));

                        String formattedTime =
                            DateFormat('hh:mm').format(currentDate);
                        String formattedDay =
                            DateFormat('a').format(currentDate);

                        return Container(
                          height: 98,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(formattedTime,
                                  style: TTypography.text18Black),
                              Text(formattedDay, style: TTypography.text16Grey),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 2000,
                    child: Container(
                      color: TTColors.borderSecondary,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          DateTime startTime = DateTime(
                            selectedDate.year,
                            selectedDate.month,
                            selectedDate.day,
                            9,
                            0,
                          );
                          startTime = startTime.add(Duration(hours: index));
                          DateTime endTime =
                              startTime.add(const Duration(hours: 1));

                          String timeRange =
                              '${DateFormat('hh:00 a').format(startTime)}-${DateFormat('hh:00 a').format(endTime)}';

                          return Card(
                            color: TTColors.white,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    TTIcons.taskcheck,
                                    color: TTColors.primary,
                                  ),
                                  UIHelpers.horizontalSpaceSmall,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Task Name',
                                          overflow: TextOverflow.ellipsis,
                                          style: TTypography.text18Primary,
                                          maxLines: 1,
                                        ),
                                        Text(
                                          'Project Name\n',
                                          overflow: TextOverflow.ellipsis,
                                          style: TTypography.text16Black,
                                        ),
                                        Text(
                                          timeRange,
                                          overflow: TextOverflow.ellipsis,
                                          style: TTypography.text14Grey,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

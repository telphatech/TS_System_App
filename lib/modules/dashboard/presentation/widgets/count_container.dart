import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class CountContainer extends StatelessWidget {
  final String title;
  final String count;
  final String total;
  final DateTime? month;

  const CountContainer({
    super.key,
    required this.title,
    required this.count,
    required this.total,
    this.month,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: TTColors.buttonDisabled.withOpacity(0.5)),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, bottom: 5),
              child: AppText.bodyLabel(
                title,
                color: TTColors.black,
              )),
          UIHelpers.verticalSpaceTiny,
          Align(
            alignment: Alignment.center,
            child: AppText.headline(
              "$count / $total",
              color: TTColors.primary,
            ),
          ),
          UIHelpers.verticalSpaceSmall,
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10),
            child: AppText.bodyLabel(
              DateFormat('MMMM', 'en_US').format(
                month ?? DateTime.now(),
              ),
              color: TTColors.black,
            ),
          )
        ],
      ),
    );
  }
}

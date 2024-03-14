import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_typography.dart';

class StartEndTimeText extends StatelessWidget {
  const StartEndTimeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20),
      child: Row(
        children: [
          const Icon(TTIcons.start),
          Expanded(
            child: Text(
              " Start Time",
              style: TTypography.text16Black,
            ),
          ),
          const Icon(TTIcons.stop),
          Expanded(
            child: Text(
              " End Time",
              style: TTypography.text16Black,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class DurationText extends StatelessWidget {
  const DurationText({
    super.key,
    required this.durationText,
  });

  final String durationText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Row(
        children: [
          const Icon(TTIcons.time, size: 22),
          UIHelpers.horizontalSpaceSmall,
          Expanded(
            child: Text(
              durationText,
              overflow: TextOverflow.ellipsis,
              style: TTypography.text18Black,
            ),
          ),
        ],
      ),
    );
  }
}

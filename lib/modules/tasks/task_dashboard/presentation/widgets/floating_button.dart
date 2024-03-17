import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';

class TaskDashboardFloatingButton extends StatelessWidget {
  final void Function() onTap;
  const TaskDashboardFloatingButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor: TTColors.primary,
      child: const Icon(
        TTIcons.add,
        color: TTColors.white,
      ),
    );
  }
}

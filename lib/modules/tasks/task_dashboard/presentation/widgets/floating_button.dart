import 'package:flutter/material.dart';
import 'package:ts_system/modules/tasks/add_task/presentation/views/add_task_mobile_view.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';

class TaskDashboardFloatingButton extends StatelessWidget {
  const TaskDashboardFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddTaskMobileView()),
        );
      },
      backgroundColor: TTColors.primary,
      child: const Icon(
        TTIcons.add,
        color: TTColors.white,
        size: 40,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/views/task_dashboard_mobile_view.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_typography.dart';

class AddTaskAppbar extends StatelessWidget {
  const AddTaskAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: TTColors.white,
      leading: IconButton(
        icon: const Icon(TTIcons.arrowback, color: TTColors.black),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TaskDashboard()),
          );
        },
      ),
      title: Text('Add Task', style: TTypography.text22Black),
      centerTitle: true,
    );
  }
}

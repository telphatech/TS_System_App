import 'package:flutter/material.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/views/task_dashboard_mobile_view.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_typography.dart';

class SaveChangesDiscardButtons extends StatelessWidget {
  const SaveChangesDiscardButtons({
    super.key,
    required this.durationText,
    required this.selectedProject,
    required this.selectedTaskType,
    required this.taskName,
  });

  final String durationText;
  final String selectedProject;
  final String selectedTaskType;
  final String taskName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 45,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // ignore: avoid_print
                      print('$durationText');
                      // ignore: avoid_print
                      print('Selected Project: $selectedProject');
                      // ignore: avoid_print
                      print('Selected Task Type: $selectedTaskType');
                      // ignore: avoid_print
                      print('Task Name: $taskName');
                    },
                    icon: const Icon(TTIcons.check, color: TTColors.white),
                    label: Text(
                      'Save Changes',
                      style: TTypography.text20BoldColor,
                      maxLines: 1,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TTColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 45,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TaskDashboard()),
                      );
                    },
                    icon: const Icon(
                      TTIcons.close,
                      color: TTColors.primary,
                    ),
                    label: Text(
                      'Discard',
                      style: TTypography.text20PrimaryColor,
                      maxLines: 1,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TTColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: TTColors.primary),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

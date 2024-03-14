import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ts_system/modules/tasks/add_task/presentation/widgets/appbar_add_task.dart';
import 'package:ts_system/modules/tasks/add_task/presentation/widgets/duration.dart';
import 'package:ts_system/modules/tasks/add_task/presentation/widgets/savechanges_discard_buttons.dart';
import 'package:ts_system/modules/tasks/add_task/presentation/widgets/start_end_time.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class AddTaskMobileView extends StatefulWidget {
  const AddTaskMobileView({super.key});

  @override
  State<AddTaskMobileView> createState() => _AddTaskMobileViewState();
}

class _AddTaskMobileViewState extends State<AddTaskMobileView> {
  bool isWholeDaySelected = false;
  TimeOfDay startTime = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay endTime = const TimeOfDay(hour: 9, minute: 0);

  String selectedProject = '';
  String selectedTaskType = '';
  String taskName = '';
  String durationText = 'Duration: 00 Hours';

  void calculateDuration() {
    if (isWholeDaySelected) {
      int durationHours = 9 + endTime.hour - startTime.hour;
      setState(() {
        durationText =
            'Duration: ${durationHours.toString().padLeft(2, '0')} Hours';
      });
    } else {
      final start = DateTime(2024, 1, 1, startTime.hour, startTime.minute);
      final end = DateTime(2024, 1, 1, endTime.hour, endTime.minute);
      final duration = end.difference(start);

      setState(() {
        durationText =
            'Duration: ${(duration.inHours).toString().padLeft(2, '0')} Hours';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight),
          child: AddTaskAppbar()),
      body: SingleChildScrollView(
        child: Container(
          height: 1000,
          color: TTColors.borderSecondary,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CheckboxListTile(
                title: Text(
                  "Whole Day",
                  style: TTypography.text18Black,
                ),
                value: isWholeDaySelected,
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: TTColors.primary,
                onChanged: (newValue) {
                  setState(() {
                    isWholeDaySelected = newValue!;

                    if (isWholeDaySelected) {
                      calculateDuration();
                    } else {
                      final start = DateTime(
                          2024, 1, 1, startTime.hour, startTime.minute);
                      final end =
                          DateTime(2024, 1, 1, endTime.hour, endTime.minute);
                      final duration = end.difference(start);
                      durationText =
                          'Duration: ${(duration.inHours).toString().padLeft(2, '0')} Hours';
                    }
                  });
                },
              ),
              const StartEndTimeText(),
              UIHelpers.verticalSpaceTiny,
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: TTColors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                style: TTypography.text18Black,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 18.0),
                                  hintText: DateFormat.Hm().format(
                                    DateTime(
                                      2024,
                                      1,
                                      1,
                                      startTime.hour,
                                      startTime.minute,
                                    ),
                                  ),
                                  //border: InputBorder.none,
                                ),
                                readOnly: true,
                                onTap: () async {
                                  TimeOfDay? selectedTime =
                                      await showTimePicker(
                                    context: context,
                                    initialTime: startTime,
                                  );
                                  if (selectedTime != null) {
                                    setState(() {
                                      startTime = selectedTime;
                                      calculateDuration();
                                    });
                                  }
                                },
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                TTIcons.time,
                                color: TTColors.primary,
                              ),
                              onPressed: () async {
                                TimeOfDay? selectedTime = await showTimePicker(
                                  context: context,
                                  initialTime: startTime,
                                );
                                if (selectedTime != null) {
                                  setState(() {
                                    startTime = selectedTime;
                                    calculateDuration();
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    UIHelpers.horizontalSpaceRegular,
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: TTColors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                style: TTypography.text18Black,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 18.0),
                                  hintText: DateFormat.Hm().format(
                                    DateTime(
                                      2024,
                                      1,
                                      1,
                                      endTime.hour,
                                      endTime.minute,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                ),
                                readOnly: true,
                                onTap: () async {
                                  TimeOfDay? selectedTime =
                                      await showTimePicker(
                                    context: context,
                                    initialTime: endTime,
                                  );
                                  if (selectedTime != null) {
                                    setState(() {
                                      endTime = selectedTime;
                                      calculateDuration();
                                    });
                                  }
                                },
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                TTIcons.time,
                                color: TTColors.primary,
                              ),
                              onPressed: () async {
                                TimeOfDay? selectedTime = await showTimePicker(
                                  context: context,
                                  initialTime: endTime,
                                );
                                if (selectedTime != null) {
                                  setState(() {
                                    endTime = selectedTime;
                                    calculateDuration();
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              DurationText(durationText: durationText),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Text('Group Name', style: TTypography.text16Black),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            iconEnabledColor: TTColors.primary,
                            iconSize: 35,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: TTColors.white,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              hintText: 'Select Group Name',
                              hintStyle: const TextStyle(
                                  color: TTColors.textSecondary),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 'Group 1',
                                child: Text('Group 1'),
                              ),
                              DropdownMenuItem(
                                value: 'Group 2',
                                child: Text('Group 2'),
                              ),
                              DropdownMenuItem(
                                value: 'Group 3',
                                child: Text('Group 3'),
                              ),
                            ],
                            onChanged: (String? value) {
                              setState(() {
                                selectedProject = value ?? '';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      'Task',
                      style: TTypography.text16Black,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: TTColors.white,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              hintText: 'Insert Task Name',
                              hintStyle: const TextStyle(
                                  color: TTColors.textSecondary),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                selectedTaskType = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Text('Task Description',
                        style: TTypography.text16Black),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: const TextStyle(color: TTColors.black),
                            maxLines: 4,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: TTColors.white,
                              contentPadding:
                                  const EdgeInsets.only(left: 10, top: 30),
                              hintText: 'Insert Task Description',
                              hintStyle: const TextStyle(
                                  color: TTColors.textSecondary),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                taskName = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SaveChangesDiscardButtons(
                      durationText: durationText,
                      selectedProject: selectedProject,
                      selectedTaskType: selectedTaskType,
                      taskName: taskName),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

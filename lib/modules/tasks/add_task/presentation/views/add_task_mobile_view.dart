import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/tasks/add_task/presentation/widgets/appbar_add_task.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/common/custom_dropdown.dart';
import 'package:ts_system/utils/common/custom_snackbar_service.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class AddTaskMobileView extends StatefulWidget {
  const AddTaskMobileView({super.key});

  @override
  State<AddTaskMobileView> createState() => _AddTaskMobileViewState();
}

class _AddTaskMobileViewState extends State<AddTaskMobileView> {
  bool isWholeDaySelected = false;
  TimeOfDay startTime = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay endTime = const TimeOfDay(hour: 9, minute: 0);
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

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
<<<<<<< Updated upstream
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
                          border: Border.all(
                            color: TTColors.black,
                            width: 1.0,
                          ),
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
                                  border: InputBorder.none,
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
                          border: Border.all(
                            color: TTColors.black,
                            width: 1.0,
                          ),
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
=======
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        UIHelpers.hideKeyBoard();
        serviceLocator<AppRouter>().pop();
      },
      child: Scaffold(
        backgroundColor: TTColors.white,
        appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 64), child: AddTaskAppbar()),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Form(
              child: Column(
>>>>>>> Stashed changes
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckboxMenuButton(
                      value: isWholeDaySelected,
                      onChanged: (value) {
                        setState(() {
                          isWholeDaySelected = value ?? false;
                          if (isWholeDaySelected) {
                            startTimeController.text =
                                startTime.format(context);
                            endTimeController.text = endTime.format(context);
                            calculateDuration();
                          } else {
                            final start = DateTime(
                                2024, 1, 1, startTime.hour, startTime.minute);
                            final end = DateTime(
                                2024, 1, 1, endTime.hour, endTime.minute);

                            final duration = end.difference(start);

                            durationText =
                                'Duration: ${(duration.inHours).toString().padLeft(2, '0')} Hours';
                          }
                        });
                      },
                      child: Text('Whole Day', style: TTypography.normal)),
                  UIHelpers.verticalSpaceTiny,
                  // Start and End Time
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.play_circle,
                                      color: TTColors.primary),
                                  UIHelpers.horizontalSpaceTiny,
                                  const Text('Start Time'),
                                ],
                              ),
                              UIHelpers.verticalSpaceSmall,
                              AppInputField(
                                readOnly: true,
                                hint: '09:00 PM',
                                controller: startTimeController,
                                trailing: const Icon(
                                  Icons.timer,
                                  color: TTColors.primary,
                                ),
                                trailingTapped: () async {
                                  if (!isWholeDaySelected) {
                                    TimeOfDay? pickedDate =
                                        await showTimePicker(
                                            context: context,
                                            initialTime: startTime);

                                    if (pickedDate != null) {
                                      startTime = pickedDate;
                                      startTimeController.text =
                                          startTime.format(context);
                                      calculateDuration();
                                    }
                                  } else {
                                    CustomSnackBarService().showWarningSnackBar(
                                        context,
                                        message:
                                            'Please uncheck the whole day.');
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        UIHelpers.horizontalSpaceSmall,
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.stop_circle,
                                      color: TTColors.primary),
                                  UIHelpers.horizontalSpaceTiny,
                                  const Text('End Time'),
                                ],
                              ),
                              UIHelpers.verticalSpaceSmall,
                              AppInputField(
                                readOnly: true,
                                hint: '09:00 PM',
                                controller: endTimeController,
                                trailing: const Icon(
                                  Icons.timer,
                                  color: TTColors.primary,
                                ),
                                trailingTapped: () async {
                                  if (!isWholeDaySelected) {
                                    TimeOfDay? pickedDate =
                                        await showTimePicker(
                                            context: context,
                                            initialTime: endTime);
                                    if (pickedDate != null) {
                                      if (!isWholeDaySelected) {
                                        endTime = pickedDate;
                                        endTimeController.text =
                                            endTime.format(context);
                                        calculateDuration();
                                      }
                                    }
                                  } else {
                                    CustomSnackBarService().showWarningSnackBar(
                                        context,
                                        message:
                                            'Please uncheck the whole day.');
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ]),
                  UIHelpers.verticalSpaceMedium,

                  // Duration
                  Row(
                    children: [
                      const Icon(
                        TTIcons.time,
                        color: TTColors.primary,
                      ),
                      UIHelpers.horizontalSpaceTiny,
                      Text(durationText),
                    ],
                  ),
                  UIHelpers.verticalSpaceMedium,
                  Text(
                    "Group Name",
                    style: TTypography.normal
                        .copyWith(color: TTColors.black, fontSize: 14),
                  ),
                  UIHelpers.verticalSpaceSmall,
                  const CustomSearchDropdown(
                    items: [],
                    showSearchBox: false,
                    isMenu: true,
                    hintText: 'Select Group Name',
                  ),
                  UIHelpers.verticalSpaceMedium,
                  Text(
                    "Task Name",
                    style: TTypography.normal
                        .copyWith(color: TTColors.black, fontSize: 14),
                  ),
                  UIHelpers.verticalSpaceSmall,
                  const AppInputField(
                    hint: 'Insert Task Name',
                  ),
                  UIHelpers.verticalSpaceMedium,
                  Text(
                    "Task Description",
                    style: TTypography.normal
                        .copyWith(color: TTColors.black, fontSize: 14),
                  ),
                  UIHelpers.verticalSpaceSmall,
                  const AppInputField(
                    hint: 'Insert Task Description',
                    maxLines: 5,
                  ),
                  UIHelpers.verticalSpaceMedium,
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                        onPressed: () {},
                        backgroundColor: TTColors.primary,
                        borderColor: TTColors.primary,
                        iconColor: TTColors.white,
                        child: const Text('Save Changes')),
                  ),
                  UIHelpers.verticalSpaceMedium,
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                        onPressed: () {
                          serviceLocator<AppRouter>().pop();
                        },
                        backgroundColor: TTColors.white,
                        borderColor: TTColors.primary,
                        iconData: Icons.delete,
                        iconColor: TTColors.primary,
                        child: const Text(
                          'Discard Changes',
                          style: TextStyle(color: TTColors.primary),
                        )),
                  ),
                  UIHelpers.verticalSpaceMedium,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

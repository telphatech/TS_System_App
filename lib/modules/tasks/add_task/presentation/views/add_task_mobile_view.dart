import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/tasks/add_task/presentation/bloc/bloc/add_task_bloc.dart';
import 'package:ts_system/modules/tasks/add_task/presentation/bloc/bloc/add_task_event.dart';
import 'package:ts_system/modules/tasks/add_task/presentation/bloc/bloc/add_task_state.dart';
import 'package:ts_system/modules/tasks/add_task/presentation/widgets/appbar_add_task.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common/app_input_validations.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/common/custom_dropdown.dart';
import 'package:ts_system/utils/common/custom_snackbar_service.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_string.dart';
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
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        UIHelpers.hideKeyBoard();
        serviceLocator<AppRouter>().pop();
      },
      child: BlocProvider(
        create: (context) => AddTaskBloc(),
        child: BlocConsumer<AddTaskBloc, AddTaskState>(
          listener: (context, state) {
            if (state is AddTaskSuccess) {
              serviceLocator<CustomSnackBarService>()
                  .showSuccessSnackBar(context, message: state.message);

              serviceLocator<AppRouter>().popAndPush(const TaskDashboard());
            } else if (state is AddTaskFailure) {
              serviceLocator<CustomSnackBarService>().showWarningSnackBar(
                  context,
                  message: AppUtils.resourceErrorMessage);
            } else if (state is AddTaskError) {
              serviceLocator<CustomSnackBarService>()
                  .showErrorSnackBar(context, message: state.message);
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: TTColors.white,
              appBar: const PreferredSize(
                  preferredSize: Size(double.infinity, 64),
                  child: AddTaskAppbar()),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Form(
                    key: BlocProvider.of<AddTaskBloc>(context).formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CheckboxMenuButton(
                            value: isWholeDaySelected,
                            onChanged: (value) {
                              setState(() {
                                isWholeDaySelected = value ?? false;
                                if (isWholeDaySelected) {
                                  BlocProvider.of<AddTaskBloc>(context)
                                      .startTimeController
                                      .text = startTime.format(context);
                                  BlocProvider.of<AddTaskBloc>(context)
                                      .endTimeController
                                      .text = endTime.format(context);
                                  calculateDuration();
                                } else {
                                  BlocProvider.of<AddTaskBloc>(context)
                                      .startTimeController
                                      .clear();
                                  BlocProvider.of<AddTaskBloc>(context)
                                      .endTimeController
                                      .clear();
                                  startTime = TimeOfDay.now();
                                  endTime = TimeOfDay.now();

                                  final start = DateTime(2024, 1, 1,
                                      startTime.hour, startTime.minute);
                                  final end = DateTime(
                                      2024, 1, 1, endTime.hour, endTime.minute);

                                  final duration = end.difference(start);

                                  durationText =
                                      'Duration: ${(duration.inHours).toString().padLeft(2, '0')} Hours';
                                }
                              });
                            },
                            child:
                                Text('Whole Day', style: TTypography.normal)),
                        UIHelpers.verticalSpaceTiny,
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
                                      controller:
                                          BlocProvider.of<AddTaskBloc>(context)
                                              .startTimeController,
                                      trailing: const Icon(
                                        Icons.timer,
                                        color: TTColors.primary,
                                      ),
                                      trailingTapped: () async {
                                        final addTaskBloc =
                                            BlocProvider.of<AddTaskBloc>(
                                                context);
                                        if (!isWholeDaySelected) {
                                          TimeOfDay? pickedDate =
                                              await showTimePicker(
                                                  context: context,
                                                  initialTime: startTime);

                                          if (pickedDate != null) {
                                            startTime = pickedDate;
                                            addTaskBloc
                                                    .startTimeController.text =
                                                startTime.format(context);
                                            calculateDuration();
                                          }
                                        } else {
                                          CustomSnackBarService()
                                              .showWarningSnackBar(context,
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
                                      controller:
                                          BlocProvider.of<AddTaskBloc>(context)
                                              .endTimeController,
                                      trailing: const Icon(
                                        Icons.timer,
                                        color: TTColors.primary,
                                      ),
                                      trailingTapped: () async {
                                        final addTaskBloc =
                                            BlocProvider.of<AddTaskBloc>(
                                                context);
                                        if (!isWholeDaySelected) {
                                          TimeOfDay? pickedDate =
                                              await showTimePicker(
                                                  context: context,
                                                  initialTime: endTime);
                                          if (pickedDate != null) {
                                            if (!isWholeDaySelected) {
                                              endTime = pickedDate;
                                              addTaskBloc
                                                      .endTimeController.text =
                                                  endTime.format(context);
                                              calculateDuration();
                                            }
                                          }
                                        } else {
                                          CustomSnackBarService()
                                              .showWarningSnackBar(context,
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
                        UIHelpers.verticalSpaceSmall,
                        AppInputField(
                          hint: 'Insert Task Name',
                          label: 'Task Name',
                          controller: BlocProvider.of<AddTaskBloc>(context)
                              .taskNameController,
                          validator: (value) => Validations.requireField(value),
                        ),
                        UIHelpers.verticalSpaceSmall,
                        AppInputField(
                          label: 'Task Description',
                          hint: 'Insert Task Description',
                          maxLines: 5,
                          controller: BlocProvider.of<AddTaskBloc>(context)
                              .taskDescController,
                          validator: (value) => Validations.requireField(value),
                        ),
                        UIHelpers.verticalSpaceMedium,
                        SizedBox(
                          width: double.infinity,
                          child: CustomElevatedButton(
                              onPressed: () {
                                if (BlocProvider.of<AddTaskBloc>(context)
                                        .formKey
                                        .currentState
                                        ?.validate() ==
                                    true) {
                                  BlocProvider.of<AddTaskBloc>(context)
                                      .add(AddTaskInitialEvent());
                                } else {
                                  serviceLocator<CustomSnackBarService>()
                                      .showWarningSnackBar(context,
                                          message: "Something went wrong!!");
                                }
                              },
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
            );
          },
        ),
      ),
    );
  }
}

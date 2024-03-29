import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/services/shared_preference.dart';
import 'package:ts_system/modules/tasks/add_task/data/models/add_task_request_model.dart';
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
  final customSnackBarService = serviceLocator<CustomSnackBarService>();

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
                        Row(
                          children: [
                            Checkbox(
                                visualDensity: const VisualDensity(
                                    horizontal: -4, vertical: -4),
                                side: const BorderSide(
                                    color: TTColors.primary, width: 2),
                                activeColor: TTColors.primary,
                                value: BlocProvider.of<AddTaskBloc>(context,
                                        listen: false)
                                    .automaticTimeSelection,
                                onChanged: (value) {
                                  setState(() {
                                    BlocProvider.of<AddTaskBloc>(context)
                                        .automaticTimeSelection = value!;
                                  });
                                  if (BlocProvider.of<AddTaskBloc>(context)
                                      .automaticTimeSelection) {
                                    BlocProvider.of<AddTaskBloc>(context)
                                            .startTimeController
                                            .text =
                                        BlocProvider.of<AddTaskBloc>(context)
                                            .generateTimeSlots()[37];
                                    BlocProvider.of<AddTaskBloc>(context)
                                            .endTimeController
                                            .text =
                                        BlocProvider.of<AddTaskBloc>(context)
                                            .generateTimeSlots()
                                            .last;

                                    BlocProvider.of<AddTaskBloc>(context)
                                        .updateTotalDuration();
                                  } else {
                                    BlocProvider.of<AddTaskBloc>(context)
                                            .startTimeController
                                            .text =
                                        BlocProvider.of<AddTaskBloc>(context)
                                            .generateTimeSlots()[0];
                                    BlocProvider.of<AddTaskBloc>(context)
                                            .endTimeController
                                            .text =
                                        BlocProvider.of<AddTaskBloc>(context)
                                            .generateTimeSlots()[0];

                                    BlocProvider.of<AddTaskBloc>(context)
                                        .updateTotalDuration();
                                  }
                                }),
                            UIHelpers.horizontalSpaceTiny,
                            Text('Whole Day', style: TTypography.normal),
                          ],
                        ),
                        UIHelpers.verticalSpaceMedium,
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
                                    UIHelpers.verticalSpaceTiny,
                                    CustomSearchDropdown(
                                      hintText: 'Select',
                                      validator: (value) {
                                        if (value == "" ||
                                            value == "Select" ||
                                            value == null) {
                                          return "* Required";
                                        }
                                        return null;
                                      },
                                      isEnable: !BlocProvider.of<AddTaskBloc>(
                                              context,
                                              listen: false)
                                          .automaticTimeSelection,
                                      onChanged: (value) {
                                        setState(() {
                                          BlocProvider.of<AddTaskBloc>(context)
                                              .startTimeController
                                              .text = value ?? "00:00";

                                          BlocProvider.of<AddTaskBloc>(context)
                                              .endTimeController
                                              .text = 'Select';

                                          BlocProvider.of<AddTaskBloc>(context)
                                              .updateTotalDuration();
                                        });
                                      },
                                      items:
                                          BlocProvider.of<AddTaskBloc>(context)
                                              .generateTimeSlots(),
                                      selectedValue:
                                          BlocProvider.of<AddTaskBloc>(context,
                                                  listen: false)
                                              .startTimeController
                                              .text,
                                      showSearchBox: false,
                                      isMenu: true,
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
                                    UIHelpers.verticalSpaceTiny,
                                    CustomSearchDropdown(
                                      isEnable: !BlocProvider.of<AddTaskBloc>(
                                              context,
                                              listen: false)
                                          .automaticTimeSelection,
                                      onChanged: (value) {
                                        if (BlocProvider.of<AddTaskBloc>(
                                                context,
                                                listen: false)
                                            .startTimeController
                                            .text
                                            .isNotEmpty) {
                                          setState(() {
                                            BlocProvider.of<AddTaskBloc>(
                                                    context)
                                                .endTimeController
                                                .text = value ?? "00:00";
                                          });

                                          BlocProvider.of<AddTaskBloc>(context)
                                              .updateTotalDuration();
                                        }
                                      },
                                      hintText: 'Select',
                                      validator: (value) {
                                        if (value == "" ||
                                            value == "Select" ||
                                            value == null) {
                                          return "* Required";
                                        }
                                        return null;
                                      },
                                      items:
                                          BlocProvider.of<AddTaskBloc>(context)
                                              .generateEndTimeSlots(
                                                  BlocProvider.of<AddTaskBloc>(
                                                          context)
                                                      .startTimeController
                                                      .text),
                                      selectedValue:
                                          BlocProvider.of<AddTaskBloc>(context,
                                                  listen: false)
                                              .endTimeController
                                              .text,
                                      showSearchBox: false,
                                      isMenu: true,
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
                            Text(
                                "Duration : ${BlocProvider.of<AddTaskBloc>(context, listen: false).totalDurationController.text}"),
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
                                if (BlocProvider.of<AddTaskBloc>(context,
                                                listen: false)
                                            .formKey
                                            .currentState
                                            ?.validate() ==
                                        true &&
                                    BlocProvider.of<AddTaskBloc>(context,
                                            listen: false)
                                        .startTimeController
                                        .text
                                        .isNotEmpty &&
                                    BlocProvider.of<AddTaskBloc>(context,
                                            listen: false)
                                        .endTimeController
                                        .text
                                        .isNotEmpty) {
                                  BlocProvider.of<AddTaskBloc>(context).add(
                                      AddTaskInitialEvent(
                                          addTaskRequestModel:
                                              AddTaskRequestModel(
                                    tmshTitle: BlocProvider.of<AddTaskBloc>(
                                            context,
                                            listen: false)
                                        .taskNameController
                                        .text,
                                    tmshDescription:
                                        BlocProvider.of<AddTaskBloc>(context,
                                                listen: false)
                                            .taskDescController
                                            .text,
                                    tmshMemberId: serviceLocator<
                                            SharedPreferenceService>()
                                        .empID,
                                    tmshGroupId:
                                        BlocProvider.of<AddTaskBloc>(context)
                                            .groupId,
                                    tmshStartTime: DateTimeFormat(
                                        context,
                                        BlocProvider.of<AddTaskBloc>(context,
                                                listen: false)
                                            .startTimeController
                                            .text),
                                    tmshEndTime: DateTimeFormat(
                                        context,
                                        BlocProvider.of<AddTaskBloc>(context,
                                                listen: false)
                                            .endTimeController
                                            .text),
                                  )));
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

  DateTime DateTimeFormat(BuildContext context, String date) {
    return DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        int.parse(date.split(":")[0]),
        int.parse(
          date.split(":")[1],
        ),
        DateTime.now().second);
  }
}

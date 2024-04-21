import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/services/shared_preference.dart';
import 'package:ts_system/modules/tasks/add_task/data/models/add_task_request_model.dart';
import 'package:ts_system/modules/tasks/add_task/data/models/update_request_model.dart';
import 'package:ts_system/modules/tasks/add_task/domain/entities/group_attributes_item.dart';
import 'package:ts_system/modules/tasks/add_task/presentation/bloc/bloc/add_task_bloc.dart';
import 'package:ts_system/modules/tasks/add_task/presentation/bloc/bloc/add_task_event.dart';
import 'package:ts_system/modules/tasks/add_task/presentation/bloc/bloc/add_task_state.dart';
import 'package:ts_system/modules/tasks/add_task/presentation/widgets/appbar_add_task.dart';
import 'package:ts_system/modules/tasks/task_dashboard/domain/entities/task_attributes_item.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/bloc/bloc/task_bloc.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/bloc/bloc/task_event.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/bloc/bloc/task_state.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common/app_input_validations.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/common/custom_dropdown.dart';
import 'package:ts_system/utils/common/custom_snackbar_service.dart';
import 'package:ts_system/utils/common_widgets/loading_widget.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_string.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class AddTaskMobileView extends StatefulWidget {
  final bool? isEditing;
  final TaskAttributesItems? taskAttributesItems;
  const AddTaskMobileView({
    super.key,
    required this.isEditing,
    this.taskAttributesItems,
  });

  @override
  State<AddTaskMobileView> createState() => _AddTaskMobileViewState();
}

class _AddTaskMobileViewState extends State<AddTaskMobileView> {
  final customSnackBarService = serviceLocator<CustomSnackBarService>();
  String? groupId;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        UIHelpers.hideKeyBoard();
        serviceLocator<AppRouter>().replace(const TaskDashboard());
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AddTaskBloc(),
          ),
          BlocProvider(
            create: (context) => TaskBloc()
              ..add(
                TaskInitialEvent(
                    employeeUID: widget.taskAttributesItems?.tmshId ?? "",
                    dateList: DateFormat("yyyy-MM-dd").format(
                      widget.taskAttributesItems?.tmshDate ?? DateTime.now(),
                    )),
              ),
          )
        ],
        child: BlocConsumer<AddTaskBloc, AddTaskState>(
          listener: (context, state) {
            if (state is AddTaskSuccess) {
              serviceLocator<CustomSnackBarService>().showSuccessSnackBar(
                context,
                message: state.responseAttributesItems?.message ?? "",
              );
            } else if (state is AddTaskFailure) {
              serviceLocator<CustomSnackBarService>().showWarningSnackBar(
                  context,
                  message: AppUtils.resourceErrorMessage);
            } else if (state is AddTaskError) {
              serviceLocator<CustomSnackBarService>().showErrorSnackBar(
                context,
                message: state.responseAttributesItems?.message ?? "",
              );
            } else if (state is UpdateTaskSuccess) {
              serviceLocator<CustomSnackBarService>().showSuccessSnackBar(
                context,
                message: state.responseAttributesItems?.message ?? "",
              );
            } else if (state is UpdateTaskFailure) {
              serviceLocator<CustomSnackBarService>().showWarningSnackBar(
                  context,
                  message: AppUtils.resourceErrorMessage);
            } else if (state is UpdateTaskError) {
              serviceLocator<CustomSnackBarService>().showErrorSnackBar(
                context,
                message: state.responseAttributesItems?.message ?? "",
              );
            }
          },
          builder: (context, state) {
            if (widget.isEditing == true) {
              BlocProvider.of<AddTaskBloc>(context).taskNameController.text =
                  widget.taskAttributesItems?.tmshTitle ?? "";
              BlocProvider.of<AddTaskBloc>(context).taskDescController.text =
                  widget.taskAttributesItems?.tmshDescription ?? "";
              groupId = widget.taskAttributesItems?.tmshGroupId ?? "";
              BlocProvider.of<AddTaskBloc>(context).startTimeController.text =
                  DateFormat("yyyy-MM-dd").format(
                      widget.taskAttributesItems?.tmshStartTime ??
                          DateTime.now());
              BlocProvider.of<AddTaskBloc>(context).endTimeController.text =
                  DateFormat("yyyy-MM-dd").format(
                      widget.taskAttributesItems?.tmshEndTime ??
                          DateTime.now());

              BlocProvider.of<AddTaskBloc>(context).updateTotalDuration();
            }

            return Scaffold(
              backgroundColor: TTColors.white,
              appBar: PreferredSize(
                  preferredSize: const Size(double.infinity, 64),
                  child: AddTaskAppbar(
                    isEditing: widget.isEditing,
                  )),
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
                                value: widget.isEditing == false
                                    ? BlocProvider.of<AddTaskBloc>(context,
                                            listen: false)
                                        .automaticTimeSelection
                                    : true,
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
                                      isEnable: widget.isEditing == true
                                          ? widget.isEditing == true
                                              ? false
                                              : true
                                          : !BlocProvider.of<AddTaskBloc>(
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
                                      selectedValue: widget.isEditing == true
                                          ? DateFormat('HH:mm').format(widget
                                                  .taskAttributesItems
                                                  ?.tmshStartTime ??
                                              DateTime.now())
                                          : BlocProvider.of<AddTaskBloc>(
                                                  context,
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
                                      isEnable: widget.isEditing == true
                                          ? widget.isEditing == true
                                              ? false
                                              : true
                                          : !BlocProvider.of<AddTaskBloc>(
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
                                      items: widget.isEditing == true
                                          ? BlocProvider.of<AddTaskBloc>(
                                                  context)
                                              .generateEndTimeSlots("")
                                          : BlocProvider.of<AddTaskBloc>(
                                                  context)
                                              .generateEndTimeSlots(
                                                  BlocProvider.of<AddTaskBloc>(
                                                          context)
                                                      .startTimeController
                                                      .text),
                                      selectedValue: widget.isEditing == true
                                          ? DateFormat('HH:mm').format(widget
                                                  .taskAttributesItems
                                                  ?.tmshEndTime ??
                                              DateTime.now())
                                          : BlocProvider.of<AddTaskBloc>(
                                                  context,
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
                        widget.isEditing == true
                            ? BlocProvider(
                                create: (context) => TaskBloc()
                                  ..add(GroupIdEvent(
                                      grpId: widget.taskAttributesItems
                                              ?.tmshGroupId ??
                                          "")),
                                child: BlocBuilder<TaskBloc, TaskState>(
                                  builder: (context, state) {
                                    if (state is GroupIdSuccess) {
                                      return CustomSearchDropdown(
                                        isEnable: widget.isEditing == true
                                            ? false
                                            : true,
                                        items: const [],
                                        showSearchBox: false,
                                        selectedValue: state
                                                .groupAttributesItems
                                                ?.grpName ??
                                            "Training Lead",
                                      );
                                    }
                                    return LoadingWidget(
                                        width: double.infinity, height: 50);
                                  },
                                ),
                              )
                            : BlocProvider(
                                create: (context) =>
                                    AddTaskBloc()..add(GroupEvent()),
                                child: BlocBuilder<AddTaskBloc, AddTaskState>(
                                  builder: (context, state) {
                                    if (state is GroupSuccess) {
                                      List<GroupAttributesItems?>
                                          messNameItems =
                                          state.groupAttributesItems;
                                      Map<String, String> groupIdMap = {};
                                      for (var item in messNameItems) {
                                        groupIdMap[item?.grpName ?? ""] =
                                            item?.grpId ?? "";
                                      }
                                      return CustomSearchDropdown(
                                        items: groupIdMap.keys.toList(),
                                        showSearchBox: false,
                                        isMenu: true,
                                        onChanged: (value) {
                                          setState(() {
                                            groupId = groupIdMap[value]!;
                                          });
                                        },
                                        hintText: 'Select Group Name',
                                      );
                                    } else {
                                      return const LoadingWidget(
                                          width: double.infinity, height: 50);
                                    }
                                  },
                                ),
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
                                        .isNotEmpty &&
                                    widget.isEditing == false) {
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
                                    tmshGroupId: groupId,
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
                                } else if (BlocProvider.of<AddTaskBloc>(context,
                                                listen: false)
                                            .formKey
                                            .currentState
                                            ?.validate() ==
                                        true &&
                                    widget.isEditing == true) {
                                  BlocProvider.of<AddTaskBloc>(context)
                                      .add(UpdateTaskInitialEvent(
                                          updateTaskModel: UpdateTaskModel(
                                    tmshId:
                                        widget.taskAttributesItems?.tmshId ??
                                            "",
                                    tmshTitle:
                                        BlocProvider.of<AddTaskBloc>(context)
                                            .taskNameController
                                            .text,
                                    tmshDescription:
                                        BlocProvider.of<AddTaskBloc>(context)
                                            .taskDescController
                                            .text,
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
                              child: Text(widget.isEditing == true
                                  ? 'Update Changes'
                                  : 'Save Changes')),
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

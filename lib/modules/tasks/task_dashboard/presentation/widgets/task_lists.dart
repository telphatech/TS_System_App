import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/services/shared_preference.dart';
import 'package:ts_system/modules/tasks/task_dashboard/domain/entities/task_attributes_item.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/bloc/bloc/task_bloc.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/bloc/bloc/task_event.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/bloc/bloc/task_state.dart';
import 'package:ts_system/modules/tasks/task_dashboard/presentation/widgets/calculate_duration.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class TaskLists extends StatelessWidget {
  List<TaskAttributesItems?> taskAttributesItems = [];
  final sharedPreferenceService = serviceLocator<SharedPreferenceService>();

  TaskLists({super.key, required this.taskAttributesItems});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: RefreshIndicator(
        onRefresh: () async {
          DateTime selectedDate =
              BlocProvider.of<TaskBloc>(context, listen: false).getSelectedDate;

          BlocProvider.of<TaskBloc>(context).add(TaskInitialEvent(
              employeeUID: sharedPreferenceService.empID,
              dateList: DateFormat("yyyy-MM-dd").format(selectedDate)));
        },
        child: ListView.builder(
          itemCount: taskAttributesItems.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final item = taskAttributesItems[index];
            return Container(
              width: double.infinity,
              margin:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: TTColors.lightContainer,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.only(
                  top: 5, bottom: 10, left: 10, right: 10),
              child: Column(
                children: [
                  UIHelpers.verticalSpaceTiny,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.task, size: 20, color: TTColors.primary),
                      UIHelpers.horizontalSpaceTiny,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectionColor: TTColors.primary,
                              item?.tmshTitle ?? "",
                              style: TTypography.normal
                                  .copyWith(color: TTColors.primary),
                            ),
                            BlocProvider(
                              create: (context) => TaskBloc()
                                ..add(GroupIdEvent(
                                    grpId: item?.tmshGroupId ?? "1")),
                              child: BlocBuilder<TaskBloc, TaskState>(
                                builder: (context, state) {
                                  if (state is GroupSuccess) {
                                    return Text(
                                      state.groupAttributesItems?.grpName ??
                                          "Training Team",
                                      style: TTypography.normal.copyWith(
                                          color: TTColors.black, fontSize: 14),
                                      overflow: TextOverflow.clip,
                                    );
                                  } else {
                                    return Text(
                                      "Training Team",
                                      style: TTypography.normal.copyWith(
                                          color: TTColors.black, fontSize: 14),
                                      overflow: TextOverflow.clip,
                                    );
                                  }
                                },
                              ),
                            ),
                            UIHelpers.verticalSpaceMedium,
                            Text(
                                "${DateFormat("hh:mm a").format(item?.tmshStartTime ?? DateTime.now())} - ${DateFormat("hh:mm a").format(item?.tmshEndTime ?? DateTime.now())}",
                                style: TTypography.normal.copyWith(
                                    fontSize: 14,
                                    color: TTColors.black,
                                    fontWeight: FontWeight.bold)),
                            UIHelpers.verticalSpaceSmall,
                            Text(
                                calculateDuration(
                                    item?.tmshStartTime, item?.tmshEndTime),
                                style: TTypography.normal.copyWith(
                                    fontSize: 14,
                                    color: TTColors.black,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      // Spacer(),
                      if (BlocProvider.of<TaskBloc>(context).isCurrentDate)
                        PopupMenuButton<String>(
                          onSelected: (value) async {
                            if (value == 'edit') {
                              // widget.onEditTaskDetailsTap!();
                            } else if (value == 'delete') {
                              //  widget.onDeleteTaskDetailsTap!();
                            }
                          },
                          itemBuilder: (BuildContext context) => [
                            const PopupMenuItem<String>(
                              value: 'edit',
                              child: ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('Edit'),
                              ),
                            ),
                            const PopupMenuItem<String>(
                              value: 'delete',
                              child: ListTile(
                                leading: Icon(Icons.delete),
                                title: Text('Delete'),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ts_system/core/network/log.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/tasks/task_dashboard/data/models/group.dart';
import 'package:ts_system/modules/tasks/task_dashboard/data/models/task.dart';
import 'package:ts_system/modules/tasks/task_dashboard/domain/entities/group_attributes_item.dart';
import 'package:ts_system/modules/tasks/task_dashboard/domain/entities/task_attributes_item.dart';
import 'package:ts_system/modules/tasks/task_dashboard/domain/usecases/group_usecases.dart';
import 'package:ts_system/modules/tasks/task_dashboard/domain/usecases/task_usecases.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TextEditingController searchBoxController = TextEditingController();
  bool isToday = true;
  DateTime date = DateTime.now();
  List<TaskAttributesItems?> taskAttributesItems = [];
  GroupAttributesItems? groupAttributesItems;
  DateTime getSelectedDate = DateTime.now();
  String message = '';
  bool isCurrentDate = true;

  void setSelectedDate(DateTime selected) {
    getSelectedDate = selected;
  }

  TaskBloc() : super(TaskInitial()) {
    on<TaskEvent>((event, emit) {});

    on<TaskInitialEvent>(taskInitialEvent);
    on<GroupIdEvent>(groupIdEvent);

    on<OnDeleteTask>(onDeleteTaskEvent);
  }

  Future<void> taskInitialEvent(
      TaskInitialEvent event, Emitter<TaskState> emit) async {
    emit(TaskLoading());
    final repository = serviceLocator<TaskUseCase>();
    final response = await repository.invoke({
      "tmsh_member_id": event.employeeUID,
      "tmsh_date": event.dateList,
    });

    DateTime currentDate = DateTime.now();

    bool isSameDay(DateTime date1, DateTime date2) {
      return date1.year == date2.year &&
          date1.month == date2.month &&
          date1.day == date2.day;
    }

    isCurrentDate = isSameDay(currentDate, getSelectedDate);

    if (response.isLeft) {
      emit(TaskFailure());
    } else {
      try {
        final taskModel = taskFromJson(jsonEncode(response.right));

        if (taskModel.isEmpty) {
          emit(TaskEmpty());
        } else {
          taskAttributesItems = taskModel
              .map((e) => TaskAttributesItems(
                    tmshId: e.tmshId ?? "",
                    tmshTitle: e.tmshTitle ?? "",
                    tmshDescription: e.tmshDescription ?? "",
                    tmshMemberId: e.tmshMemberId ?? "",
                    tmshGroupId: e.tmshGroupId ?? "",
                    tmshDate: e.tmshDate ?? DateTime.now(),
                    tmshStartTime: e.tmshStartTime ?? DateTime.now(),
                    tmshEndTime: e.tmshEndTime ?? DateTime.now(),
                    tmshtIsDeleted: e.tmshtIsDeleted ?? "",
                  ))
              .toList();

          emit(TaskSuccess(taskAttributesItems));
        }
      } catch (e) {
        emit(TaskFailure());
        Log.error(e.toString());
      }
    }
  }

  Future<void> groupIdEvent(GroupIdEvent event, Emitter<TaskState> emit) async {
    emit(GroupLoading());

    final groupRepository = serviceLocator<GroupUseCase>();
    final groupResponse = await groupRepository.invoke(event.grpId);

    if (groupResponse.isLeft) {
      emit(GroupFailure());
    } else {
      try {
        final groupModel = groupFromJson(jsonEncode(groupResponse.right));

        groupAttributesItems = GroupAttributesItems(
          grpId: groupModel.grpId ?? "",
          grpName: groupModel.grpName ?? "",
        );

        emit(GroupSuccess(groupAttributesItems));
      } catch (e) {
        emit(GroupFailure());
        Log.error(e.toString());
      }
    }
  }

  Future<void> onDeleteTaskEvent(
      OnDeleteTask event, Emitter<TaskState> emit) async {
    emit(TaskLoading());
  }
}

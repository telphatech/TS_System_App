import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/network/log.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/dashboard/data/models/response_model.dart';
import 'package:ts_system/modules/dashboard/domain/entities/response_attributes.dart';
import 'package:ts_system/modules/tasks/add_task/data/models/group_model.dart';
import 'package:ts_system/modules/tasks/add_task/domain/usecases/add_task_usecase.dart';
import 'package:ts_system/modules/tasks/add_task/domain/entities/group_attributes_item.dart';
import 'package:ts_system/utils/components/tt_string.dart';

import 'add_task_event.dart';
import 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescController = TextEditingController();
  final TextEditingController totalDurationController = TextEditingController();
  bool automaticTimeSelection = false;
  ResponseAttributesItems? responseAttributesItems;
  final formKey = GlobalKey<FormState>();
  List<GroupAttributesItems?> groupAttributesItems = [];

  List<String> generateTimeSlots() {
    return List.generate((24 * 60) ~/ 15, (index) {
      int minutes = index * 15;
      int hour = minutes ~/ 60;
      int minute = minutes % 60;

      String formattedTime =
          '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
      return formattedTime;
    });
  }

  String calculateTimeDifference(String startTime, String endTime) {
    DateFormat format = DateFormat('HH:mm');
    try {
      DateTime start = format.parse(startTime);
      DateTime end = format.parse(endTime);
      if (end.isBefore(start)) {
        end = end.add(const Duration(days: 1));
      }
      Duration difference = end.difference(start);
      int hours = difference.inHours;
      int minutes = difference.inMinutes % 60;
      return '$hours hours $minutes minutes';
    } catch (e) {
      return AppUtils.zeroDuration;
    }
  }

  List<String> generateEndTimeSlots(String startTime) {
    if (startTime.isEmpty) {
      return generateTimeSlots();
    }

    DateTime startDateTime = DateFormat('HH:mm').parse(startTime);

    DateTime adjustedStartTime = startDateTime.add(const Duration(minutes: 15));
    int totalSlots = (24 * 60) ~/ 15;

    return List.generate(totalSlots, (index) {
      int minutes = index * 15;
      DateTime currentTime = adjustedStartTime.add(Duration(minutes: minutes));
      if (currentTime.isAfter(startDateTime)) {
        String formattedTime = DateFormat('HH:mm').format(currentTime);
        return formattedTime;
      } else {
        DateTime updatedTime =
            adjustedStartTime.add(Duration(minutes: minutes + 1));
        String formattedTime = DateFormat('HH:mm').format(updatedTime);
        return formattedTime;
      }
    });
  }

  void updateTotalDuration() {
    String totalDuration = calculateTimeDifference(
        startTimeController.text, endTimeController.text);

    totalDurationController.text = totalDuration;
  }

  AddTaskBloc() : super(AddTaskInitial()) {
    on<AddTaskInitialEvent>(onAddTaskInitialEvent);
    on<UpdateTaskInitialEvent>(onUpdateTaskInitialEvent);
    on<GroupEvent>(onGroupEvent);
    totalDurationController.text = AppUtils.zeroDuration;
    startTimeController.text = generateTimeSlots()[0];
    endTimeController.text = generateTimeSlots()[0];
  }

  FutureOr<void> onGroupEvent(
      GroupEvent event, Emitter<AddTaskState> emit) async {
    emit(GroupLoading());

    final repository = serviceLocator<GroupUseCase>();
    final response = await repository.invoke();

    if (response.isLeft) {
      emit(GroupFailure());
    } else {
      final model = groupModelFromJson(jsonEncode(response.right));
      groupAttributesItems = model
          .map((e) => GroupAttributesItems(
                grpId: e.grpId ?? "",
                grpName: e.grpName ?? "",
                grpInfo: e.grpInfo ?? "",
                grpLead: e.grpLead ?? "",
                grpMember: e.grpMember ?? "",
                grpBlockmember: e.grpBlockmember ?? "",
                grpIsdeleted: e.grpIsdeleted ?? "",
              ))
          .toList();

      emit(GroupSuccess(groupAttributesItems));
    }
  }

  FutureOr<void> onUpdateTaskInitialEvent(
      UpdateTaskInitialEvent event, Emitter<AddTaskState> emit) async {
    emit(UpdateTaskLoading());

    final repository = serviceLocator<UpdateTaskUseCase>();
    final response = await repository.invoke(event.updateTaskModel);

    if (response.isLeft) {
      emit(UpdateTaskFailure());
    } else {
      try {
        final model = responseModelFromJson(jsonEncode(response.right));

        responseAttributesItems = ResponseAttributesItems(
          message: model.message ?? "",
          status: model.message ?? "",
        );

        if (response.right["status"] == "success") {
          taskNameController.clear();
          taskDescController.clear();

          emit(UpdateTaskSuccess(
              responseAttributesItems: responseAttributesItems));
          serviceLocator<AppRouter>().replace(const TaskDashboard());
        } else {
          emit(UpdateTaskError(
              responseAttributesItems: responseAttributesItems));
          print("error");
        }
      } catch (e) {
        emit(UpdateTaskFailure());
        Log.error(e.toString());
      }
    }
  }

  FutureOr<void> onAddTaskInitialEvent(
      AddTaskInitialEvent event, Emitter<AddTaskState> emit) async {
    emit(AddTaskLoading());

    final repository = serviceLocator<AddTaskUseCase>();
    final response = await repository.invoke(event.addTaskRequestModel);

    if (response.isLeft) {
      emit(AddTaskFailure());
    } else {
      try {
        final model = responseModelFromJson(jsonEncode(response.right));

        responseAttributesItems = ResponseAttributesItems(
          message: model.message ?? "",
          status: model.message ?? "",
        );

        if (response.right["status"] == "success") {
          taskNameController.clear();
          taskDescController.clear();
          startTimeController.clear();
          endTimeController.clear();
          totalDurationController.text = AppUtils.zeroDuration;

          emit(
              AddTaskSuccess(responseAttributesItems: responseAttributesItems));
          serviceLocator<AppRouter>().replace(const TaskDashboard());
        } else {
          emit(AddTaskError(responseAttributesItems: responseAttributesItems));
        }
      } catch (e) {
        emit(AddTaskFailure());
        Log.error(e.toString());
      }
    }
  }
}

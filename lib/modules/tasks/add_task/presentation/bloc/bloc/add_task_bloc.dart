import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/core/network/log.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/services/shared_preference.dart';
import 'package:ts_system/modules/tasks/add_task/data/models/add_task_request_model.dart';
import 'package:ts_system/modules/tasks/add_task/domain/usecases/add_task_usecase.dart';

import 'add_task_event.dart';
import 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? groupId;

  AddTaskBloc() : super(AddTaskInitial()) {
    on<AddTaskInitialEvent>(onAddTaskInitialEvent);
  }

  FutureOr<void> onAddTaskInitialEvent(
      AddTaskInitialEvent event, Emitter<AddTaskState> emit) async {
    emit(AddTaskLoading());

    final repository = serviceLocator<AddTaskUseCase>();
    final response = await repository.invoke(AddTaskRequestModel(
      tmshTitle: taskNameController.text,
      tmshDescription: taskDescController.text,
      tmshMemberId: serviceLocator<SharedPreferenceService>().empID,
      tmshGroupId: groupId,
      tmshStartTime: DateTime.tryParse(startTimeController.text),
      tmshEndTime: DateTime.tryParse(endTimeController.text),
    ));

    if (response.isLeft) {
      emit(AddTaskFailure());
    } else {
      try {
        if (response.right["status"] == "success") {
          taskNameController.clear();
          taskDescController.clear();
          startTimeController.clear();
          endTimeController.clear();
          emit(AddTaskSuccess(
              response.right["message"], response.right["status"]));
        } else {
          emit(AddTaskError(
              response.right["message"], response.right["status"]));
        }
      } catch (e) {
        emit(AddTaskFailure());
        Log.error(e.toString());
      }
    }
  }
}

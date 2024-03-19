import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ts_system/modules/tasks/task_dashboard/domain/entities/task_attributes_item.dart';

import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TextEditingController searchBoxController = TextEditingController();
  bool isToday = true;
  DateTime date = DateTime.now();
  TaskAttributesItems? taskAttributesItems;
  DateTime getSelectedDate = DateTime.now();
  String message = '';

  void setSelectedDate(DateTime selected) {
    getSelectedDate = selected;
  }

  final today =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .toIso8601String();
  num duration = 0;

  TaskBloc() : super(TaskInitial()) {
    on<TaskEvent>((event, emit) {});

    on<TaskInitialEvent>(taskInitialEvent);

    on<OnDeleteTask>(onDeleteTaskEvent);
  }

  FutureOr<void> taskInitialEvent(
      TaskInitialEvent event, Emitter<TaskState> emit) async {
    emit(TaskLoading());
    // final repository = serviceLocator<TaskUseCase>();
    // final response = await repository.invoke(TaskRequestModel(
    //   employeeUId: event.employeeUID,
    //   dateList: event.dateList,
    // ));

    // if (response.isLeft) {
    //   emit(TaskBlocFailure());
    // } else {
    //   try {
    //     if (response.right == [] || response.right.length == 0) {
    //       emit(TaskBlocEmpty());
    //     } else {
    //       TaskModel TaskReponseModel;
    //       TaskReponseModel = TaskModel.fromJson(response.right[0]);

    //       TaskResponse = TaskAttributesItems(
    //         active: TaskReponseModel.active ?? false,
    //         archieved: TaskReponseModel.archieved ?? false,
    //         createdBy: TaskReponseModel.createdBy ?? "",
    //         createdByName: TaskReponseModel.createdBy ?? "",
    //         createdOn: TaskReponseModel.createdOn ?? DateTime.now(),
    //         date: TaskReponseModel.date ?? DateTime.now(),
    //         day: TaskReponseModel.day ?? "",
    //         documentType: TaskReponseModel.documentType ?? "",
    //         shiftStartTime: TaskReponseModel.shiftStartTime ?? "",
    //         dayStatus: TaskReponseModel.dayStatus ?? "",
    //         employeeId: TaskReponseModel.employeeId ?? "",
    //         employeeName: TaskReponseModel.employeeName ?? " ",
    //         employeeUId: event.employeeUID,
    //         firstCheckedInTime:
    //             TaskReponseModel.firstCheckedInTime ?? DateTime.now(),
    //         id: TaskReponseModel.id ?? "",
    //         lastCheckedOutTime:
    //             TaskReponseModel.lastCheckedOutTime ?? DateTime.now(),
    //         organizationUId: TaskReponseModel.organizationUId ?? "",
    //         shiftDateString: TaskReponseModel.shiftDateString ?? "",
    //         shiftEndTime: TaskReponseModel.shiftEndTime ?? "",
    //         shiftUId: TaskReponseModel.shiftUId ?? "",
    //         submittedOn: TaskReponseModel.submittedOn ?? DateTime.now(),
    //         tenantUId: TaskReponseModel.tenantUId ?? "",
    //         TaskDateString: TaskReponseModel.TaskDateString ?? DateTime.now(),
    //         uId: TaskReponseModel.uId ?? "",
    //         updatedBy: TaskReponseModel.updatedBy ?? "",
    //         updatedByName: TaskReponseModel.updatedByName ?? "",
    //         updatedOn: TaskReponseModel.updatedOn ?? DateTime.now(),
    //         version: TaskReponseModel.version ?? 0,
    //         taskSlots: TaskReponseModel.taskSlots
    //                 ?.map(
    //                   (e) => TaskSlotAttributeModel(
    //                     from: e.from ?? "",
    //                     projectName: e.projectName ?? "",
    //                     projectUId: e.projectUId ?? "",
    //                     taskUId: e.taskUId ?? "",
    //                     tasks: e.tasks ?? "",
    //                     timeSlots: e.timeSlots ?? "",
    //                     to: e.to ?? "",
    //                     type: e.type ?? "",
    //                   ),
    //                 )
    //                 .toList() ??
    //             [],
    //       );

    //       if (taskAttributesItems == null) {
    //         emit(TaskBlocEmpty());
    //       } else {
    //         emit(TaskBlocSuccess());
    //       }
    //     }
    //   } catch (e) {
    //     emit(TaskBlocFailure());
    //   }
    // }
  }

  DateTime parseFrom({required DateTime date, required String value}) {
    final parts = value.split(":");
    return DateTime(date.year, date.month, date.day, int.parse(parts[0]),
        int.parse(parts[1]));
  }

  FutureOr<void> onDeleteTaskEvent(
      OnDeleteTask event, Emitter<TaskState> emit) async {
    emit(TaskLoading());
  }
}

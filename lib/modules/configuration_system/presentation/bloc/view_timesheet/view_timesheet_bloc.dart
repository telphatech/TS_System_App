import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/configuration_system/domain/usecases/view_timesheet_report_usecase.dart';
import 'package:ts_system/modules/tasks/task_dashboard/data/models/task.dart';
import 'package:ts_system/modules/tasks/task_dashboard/domain/entities/task_attributes_item.dart';

part 'view_timesheet_event.dart';
part 'view_timesheet_state.dart';

class ViewTimesheetBloc extends Bloc<ViewTimesheetEvent, ViewTimesheetState> {
  List<TaskAttributesItems?> viewTimesheetReportList = [];
  ViewTimesheetBloc() : super(ViewTimesheetInitial()) {
    on<ViewTimesheetEvent>((event, emit) {});

    on<ViewTimesheetReportInitialEvent>(onViewTimesheet);
  }

  FutureOr<void> onViewTimesheet(ViewTimesheetReportInitialEvent event,
      Emitter<ViewTimesheetState> emit) async {
    emit(ViewTimesheetLoading());

    final repository = serviceLocator<ViewTimesheetReportUseCase>();
    final response = await repository.invoke();

    if (response.isLeft) {
      emit(ViewTimesheetFailure());
    } else {
      try {
        final model = taskFromJson(jsonEncode(response.right));
        viewTimesheetReportList = model
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

        if (viewTimesheetReportList.isEmpty) {
          emit(ViewTimesheetEmpty());
        } else {
          emit(ViewTimesheetSuccess(
              viewTimesheetReport: viewTimesheetReportList));
        }
      } catch (e) {
        emit(ViewTimesheetFailure());
      }
    }
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/configuration_system/data/models/view_leave_response_model.dart';
import 'package:ts_system/modules/configuration_system/domain/entities/view_leave_attributes_item.dart';
import 'package:ts_system/modules/configuration_system/domain/usecases/view_leave_usecase.dart';

part 'view_leave_event.dart';
part 'view_leave_state.dart';

class ViewLeaveBloc extends Bloc<ViewLeaveEvent, ViewLeaveState> {
  List<ViewLeaveAttributesItems?> viewLeaveAttributesItems = [];
  ViewLeaveBloc() : super(ViewLeaveInitial()) {
    on<ViewLeaveEvent>((event, emit) {});
    on<ViewLeaveInitialEvent>(onLeaveInitialEvent);
  }

  FutureOr<void> onLeaveInitialEvent(
      ViewLeaveInitialEvent event, Emitter<ViewLeaveState> emit) async {
    emit(ViewLeaveLoading());
    final repository = serviceLocator<ViewLeaveUseCase>();
    final response = await repository.invoke();

    if (response.isLeft) {
      emit(ViewLeaveFailure());
    } else {
      try {
        final model =
            viewLeaveResponseModelFromJson(jsonEncode(response.right));

        viewLeaveAttributesItems = model
            .map((e) => ViewLeaveAttributesItems(
                  leaveId: e.leaveId ?? "",
                  leaveEmpId: e.leaveEmpId ?? "",
                  leaveType: e.leaveType ?? "",
                  leaveTo: e.leaveTo ?? DateTime.now(),
                  leaveFrom: e.leaveFrom ?? DateTime.now(),
                  leaveAddedDate: e.leaveAddedDate ?? DateTime.now(),
                  leaveReason: e.leaveReason ?? "",
                  leaveStatus: e.leaveStatus ?? "",
                  leaveIsDeleted: e.leaveIsDeleted ?? "",
                  empName: e.empName ?? "",
                ))
            .toList();

        if (viewLeaveAttributesItems.isEmpty) {
          emit(ViewLeaveEmpty());
        } else {
          emit(ViewLeaveSuccess(viewLeaveReportList: viewLeaveAttributesItems));
        }
      } catch (e) {
        emit(ViewLeaveFailure());
      }
    }
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/configuration_system/data/models/view_attendance_response_model.dart';
import 'package:ts_system/modules/configuration_system/domain/entities/view_attendance_report_attributes_item.dart';
import 'package:ts_system/modules/configuration_system/domain/usecases/view_attendance_report_usecase.dart';

part 'view_attendance_event.dart';
part 'view_attendance_state.dart';

class ViewAttendanceBloc
    extends Bloc<ViewAttendanceEvent, ViewAttendanceState> {
  List<ViewAttendanceReportAttributesItems?> viewAttendanceReportList = [];
  ViewAttendanceBloc() : super(ViewAttendanceInitial()) {
    on<ViewAttendanceEvent>((event, emit) {});

    on<ViewAttendanceReportInitialEvent>(viewAttendanceReport);
  }

  FutureOr<void> viewAttendanceReport(ViewAttendanceReportInitialEvent event,
      Emitter<ViewAttendanceState> emit) async {
    emit(ViewAttendanceLoading());

    final repository = serviceLocator<ViewAttendanceReportUseCase>();
    final response = await repository.invoke();

    if (response.isLeft) {
      emit(ViewAttendanceFailure());
    } else {
      try {
        final model =
            viewAttendanceResponseModelFromJson(jsonEncode(response.right));

        viewAttendanceReportList = model
            .map((e) => ViewAttendanceReportAttributesItems(
                  attId: e.attId ?? "",
                  attMemberId: e.attMemberId ?? "",
                  attDate: e.attDate ?? DateTime.now(),
                  attCheckIn: e.attCheckIn ?? DateTime.now(),
                  attCheckOut: e.attCheckOut ?? DateTime.now(),
                  attIsApproved: e.attIsApproved ?? "",
                  attIsDeleted: e.attIsDeleted ?? "",
                  empName: e.empName ?? "",
                ))
            .toList();

        if (viewAttendanceReportList.isEmpty) {
          emit(ViewAttendanceEmpty());
        } else {
          emit(ViewAttendanceSuccess(
              viewAttendanceReportList: viewAttendanceReportList));
        }
      } catch (e) {
        emit(ViewAttendanceFailure());
      }
    }
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ts_system/core/network/log.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/leave/leave_dashboard/data/models/fetch_count.dart';
import 'package:ts_system/modules/leave/leave_dashboard/data/models/fetch_leave.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/entities/fetch_count_attributes.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/entities/fetch_leave_attributes.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/usecases/fetch_count_usecase.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/usecases/fetch_leave_usecase.dart';

part 'leave_event.dart';
part 'leave_state.dart';

class LeaveBloc extends Bloc<LeaveEvent, LeaveState> {
  List<FetchCountAttributesItems?> fetchCountAttributesItems = [];
  List<FetchLeaveAttributesItems?> fetchLeavesAttributesItems = [];

  LeaveBloc() : super(LeaveInitial()) {
    on<LeaveEvent>((event, emit) {});

    on<LeaveFetchCountEvent>(onLeaveInitialEvent);

    on<LeaveFetchLeavesEvent>(onLeaveFetchLeaves);
  }

  FutureOr<void> onLeaveFetchLeaves(
      LeaveFetchLeavesEvent event, Emitter<LeaveState> emit) async {
    emit(LeaveFetchLeavesLoading());

    final repository = serviceLocator<FetchLeavesUseCase>();
    final response = await repository.invoke(event.memberId);

    if (response.isLeft) {
      emit(LeaveFetchLeavesFailure());
    } else {
      try {
        final model = fetchLeaveModelFromJson(jsonEncode(response.right));

        fetchLeavesAttributesItems = model
            .map((e) => FetchLeaveAttributesItems(
                  leaveType: e.leaveType ?? "",
                  leaveTo: e.leaveTo ?? DateTime.now(),
                  leaveFrom: e.leaveFrom ?? DateTime.now(),
                  leaveReason: e.leaveReason ?? "",
                  leaveStatus: e.leaveStatus ?? "",
                ))
            .toList();

        emit(LeaveFetchLeavesSuccess(fetchLeavesAttributesItems));
      } catch (e) {
        emit(LeaveFetchLeavesFailure());
        Log.debug(e.toString());
      }
    }
  }

  FutureOr<void> onLeaveInitialEvent(
      LeaveFetchCountEvent event, Emitter<LeaveState> emit) async {
    emit(LeaveFetchCountLoading());

    final repository = serviceLocator<FetchCountUseCase>();
    final response = await repository.invoke(event.memberId);

    if (response.isLeft) {
      emit(LeaveFetchCountFailure());
    } else {
      try {
        final model = fetchCountModelFromJson(jsonEncode(response.right));

        fetchCountAttributesItems = model
            .map((e) => FetchCountAttributesItems(
                  leaveType: e.leaveType ?? "",
                  available: e.available ?? 0,
                  total: e.total ?? 0,
                ))
            .toList();

        emit(LeaveFetchCountSuccess(fetchCountAttributesItems));
      } catch (e) {
        emit(LeaveFetchCountFailure());
        Log.debug(e.toString());
      }
    }
  }
}

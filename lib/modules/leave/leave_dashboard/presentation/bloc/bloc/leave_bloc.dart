import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ts_system/core/network/log.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/leave/leave_dashboard/data/models/fetch_count.dart';
import 'package:ts_system/modules/leave/leave_dashboard/data/models/fetch_leave_by_member_id.dart';
import 'package:ts_system/modules/leave/leave_dashboard/data/models/fetch_leave_details.dart';
import 'package:ts_system/modules/leave/leave_dashboard/data/models/fetch_leaves.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/entities/fetch_count_attributes.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/entities/fetch_leave_by_memberid_attributes.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/entities/fetch_leaves_attributes.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/usecases/fetch_count_usecase.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/usecases/fetch_leave_usecase.dart';

part 'leave_event.dart';
part 'leave_state.dart';

class LeaveBloc extends Bloc<LeaveEvent, LeaveState> {
  List<FetchCountAttributesItems?> fetchCountAttributesItems = [];
  List<FetchLeavesAttributesItems?> fetchLeavesAttributesItems = [];
  List<FetchLeaveByMemberIdAttributesItems?>
      fetchLeaveByMemberIdAttributesItems = [];
  FetchLeaveByMemberIdAttributesItems? fetchLeaveDetailsAttributesItems;

  LeaveBloc() : super(LeaveInitial()) {
    on<LeaveEvent>((event, emit) {});

    on<LeaveFetchCountEvent>(onLeaveInitialEvent);

    on<LeaveFetchLeavesByMemberIdEvent>(onLeaveFetchLeaveByMemberId);

    on<LeaveFetchLeavesEvent>(onLeaveFetchLeaves);

    on<LeaveFetchLeaveDetailsEvent>(onLeaveFetchLeaveDetails);
  }

  FutureOr<void> onLeaveFetchLeaveDetails(
      LeaveFetchLeaveDetailsEvent event, Emitter<LeaveState> emit) async {
    emit(LeaveFetchLeaveDetailsLoading());

    final repository = serviceLocator<FetchLeaveDetailsUseCase>();
    final response = await repository.invoke(event.leaveId);

    if (response.isLeft) {
      emit(LeaveFetchLeaveDetailsFailure());
    } else {
      try {
        final model =
            fetchLeaveDetailsModelFromJson(jsonEncode(response.right));

        fetchLeaveDetailsAttributesItems = FetchLeaveByMemberIdAttributesItems(
          leaveId: model.leaveId ?? "",
          empId: model.empId ?? "",
          leaveType: model.leaveType ?? "",
          leaveTo: model.leaveTo ?? DateTime.now(),
          leaveFrom: model.leaveFrom ?? DateTime.now(),
          leaveReason: model.leaveReason ?? "",
          leaveStatus: model.leaveStatus ?? "",
        );

        emit(LeaveFetchLeaveDetailsSuccess(fetchLeaveDetailsAttributesItems));
      } catch (e) {
        emit(LeaveFetchLeaveDetailsFailure());
        Log.debug(e.toString());
      }
    }
  }

  FutureOr<void> onLeaveFetchLeaves(
      LeaveFetchLeavesEvent event, Emitter<LeaveState> emit) async {
    emit(LeaveFetchLeaveByMemberIdLoading());

    final repository = serviceLocator<FetchLeavesUseCase>();
    final response = await repository.invoke();

    if (response.isLeft) {
      emit(LeaveFetchLeavesFailure());
    } else {
      try {
        final model = fetchLeavesModelFromJson(jsonEncode(response.right));

        fetchLeavesAttributesItems = model
            .map((e) => FetchLeavesAttributesItems(
                  leaveId: e.leaveId ?? "",
                  leaveEmpId: e.leaveEmpId ?? "",
                  leaveType: e.leaveType ?? "",
                  leaveTo: e.leaveTo ?? DateTime.now(),
                  leaveFrom: e.leaveFrom ?? DateTime.now(),
                  leaveReason: e.leaveReason ?? "",
                  leaveStatus: e.leaveStatus ?? "",
                ))
            .toList();

        if (fetchLeavesAttributesItems.isEmpty) {
          emit(LeaveFetchLeavesEmpty());
        } else {
          emit(LeaveFetchLeavesSuccess(fetchLeavesAttributesItems));
        }
      } catch (e) {
        emit(LeaveFetchLeavesFailure());
        Log.debug(e.toString());
      }
    }
  }

  FutureOr<void> onLeaveFetchLeaveByMemberId(
      LeaveFetchLeavesByMemberIdEvent event, Emitter<LeaveState> emit) async {
    emit(LeaveFetchLeaveByMemberIdLoading());

    final repository = serviceLocator<FetchLeavesByMemberIdUseCase>();
    final response = await repository.invoke(event.memberId);

    if (response.isLeft) {
      emit(LeaveFetchLeaveByMemberIdFailure());
    } else {
      try {
        final model =
            fetchLeaveByMemberIdModelFromJson(jsonEncode(response.right));

        fetchLeavesAttributesItems = model
            .map((e) => FetchLeavesAttributesItems(
                  leaveId: e.leaveId ?? "",
                  leaveType: e.leaveType ?? "",
                  leaveTo: e.leaveTo ?? DateTime.now(),
                  leaveFrom: e.leaveFrom ?? DateTime.now(),
                  leaveReason: e.leaveReason ?? "",
                  leaveStatus: e.leaveStatus ?? "",
                ))
            .toList();

        if (fetchLeavesAttributesItems.isEmpty) {
          emit(LeaveFetchLeaveByMemberIdEmpty());
        } else {
          emit(LeaveFetchLeaveByMemberIdSuccess(fetchLeavesAttributesItems));
        }
      } catch (e) {
        emit(LeaveFetchLeaveByMemberIdFailure());
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

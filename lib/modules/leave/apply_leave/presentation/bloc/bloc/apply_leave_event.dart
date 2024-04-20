part of 'apply_leave_bloc.dart';

abstract class ApplyLeaveEvent {}

class ApplyLeaveInitialEvent extends ApplyLeaveEvent {
  ApplyLeaveRequestModel? applyLeaveRequestModel;
  DateTime? fromDate;
  DateTime? toDate;
  ApplyLeaveInitialEvent({
    this.applyLeaveRequestModel,
    required this.fromDate,
    required this.toDate,
  });
}

part of 'apply_leave_bloc.dart';

abstract class ApplyLeaveState {}

class ApplyLeaveInitial extends ApplyLeaveState {}

class ApplyLeaveLoading extends ApplyLeaveState {}

class ApplyLeaveFailure extends ApplyLeaveState {}

class ApplyLeaveError extends ApplyLeaveState {
  ResponseAttributesItems? responseAttributesItems;
  ApplyLeaveError({this.responseAttributesItems});
}

class ApplyLeaveSuccess extends ApplyLeaveState {
  ResponseAttributesItems? responseAttributesItems;
  ApplyLeaveSuccess({this.responseAttributesItems});
}

part of 'leave_bloc.dart';

abstract class LeaveState {}

class LeaveInitial extends LeaveState {}

class LeaveLoading extends LeaveState {}

class LeaveFailure extends LeaveState {}

class LeaveSuccess extends LeaveState {}

class LeaveFetchCountInitial extends LeaveState {}

class LeaveFetchCountLoading extends LeaveState {}

class LeaveFetchCountFailure extends LeaveState {}

class LeaveFetchCountSuccess extends LeaveState {
  List<FetchCountAttributesItems?> fetchCountAttributesItems;
  LeaveFetchCountSuccess(this.fetchCountAttributesItems);
}

class LeaveFetchLeavesInitial extends LeaveState {}

class LeaveFetchLeavesLoading extends LeaveState {}

class LeaveFetchLeavesFailure extends LeaveState {}

class LeaveFetchLeavesSuccess extends LeaveState {
  List<FetchLeaveAttributesItems?> fetchLeavesAttributesItems;
  LeaveFetchLeavesSuccess(this.fetchLeavesAttributesItems);
}

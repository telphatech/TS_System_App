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

class LeaveFetchLeaveByMemberIdInitial extends LeaveState {}

class LeaveFetchLeaveByMemberIdLoading extends LeaveState {}

class LeaveFetchLeaveByMemberIdEmpty extends LeaveState {}

class LeaveFetchLeaveByMemberIdFailure extends LeaveState {}

class LeaveFetchLeaveByMemberIdSuccess extends LeaveState {
  List<FetchLeavesAttributesItems?> fetchLeavesAttributesItems;
  LeaveFetchLeaveByMemberIdSuccess(this.fetchLeavesAttributesItems);
}

class LeaveFetchLeavesInitial extends LeaveState {}

class LeaveFetchLeavesLoading extends LeaveState {}

class LeaveFetchLeavesEmpty extends LeaveState {}

class LeaveFetchLeavesFailure extends LeaveState {}

class LeaveFetchLeavesSuccess extends LeaveState {
  List<FetchLeavesAttributesItems?> fetchLeavesAttributesItems;
  LeaveFetchLeavesSuccess(this.fetchLeavesAttributesItems);
}

class LeaveFetchLeaveDetailsInitial extends LeaveState {}

class LeaveFetchLeaveDetailsLoading extends LeaveState {}

class LeaveFetchLeaveDetailsFailure extends LeaveState {}

class LeaveFetchLeaveDetailsSuccess extends LeaveState {
  FetchLeaveByMemberIdAttributesItems? fetchLeavesByMemberIdAttributesItems;
  LeaveFetchLeaveDetailsSuccess(this.fetchLeavesByMemberIdAttributesItems);
}

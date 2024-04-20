part of 'leave_bloc.dart';

abstract class LeaveEvent {}

class LeaveInitialEvent extends LeaveEvent {}

class LeaveFetchCountEvent extends LeaveEvent {
  final String? memberId;
  LeaveFetchCountEvent({this.memberId});
}

class LeaveFetchLeavesEvent extends LeaveEvent {
  final String? memberId;
  LeaveFetchLeavesEvent({this.memberId});
}

class LeaveFetchLeaveDetailsEvent extends LeaveEvent {
  final String? leaveId;
  LeaveFetchLeaveDetailsEvent({this.leaveId});
}

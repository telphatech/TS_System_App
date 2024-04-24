part of 'leave_bloc.dart';

abstract class LeaveEvent {}

class LeaveInitialEvent extends LeaveEvent {}

class LeaveFetchCountEvent extends LeaveEvent {
  final String? memberId;
  LeaveFetchCountEvent({this.memberId});
}

class LeaveFetchLeavesByMemberIdEvent extends LeaveEvent {
  final String? memberId;
  LeaveFetchLeavesByMemberIdEvent({this.memberId});
}

class LeaveFetchLeavesEvent extends LeaveEvent {}

class HolidaysEvent extends LeaveEvent {}

class LeaveFetchLeaveDetailsEvent extends LeaveEvent {
  final String? leaveId;
  LeaveFetchLeaveDetailsEvent({this.leaveId});
}

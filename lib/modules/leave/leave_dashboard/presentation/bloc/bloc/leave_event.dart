part of 'leave_bloc.dart';

abstract class LeaveEvent {}

class LeaveInitialEvent extends LeaveEvent {}

class LeaveFetchCountEvent extends LeaveEvent {
  final String? memberId;
  LeaveFetchCountEvent({this.memberId});
}

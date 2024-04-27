part of 'view_leave_bloc.dart';

abstract class ViewLeaveState {}

class ViewLeaveInitial extends ViewLeaveState {}

class ViewLeaveLoading extends ViewLeaveState {}

class ViewLeaveEmpty extends ViewLeaveState {}

class ViewLeaveFailure extends ViewLeaveState {}

class ViewLeaveSuccess extends ViewLeaveState {
  List<ViewLeaveAttributesItems?> viewLeaveReportList;
  ViewLeaveSuccess({required this.viewLeaveReportList});
}

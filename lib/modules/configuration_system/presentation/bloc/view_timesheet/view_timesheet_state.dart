part of 'view_timesheet_bloc.dart';

abstract class ViewTimesheetState {}

class ViewTimesheetInitial extends ViewTimesheetState {}

class ViewTimesheetLoading extends ViewTimesheetState {}

class ViewTimesheetEmpty extends ViewTimesheetState {}

class ViewTimesheetFailure extends ViewTimesheetState {}

class ViewTimesheetSuccess extends ViewTimesheetState {
  List<TaskAttributesItems?> viewTimesheetReport;
  ViewTimesheetSuccess({required this.viewTimesheetReport});
}

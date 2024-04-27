part of 'view_attendance_bloc.dart';

abstract class ViewAttendanceState {}

class ViewAttendanceInitial extends ViewAttendanceState {}

class ViewAttendanceLoading extends ViewAttendanceState {}

class ViewAttendanceEmpty extends ViewAttendanceState {}

class ViewAttendanceFailure extends ViewAttendanceState {}

class ViewAttendanceSuccess extends ViewAttendanceState {
  List<ViewAttendanceReportAttributesItems?> viewAttendanceReportList;
  ViewAttendanceSuccess({required this.viewAttendanceReportList});
}

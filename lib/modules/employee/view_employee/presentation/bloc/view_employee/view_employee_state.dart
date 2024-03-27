import 'package:ts_system/modules/employee/view_employee/domain/entities/view_employee_attributes_item.dart';

abstract class ViewEmployeeState {}

final class ViewEmployeeInitial extends ViewEmployeeState {}

final class ViewEmployeeEmpty extends ViewEmployeeState {}

final class ViewEmployeeLoading extends ViewEmployeeState {}

final class ViewEmployeeSuccess extends ViewEmployeeState {
  List<ViewEmployeeAttributesItems?> viewEmployeeAttributesItems = [];
  ViewEmployeeSuccess(this.viewEmployeeAttributesItems);
}

final class ViewEmployeeFailure extends ViewEmployeeState {}

class InviteEmployeeInitial extends ViewEmployeeState {}

class InviteEmployeeLoading extends ViewEmployeeState {}

class InviteEmployeeSuccess extends ViewEmployeeState {
  final String message;
  final String status;
  InviteEmployeeSuccess({required this.message, required this.status});
}

class InviteEmployeeError extends ViewEmployeeState {
  final String message;
  final String status;
  InviteEmployeeError({required this.message, required this.status});
}

class InviteEmployeeFailure extends ViewEmployeeState {}

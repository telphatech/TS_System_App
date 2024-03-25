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

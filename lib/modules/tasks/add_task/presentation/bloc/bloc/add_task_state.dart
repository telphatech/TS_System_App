import 'package:ts_system/modules/dashboard/domain/entities/response_attributes.dart';
import 'package:ts_system/modules/tasks/add_task/domain/entities/group_attributes_item.dart';

abstract class AddTaskState {}

class AddTaskInitial extends AddTaskState {}

class AddTaskLoading extends AddTaskState {}

class AddTaskError extends AddTaskState {
  ResponseAttributesItems? responseAttributesItems;
  AddTaskError({this.responseAttributesItems});
}

class AddTaskFailure extends AddTaskState {}

class AddTaskSuccess extends AddTaskState {
  ResponseAttributesItems? responseAttributesItems;

  AddTaskSuccess({this.responseAttributesItems});
}

class UpdateTaskInitial extends AddTaskState {}

class UpdateTaskLoading extends AddTaskState {}

class UpdateTaskError extends AddTaskState {
  ResponseAttributesItems? responseAttributesItems;
  UpdateTaskError({this.responseAttributesItems});
}

class UpdateTaskFailure extends AddTaskState {}

class UpdateTaskSuccess extends AddTaskState {
  ResponseAttributesItems? responseAttributesItems;
  UpdateTaskSuccess({this.responseAttributesItems});
}

class GroupLoading extends AddTaskState {}

class GroupFailure extends AddTaskState {}

class GroupSuccess extends AddTaskState {
  final List<GroupAttributesItems?> groupAttributesItems;
  GroupSuccess(this.groupAttributesItems);
}

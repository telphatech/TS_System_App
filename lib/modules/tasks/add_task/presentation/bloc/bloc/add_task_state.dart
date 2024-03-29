import 'package:ts_system/modules/tasks/add_task/domain/entities/group_attributes_item.dart';

abstract class AddTaskState {}

class AddTaskInitial extends AddTaskState {}

class AddTaskLoading extends AddTaskState {}

class AddTaskSuccess extends AddTaskState {
  final String message;
  final String status;
  AddTaskSuccess(this.message, this.status);
}

class AddTaskError extends AddTaskState {
  final String message;
  final String status;
  AddTaskError(this.message, this.status);
}

class AddTaskFailure extends AddTaskState {}

class GroupLoading extends AddTaskState {}

class GroupSuccess extends AddTaskState {
  final List<GroupAttributesItems?> groupAttributesItems;
  GroupSuccess(this.groupAttributesItems);
}

class GroupFailure extends AddTaskState {}

import 'package:ts_system/modules/tasks/task_dashboard/domain/entities/group_attributes_item.dart';
import 'package:ts_system/modules/tasks/task_dashboard/domain/entities/task_attributes_item.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskEmpty extends TaskState {}

class TaskLoading extends TaskState {}

class TaskSuccess extends TaskState {
  List<TaskAttributesItems?> taskAttributesItems = [];
  TaskSuccess(this.taskAttributesItems);
}

class TaskError extends TaskState {
  final String message;

  TaskError(this.message);
}

class TaskFailure extends TaskState {}

class DeleteTaskLoading extends TaskState {}

class DeleteTaskSuccess extends TaskState {
  final String message;
  DeleteTaskSuccess(this.message);
}

class DeleteTaskError extends TaskState {
  final String message;
  DeleteTaskError(this.message);
}

class DeleteTaskFailure extends TaskState {}

class GroupIdSuccess extends TaskState {
  GroupIdAttributesItems? groupAttributesItems;
  GroupIdSuccess(this.groupAttributesItems);
}

class GroupLoading extends TaskState {}

class GroupFailure extends TaskState {}

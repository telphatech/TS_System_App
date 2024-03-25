import 'package:ts_system/modules/tasks/task_dashboard/domain/entities/group_attributes_item.dart';
import 'package:ts_system/modules/tasks/task_dashboard/domain/entities/task_attributes_item.dart';

abstract class TaskState {}

final class TaskInitial extends TaskState {}

final class TaskEmpty extends TaskState {}

final class TaskLoading extends TaskState {}

final class TaskSuccess extends TaskState {
  List<TaskAttributesItems?> taskAttributesItems = [];
  TaskSuccess(this.taskAttributesItems);
}

final class GroupSuccess extends TaskState {
  GroupAttributesItems? groupAttributesItems;
  GroupSuccess(this.groupAttributesItems);
}

final class GroupLoading extends TaskState {}

final class GroupFailure extends TaskState {}

final class TaskError extends TaskState {
  final String message;

  TaskError(this.message);
}

final class TaskFailure extends TaskState {}

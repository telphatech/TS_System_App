import 'package:ts_system/modules/tasks/add_task/data/models/add_task_request_model.dart';
import 'package:ts_system/modules/tasks/add_task/data/models/update_request_model.dart';

abstract class AddTaskEvent {}

class AddTaskInitialEvent extends AddTaskEvent {
  AddTaskRequestModel addTaskRequestModel;
  AddTaskInitialEvent({required this.addTaskRequestModel});
}

class UpdateTaskInitialEvent extends AddTaskEvent {
  UpdateTaskModel updateTaskModel;
  UpdateTaskInitialEvent({required this.updateTaskModel});
}

class UpdateGroupId extends AddTaskEvent {
  final String groupId;

  UpdateGroupId({required this.groupId});
}

class GroupEvent extends AddTaskEvent {}

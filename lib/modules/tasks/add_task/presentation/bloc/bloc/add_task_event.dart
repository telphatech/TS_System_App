import 'package:ts_system/modules/tasks/add_task/data/models/add_task_request_model.dart';

abstract class AddTaskEvent {}

class AddTaskInitialEvent extends AddTaskEvent {
  AddTaskRequestModel addTaskRequestModel;
  AddTaskInitialEvent({required this.addTaskRequestModel});
}

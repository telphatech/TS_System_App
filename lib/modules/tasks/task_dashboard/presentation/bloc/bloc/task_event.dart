import 'package:ts_system/modules/tasks/task_dashboard/data/models/add_task_request_model.dart';

abstract class TaskEvent {}

class TaskInitialEvent extends TaskEvent {
  final String employeeUID;
  final List<String>? dateList;

  TaskInitialEvent({
    required this.employeeUID,
    this.dateList,
  });
}

class SortTasksEvent extends TaskEvent {
  final String employeeUID;
  final List<String>? dateList;

  SortTasksEvent({
    required this.employeeUID,
    this.dateList,
  });
}

class OnDeleteTask extends TaskEvent {
  final AddTaskRequestModel body;
  final int? index;

  OnDeleteTask(this.body, {this.index});
}

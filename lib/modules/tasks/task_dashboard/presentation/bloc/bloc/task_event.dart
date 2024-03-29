import 'package:ts_system/modules/tasks/task_dashboard/data/models/task.dart';

abstract class TaskEvent {}

class TaskInitialEvent extends TaskEvent {
  final String employeeUID;
  final String dateList;

  TaskInitialEvent({required this.employeeUID, required this.dateList});
}

class GroupIdEvent extends TaskEvent {
  final String grpId;
  GroupIdEvent({required this.grpId});
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
  final String? tmshId;

  OnDeleteTask({this.tmshId});
}

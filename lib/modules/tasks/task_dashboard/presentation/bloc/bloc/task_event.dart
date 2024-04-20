abstract class TaskEvent {}

class TaskInitialEvent extends TaskEvent {
  TaskInitialEvent({required this.employeeUID, required this.dateList});

  final String dateList;
  final String employeeUID;
}

class GroupIdEvent extends TaskEvent {
  GroupIdEvent({required this.grpId});

  final String grpId;
}

class SortTasksEvent extends TaskEvent {
  SortTasksEvent({
    required this.employeeUID,
    this.dateList,
  });

  final List<String>? dateList;
  final String employeeUID;
}

class OnDeleteTask extends TaskEvent {
  OnDeleteTask({this.tmshId});

  final String? tmshId;
}

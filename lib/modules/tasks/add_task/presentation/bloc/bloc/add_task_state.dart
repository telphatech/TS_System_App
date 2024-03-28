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

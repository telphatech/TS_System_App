abstract class TaskState {}

final class TaskInitial extends TaskState {}

final class TaskEmpty extends TaskState {}

final class TaskLoading extends TaskState {}

final class TaskSuccess extends TaskState {}

final class TaskError extends TaskState {
  final String message;

  TaskError(this.message);
}

final class TaskFailure extends TaskState {}

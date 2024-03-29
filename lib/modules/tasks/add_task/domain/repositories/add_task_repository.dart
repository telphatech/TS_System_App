import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/modules/tasks/add_task/data/models/add_task_request_model.dart';

abstract class AddTaskRepository {
  Future<Either<Failure, dynamic>> addTask({
    required AddTaskRequestModel body,
  });
}

abstract class GroupRepository {
  Future<Either<Failure, dynamic>> getGroup();
}

import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/usecase/use_case.dart';
import 'package:ts_system/modules/tasks/task_dashboard/domain/repositories/task_repository.dart';

class TaskUseCase implements UseCaseOneInput {
  @override
  Future<Either<Failure, dynamic>> invoke(body) async {
    return await serviceLocator.get<TaskRepository>().getTask(body);
  }
}

class DeleteTaskUseCase implements UseCaseOneInput {
  @override
  Future<Either<Failure, dynamic>> invoke(tmshId) async {
    return await serviceLocator.get<DeleteTaskRepository>().deleteTask(tmshId);
  }
}

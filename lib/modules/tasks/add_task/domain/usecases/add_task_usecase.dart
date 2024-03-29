import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/usecase/use_case.dart';
import 'package:ts_system/modules/tasks/add_task/data/models/add_task_request_model.dart';
import 'package:ts_system/modules/tasks/add_task/domain/repositories/add_task_repository.dart';

class AddTaskUseCase implements UseCaseOneInput<AddTaskRequestModel, dynamic> {
  @override
  Future<Either<Failure, dynamic>> invoke(AddTaskRequestModel body) async {
    return await serviceLocator.get<AddTaskRepository>().addTask(body: body);
  }
}

class GroupUseCase implements UseCaseNoInput {
  @override
  Future<Either<Failure, dynamic>> invoke() async {
    return await serviceLocator.get<GroupRepository>().getGroup();
  }
}

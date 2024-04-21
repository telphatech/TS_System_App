import 'package:either_dart/either.dart';
import 'package:ts_system/config/flavors.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/network/api_provider.dart';
import 'package:ts_system/modules/tasks/add_task/data/models/add_task_request_model.dart';
import 'package:ts_system/modules/tasks/add_task/data/models/update_request_model.dart';
import 'package:ts_system/modules/tasks/add_task/domain/repositories/add_task_repository.dart';
import 'package:ts_system/utils/components/tt_string.dart';

class AddTaskRepositoryImpl implements AddTaskRepository {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> addTask({
    required AddTaskRequestModel body,
  }) async {
    try {
      final response = await _apiProvider.getData(
        baseUrl: F.apiBaseUrl,
        subUrl: "/api-tmsht-insert.php",
        body: body.toJson(),
      );
      if (response == null) {
        return Left(ServerFailure(message: AppUtils.noResponseFromServerText));
      } else {
        return Right(response);
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

class UpdateTaskRepositoryImpl implements UpdateTaskRepository {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> updateTask({
    required UpdateTaskModel body,
  }) async {
    try {
      final response = await _apiProvider.getData(
        baseUrl: F.apiBaseUrl,
        subUrl: "/api-tmsht-update.php",
        body: body.toJson(),
      );
      if (response == null) {
        return Left(ServerFailure(message: AppUtils.noResponseFromServerText));
      } else {
        return Right(response);
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

class GroupRepositoryImpl implements GroupRepository {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> getGroup() async {
    try {
      final response = await _apiProvider.getData(
        baseUrl: F.apiBaseUrl,
        subUrl: "/api-fetchGrp.php",
      );
      if (response == null) {
        return Left(ServerFailure(message: AppUtils.noResponseFromServerText));
      } else {
        return Right(response);
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

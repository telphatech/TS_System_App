import 'package:either_dart/either.dart';
import 'package:ts_system/config/flavors.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/network/api_provider.dart';
import 'package:ts_system/modules/tasks/task_dashboard/domain/repositories/task_repository.dart';
import 'package:ts_system/utils/components/tt_string.dart';

class TaskRepositoryImpl implements TaskRepository {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> getTask(Map<String, dynamic> body) async {
    try {
      final response = await _apiProvider.getData(
        baseUrl: F.apiBaseUrl,
        subUrl: "/api-tmsht-fetch.php",
        body: body,
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

class DeleteTaskRepositoryImpl implements DeleteTaskRepository {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> deleteTask(String tmshId) async {
    try {
      final response = await _apiProvider.getData(
        baseUrl: F.apiBaseUrl,
        subUrl: "/api-tmsht-delete.php",
        body: {
          "tmsh_id": tmshId,
        },
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

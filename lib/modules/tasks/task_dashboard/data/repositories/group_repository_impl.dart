import 'package:either_dart/either.dart';
import 'package:ts_system/config/flavors.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/network/api_provider.dart';
import 'package:ts_system/modules/tasks/task_dashboard/domain/repositories/group_repository.dart';
import 'package:ts_system/utils/components/tt_string.dart';

class GroupRepositoryImpl implements GroupRepository {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> getGroup(String grpId) async {
    try {
      final response = await _apiProvider.getData(
        baseUrl: F.apiBaseUrl,
        subUrl: "/api-fetchGrpById.php",
        body: {
          "grp_id": grpId,
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

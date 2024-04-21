import 'package:either_dart/either.dart';
import 'package:ts_system/config/flavors.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/network/api_provider.dart';
import 'package:ts_system/modules/leave/apply_leave/data/models/apply_leave_request_model.dart';
import 'package:ts_system/modules/leave/apply_leave/domain/repositories/apply_leave_repository.dart';
import 'package:ts_system/utils/components/tt_string.dart';

class ApplyLeaveRepositoryImpl extends ApplyLeaveRepository {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> applyLeave({
    required ApplyLeaveRequestModel body,
  }) async {
    dynamic response;
    try {
      response = await _apiProvider.getData(
        subUrl: "/api-leave-insert.php",
        baseUrl: F.apiBaseUrl,
        body: body.toJson(),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }

    if (response != null) {
      return Right(response);
    } else {
      return Left(
        ServerFailure(
          message: AppUtils.noResponseFromServerText,
        ),
      );
    }
  }
}

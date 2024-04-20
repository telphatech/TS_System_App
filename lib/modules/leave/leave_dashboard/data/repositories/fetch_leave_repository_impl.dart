import 'package:either_dart/either.dart';
import 'package:ts_system/config/flavors.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/network/api_provider.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/repositories/fetch_leave_repository.dart';
import 'package:ts_system/utils/components/tt_string.dart';

class FetchLeavesRepositoryImpl implements FetchLeavesRepository {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> getFetchLeavesByMemberId(
      String memberId) async {
    try {
      final response = await _apiProvider.getData(
        baseUrl: F.apiBaseUrl,
        subUrl: "/api-fetch-leave-by-member_id.php",
        body: {
          "leave_emp_id": memberId,
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

class FetchLeaveDetailsRepositoryImpl implements FetchLeaveDetailsRepository {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> getFetchLeaveDetailsByLeaveId(
      String leaveId) async {
    try {
      final response = await _apiProvider.getData(
        baseUrl: F.apiBaseUrl,
        subUrl: "/api-fetch-leave-details-by-leave_id.php",
        body: {
          "leave_id": leaveId,
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

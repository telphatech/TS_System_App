import 'package:either_dart/either.dart';
import 'package:ts_system/config/flavors.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/network/api_provider.dart';
import 'package:ts_system/modules/dashboard/data/models/checkin_model.dart';
import 'package:ts_system/modules/dashboard/domain/repositories/checkin_repository.dart';
import 'package:ts_system/modules/dashboard/domain/repositories/checkout_repository.dart';
import 'package:ts_system/utils/components/tt_string.dart';

class CheckInRepositoryImpl extends CheckInRepository {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> checkIn({required CheckInModel body}) async {
    dynamic response;
    try {
      response = await _apiProvider.getData(
          subUrl: "/api-att-insert.php",
          baseUrl: F.apiBaseUrl,
          body: body.toJson());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }

    if (response != null) {
      return Right(response);
    } else {
      return Left(ServerFailure(message: AppUtils.noResponseFromServerText));
    }
  }
}

class CheckOutRepositoryImpl extends CheckOutRepository {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> checkOut(String memberId) async {
    dynamic response;
    try {
      response = await _apiProvider.getData(
          subUrl: "/api-update-att-checkout.php",
          baseUrl: F.apiBaseUrl,
          body: {
            "att_member_id": memberId,
          });
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }

    if (response != null) {
      return Right(response);
    } else {
      return Left(ServerFailure(message: AppUtils.noResponseFromServerText));
    }
  }
}

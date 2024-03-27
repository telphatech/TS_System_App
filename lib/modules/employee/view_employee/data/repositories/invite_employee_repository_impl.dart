import 'package:either_dart/either.dart';
import 'package:ts_system/config/flavors.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/network/api_provider.dart';
import 'package:ts_system/modules/employee/view_employee/data/models/employee_request_model.dart';
import 'package:ts_system/modules/employee/view_employee/domain/repositories/invite_employee_repository.dart';
import 'package:ts_system/utils/components/tt_string.dart';

class InviteEmployeeRepositoryImpl extends InviteEmployeeRepository {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> inviteEmployee(
      {required EmployeeRequestModel body}) async {
    dynamic response;
    try {
      response = await _apiProvider.getData(
          subUrl: "/api-createEmp.php",
          baseUrl: F.apiBaseUrl,
          body: body.toJson());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }

    if (response != null) {
      return Right(response);
    } else {
      return Left(ServerFailure(message: TTStrings.noResponseFromServerText));
    }
  }
}

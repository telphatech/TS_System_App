import 'package:either_dart/either.dart';
import 'package:ts_system/config/flavors.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/network/api_provider.dart';
import 'package:ts_system/modules/login/employee_registration/data/models/employee_register_request_model.dart';
import 'package:ts_system/modules/login/employee_registration/domain/repositories/employee_register_repository.dart';
import 'package:ts_system/utils/components/tt_string.dart';

class EmployeeRegisterRepositoryImpl implements EmployeeRegisterRepository {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> employeeRegister({
    required EmployeeRegisterRequestModel body,
  }) async {
    try {
      final response = await _apiProvider.getData(
        baseUrl: F.apiBaseUrl,
        subUrl: "/api-updateEmpPassword.php",
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

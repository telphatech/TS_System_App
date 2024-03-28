import 'package:either_dart/either.dart';
import 'package:ts_system/config/flavors.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/network/api_provider.dart';
import 'package:ts_system/modules/employee/view_employee/domain/repositories/view_employee_repository.dart';
import 'package:ts_system/utils/components/tt_string.dart';

class ViewEmployeeRepositoryImpl implements ViewEmployeeRepository {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> getEmployees() async {
    try {
      final response = await _apiProvider.getData(
        baseUrl: F.apiBaseUrl,
        subUrl: "/api-fetchEmp.php",
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

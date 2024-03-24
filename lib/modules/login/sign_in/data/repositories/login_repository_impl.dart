import 'package:either_dart/either.dart';
import 'package:ts_system/config/flavors.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/network/api_provider.dart';
import 'package:ts_system/modules/login/sign_in/domain/repositories/login_repository.dart';
import 'package:ts_system/utils/components/tt_string.dart';

class LoginRepositoryImpl implements LoginRepository {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> getEmpLogin(
      Map<String, dynamic> body) async {
    try {
      final response = await _apiProvider.getData(
        baseUrl: F.apiBaseUrl,
        subUrl: "/api-authenticate_Emp.php",
        body: body,
      );
      if (response == null) {
        return Left(ServerFailure(message: TTStrings.noResponseFromServerText));
      } else {
        return Right(response);
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

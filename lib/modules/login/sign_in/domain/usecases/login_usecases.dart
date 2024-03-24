import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/usecase/use_case.dart';
import 'package:ts_system/modules/login/sign_in/domain/repositories/login_repository.dart';

class LoginUseCase implements UseCaseOneInput {
  @override
  Future<Either<Failure, dynamic>> invoke(body) async {
    return await serviceLocator.get<LoginRepository>().getEmpLogin(body);
  }
}

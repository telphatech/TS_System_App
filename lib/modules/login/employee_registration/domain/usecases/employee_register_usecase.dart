import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/usecase/use_case.dart';
import 'package:ts_system/modules/login/employee_registration/data/models/employee_register_request_model.dart';
import 'package:ts_system/modules/login/employee_registration/domain/repositories/employee_register_repository.dart';

class EmployeeRegisterUseCase
    implements UseCaseOneInput<EmployeeRegisterRequestModel, dynamic> {
  @override
  Future<Either<Failure, dynamic>> invoke(
      EmployeeRegisterRequestModel body) async {
    return await serviceLocator
        .get<EmployeeRegisterRepository>()
        .employeeRegister(body: body);
  }
}

import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/modules/login/employee_registration/data/models/employee_register_request_model.dart';

abstract class EmployeeRegisterRepository {
  Future<Either<Failure, dynamic>> employeeRegister({
    required EmployeeRegisterRequestModel body,
  });
}

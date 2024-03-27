import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/modules/employee/view_employee/data/models/employee_request_model.dart';

abstract class InviteEmployeeRepository {
  Future<Either<Failure, dynamic>> inviteEmployee({
    required EmployeeRequestModel body,
  });
}

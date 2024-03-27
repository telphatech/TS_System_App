import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/usecase/use_case.dart';
import 'package:ts_system/modules/employee/view_employee/data/models/employee_request_model.dart';
import 'package:ts_system/modules/employee/view_employee/domain/repositories/invite_employee_repository.dart';

class InviteEmployeeUseCase
    implements UseCaseOneInput<EmployeeRequestModel, dynamic> {
  @override
  Future<Either<Failure, dynamic>> invoke(EmployeeRequestModel body) async {
    return await serviceLocator
        .get<InviteEmployeeRepository>()
        .inviteEmployee(body: body);
  }
}

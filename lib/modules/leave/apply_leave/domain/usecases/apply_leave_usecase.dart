import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/usecase/use_case.dart';
import 'package:ts_system/modules/leave/apply_leave/data/models/apply_leave_request_model.dart';
import 'package:ts_system/modules/leave/apply_leave/domain/repositories/apply_leave_repository.dart';

class ApplyLeaveUseCase
    implements UseCaseOneInput<ApplyLeaveRequestModel, dynamic> {
  @override
  Future<Either<Failure, dynamic>> invoke(ApplyLeaveRequestModel body) async {
    return await serviceLocator.get<ApplyLeaveRepository>().applyLeave(
          body: body,
        );
  }
}

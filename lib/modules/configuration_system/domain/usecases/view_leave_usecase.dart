import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/usecase/use_case.dart';
import 'package:ts_system/modules/configuration_system/domain/repositories/view_leave_repository.dart';

class ViewLeaveUseCase implements UseCaseNoInput {
  @override
  Future<Either<Failure, dynamic>> invoke() async {
    return await serviceLocator.get<ViewLeaveRepository>().viewLeave();
  }
}
